import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import '../../../../../injectoin.dart';
import '../../bloc/posts_bloc/posts_bloc.dart';
import '../../bloc/posts_bloc/posts_event.dart';
import 'post_screen_event.dart';
import 'post_screen_state.dart';

class PostScreenBloc extends Bloc<PostScreenEvent, PostScreenState> {
  Repository _repository;

  PostScreenBloc(this._repository) : super(PostScreenState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetComments>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..success = false));
      try {
        final data = await _repository.getComments("post", event.model_id, 1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(data.paginator!)
          ..comments.replace(data.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<AddComment>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..success = false));
      try {
        await _repository.reviewModel(
          model_type: "post",
          model_id: event.id.toString(),
          review_content: event.comment,
          parent_review: event.parentCommentId,
          user_id: event.repliedUserId,
        );
        final _bloc = sl<PostScreenBloc>();
        _bloc.add(GetComments((b) => b..model_id =  event.id));
        final data = await _repository.getComments("post", event.id, 1);
        // sl<PostsBloc>().add(InitMyPosts());
        emit(state.rebuild((b) => b
          ..paginator.replace(data.paginator!)
          ..comments.replace(data.content!)
          ..success = true
          ..isLoading = false));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..success = false
          ..error = e.error.toString()));
      }
    });
    on<UpdateComment>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..success = false));
      try {
        await _repository.UpdateModel(
         id: event.id,
          content: event.content??''
        );
        final data = await _repository.getComments("post", event.postId, 1);
        // final _bloc = sl<PostScreenBloc>();
        // _bloc.add(GetComments((b) => b..model_id =  event.postId));

        // sl<PostsBloc>().add(InitMyPosts());
        emit(state.rebuild((b) => b
          ..paginator.replace(data.paginator!)
          ..comments.replace(data.content!)
          ..success = true
          ..isLoading = false));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..success = false
          ..error = e.error.toString()));
      }
    });
    on<GetNextComments>((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        emit(state.rebuild((b) => b..isLoading = true));
        final data = await _repository.getComments(
            "post", event.model_id, this.state.paginator.currentPage! + 1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(data.paginator!)
          ..comments.addAll(data.content!)));
      } else {
        emit(state.rebuild((b) => b..isLoading = false));
      }
    });
  }
}
