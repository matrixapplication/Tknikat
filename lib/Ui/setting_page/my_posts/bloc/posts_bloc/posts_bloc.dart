import 'package:bloc/bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_state.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import '../../../../../model/post_model/post_model.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final Repository _repository;

  PostsBloc(this._repository) : super(PostsState.init()) {
    on<InitMyPosts>((event, emit) async {
      try {
        emit(state.rebuild((b) => b..isLoading = true));

        final res = await _repository.getMyPosts(1);
        emit(state.rebuild((b) => b
          ..initialized = true
          ..isLoading = false
          // ..postsPaginator.replace(res.paginator!)
          // ..posts.replace(res.content!)
          ..myPostsPaginator.replace(res.paginator!)
          ..myPosts.replace(res.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..initialized = true
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<IncrementCommentCount>((event, emit) {
      final postIndex = state.posts.indexWhere((post) => post.id == event.postId);

      if (postIndex != -1) {
        final updatedPosts = List.of(state.posts);
        final updatedPost = updatedPosts[postIndex].rebuild(
              (b) => b..commentCount = (b.commentCount ?? 0) + 1,
        );
        updatedPosts[postIndex] = updatedPost;

        emit(state.rebuild((b) => b..posts.replaceRange(postIndex, postIndex + 1, [updatedPost])));
      }
    });
    on<InitPosts>((event, emit) async {
      try {
        emit(state.rebuild((b) => b..isLoading = true));
        final res2 = await _repository.getPosts(1);
        emit(state.rebuild((b) => b
          ..initialized = true
          ..isLoading = false
          ..postsPaginator.replace(res2.paginator!)
          ..posts.replace(res2.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..initialized = true
          ..error = e.error.toString()));
      }
    });
    on<ClearState>((event, emit) => emit(state.rebuild((b) => b
      ..error = ''
      ..addSuccess = false
      ..editSuccess = false
      ..removeSuccess = false)));
    on<AddPost>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..addSuccess = false));
      try {
        await _repository.addSubPost(event.description, event.images, event.id);
        final res = await _repository.getMyPosts(1);
        final res2 = await _repository.getPosts(1);

        emit(state.rebuild((b) => b
          ..initialized = true
          ..addSuccess = true
          ..isLoading = false
          ..postsPaginator.replace(res2.paginator!)
          ..posts.replace(res2.content!)
          ..myPostsPaginator.replace(res.paginator!)
          ..myPosts.replace(res.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..addSuccess = false
          ..error = e.error.toString()));
      }
      emit(state.rebuild((b) => b..error = ''));
    });
    on<RemovePost>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..addSuccess = false
        ..editSuccess = false
        ..removeSuccess = false));
      try {
        await _repository.removePost(event.post);
        final res = await _repository.getMyPosts(1);
        final res2 = await _repository.getPosts(1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..removeSuccess = true
          ..postsPaginator.replace(res2.paginator!)
          ..posts.replace(res2.content!)
          ..myPostsPaginator.replace(res.paginator!)
          ..myPosts.replace(res.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..removeSuccess = false
          ..error = e.error.toString()));
      }
      emit(state.rebuild((b) => b..removeSuccess = false));
    });
    on<EditPost>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..editSuccess = false));
      try {
        await _repository.editPost(
          event.id,
          event.description,
          event.images,
          event.imagesToRemove,
          event.subPosts,
        );
        final res = await _repository.getMyPosts(1);
        final res2 = await _repository.getPosts(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..editSuccess = true
          ..postsPaginator.replace(res2.paginator!)
          ..posts.replace(res2.content!)
          ..myPostsPaginator.replace(res.paginator!)
          ..myPosts.replace(res.content!)
          ..editSuccess = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..editSuccess = false
          ..error = e.error.toString()));
      }
      emit(state.rebuild((b) => b..error = ''));
    });
    on<GetNextMyPosts>((event, emit) async {
      final curPage = this.state.myPostsPaginator.currentPage ?? 0;
      if (curPage < (this.state.myPostsPaginator.totalPage??1)) {
        emit(state.rebuild((b) => b..isLoading = true));
        final data = await _repository.getMyPosts(curPage + 1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..myPostsPaginator.replace(data.paginator!)
          ..myPosts.addAll(data.content!)));
      } else {
        emit(state.rebuild((b) => b..isLoading = false));
      }
    });

    on<GetNextPosts>((event, emit) async {
      if (this.state.postsPaginator.currentPage! < this.state.postsPaginator.totalPage!) {
        if (state.isLoading) return;
        emit(state.rebuild((b) => b..isLoading = true));
        final data = await _repository
            .getPosts(this.state.postsPaginator.currentPage! + 1);
        final newPosts = data.content!.where((newPost) =>
        !state.posts.any((existingPost) => existingPost.id == newPost.id)
        ).toList();

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..postsPaginator.replace(data.paginator!)
          ..posts.addAll(newPosts)));
      } else {
        emit(state.rebuild((b) => b..isLoading = false));
      }
    });    on<GetLikePost>((event, emit) async {
      try {
        await _repository.getLikePosts(event.id!);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..posts.map((post) {
            if (post.id == event.id) {
              post = post.rebuild((p0) => p0
                ..isLikedBy = !p0.isLikedBy!
                ..likes =
                    ((p0.likes ?? 0) + ((p0.isLikedBy ?? false) ? 1 : -1)));
            }
            return post;
          })
          ..myPosts.map((post) {
            if (post.id == event.id) {
              post = post.rebuild((p0) => p0
                ..isLikedBy = !p0.isLikedBy!
                ..likes =
                    ((p0.likes ?? 0) + ((p0.isLikedBy ?? false) ? 1 : -1)));
            }
            return post;
          })));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      } catch (e) {
        print(e);
      }
    });
  }
}
