import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import '../../../injectoin.dart';
import '../../setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'product_content_event.dart';
import 'product_content_state.dart';

class ProductContentBloc
    extends Bloc<ProductContentEvent, ProductContentState> {
  Repository _repository;

  ProductContentBloc(this._repository) : super(ProductContentState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetComments>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      try {
        final data =
            await _repository.getComments("product", event.model_id, 1);
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
    on<UpdateComment>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..success = false));
      try {
        await _repository.UpdateModel(
            id: event.id,
            content: event.content??''
        );
        final data = await _repository.getComments("product", event.postId, 1);
        emit(state.rebuild((b) => b
          ..paginator.replace(data.paginator!)
          ..comments.replace(data.content!)
          ..success = true
          ..isLoading = false));
        // final data = await _repository.getComments("post", event.postId, 1);
        // final _bloc = sl<ProductContentBloc>();
        // _bloc.add(GetComments((b) => b..model_id =  event.postId));
        // emit(state.rebuild((b) => b
        //   ..paginator.replace(data.paginator!)
        //   ..comments.replace(data.content!)
        //   ..success = true
        //   ..isLoading = false));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..success = false
          ..error = e.error.toString()));
      }
    });
    on<AddComment>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      try {
        await _repository.reviewModel(
          model_type: "product",
          model_id: event.id.toString(),
          review_content: event.comment,
          parent_review: event.parentCommentId,
          user_id: event.repliedUserId,
        );
        final data = await _repository.getComments("product", event.id, 1);
        emit(state.rebuild((b) => b
          ..paginator.replace(data.paginator!)
          ..comments.replace(data.content!)
          ..isLoading = false));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<GetNextComments>((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        emit(state.rebuild((b) => b..isLoading = true));
        final data = await _repository.getComments(
            "product", event.model_id, this.state.paginator.currentPage! + 1);
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
