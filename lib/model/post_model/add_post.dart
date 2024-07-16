library post_model;

import 'dart:io';

import 'package:built_collection/built_collection.dart';

class AddPostModel {
  final List<File> images;

  final String description;

  final BuiltList<AddPostModel> subPosts;

  AddPostModel({
    required this.images,
    required this.description,
    required this.subPosts,
  });
}
