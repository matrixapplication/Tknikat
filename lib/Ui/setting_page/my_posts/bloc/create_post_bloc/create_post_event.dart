part of 'create_post_bloc.dart';

@immutable
abstract class CreatePostEvent {}

class AddSubPost implements CreatePostEvent {
  final PostModel post;

  const AddSubPost(this.post);
}

class EditSubPost implements CreatePostEvent {
  final String? desc;
  final List<File> images;
  final int index;

  const EditSubPost({required this.index, this.desc, this.images = const []});
}

class RemoveSubPost implements CreatePostEvent {
  final int index;

  RemoveSubPost(this.index);
}

class SubmitPost implements CreatePostEvent {}

class ClearState implements CreatePostEvent {
  const ClearState();
}
