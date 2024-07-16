part of 'create_post_bloc.dart';

class CreatePostState {
  late List<PostModel> posts;
  final bool isLoading;
  final bool isSuccess;
  final String error;

  CreatePostState({
    List<PostModel>? posts,
    this.isLoading = false,
    this.isSuccess = false,
    this.error = '',
  }) {
    this.posts = posts ?? [PostModel()];
  }

  CreatePostState copyWith({
    List<PostModel>? posts,
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return CreatePostState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
