import 'package:bloc/bloc.dart';
import 'package:taknikat/Ui/vendor_page/vendor_posts/bloc/vendor_posts_state.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'vendor_posts_event.dart';

class VendorPostBloc extends Bloc<VendorPostsEvent, VendorPostsState> {
  Repository _repository;

  VendorPostBloc(this._repository) : super(VendorPostsState.initail()) {
    on<GetVendorPosts>((event, emit) async {
      try {
        emit(state.rebuild((b) => b..isLoading = true));

        final res = await _repository.getVendorPosts(1, event.id);
        emit(state.rebuild((b) => b
          ..initialized = true
          ..isLoading = false
          ..postsPaginator.replace(res.paginator!)
          ..posts.replace(res.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..initialized = true
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<LikePost>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
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
          })));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      } catch (e) {
        print(e);
      }
    });
    on<GetNextVendorPosts>((event, emit) async {
      if (this.state.postsPaginator.currentPage! <
          this.state.postsPaginator.totalPage!) {
        emit(state.rebuild((b) => b..isLoading = true));
        final data = await _repository.getVendorPosts(
            this.state.postsPaginator.currentPage! + 1, event.id!);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..postsPaginator.replace(data.paginator!)
          ..posts.addAll(data.content!)));
      } else {
        emit(state.rebuild((b) => b..isLoading = false));
      }
    });
  }
}
