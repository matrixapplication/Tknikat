import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final _repository = sl<Repository>();

  CreatePostBloc() : super(CreatePostState()) {
    on<CreatePostEvent>((event, emit) async {
      if (event is ClearState) {
        emit(state.copyWith(posts: []));
      }
      if (event is AddSubPost) {
        final List<PostModel> newList = List.from(state.posts);
        newList.add(event.post);
        emit(state.copyWith(posts: newList));
      }
      if (event is EditSubPost) {
        List<PostModel> newList = [];
        for (int i = 0; i < state.posts.length; i++) {
          if (i == event.index) {
            final x = state.posts[i].rebuild((b) {
              b.description = event.desc ?? b.description;
              if (event.images.isNotEmpty) {
                b.addedImages.replace(event.images);
              }
              return b;
            });
            newList.add(x);
          } else
            newList.add(state.posts[i]);
        }
        emit(state.copyWith(posts: newList));
      }
      if (event is RemoveSubPost) {
        final newList = state.posts;
        newList.removeAt(event.index);
        emit(state.copyWith(posts: newList));
      }
      if (event is SubmitPost) {
        emit(state.copyWith(isLoading: true, isSuccess: false, error: ''));
        try {
          await _repository.addPost(state.posts);
          emit(state.copyWith(isLoading: false, isSuccess: true));
        } on NetworkException catch (e) {
          emit(state.copyWith(isLoading: false, error: e.error.toString()));
        } catch (e) {
          emit(state.copyWith(isLoading: false, error: 'حدث خطأ ما'));
        }
        emit(state.copyWith(error: ''));
      }
    });
  }
}
