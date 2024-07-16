import 'dart:io';
import 'dart:math';

import 'package:reactive_forms/reactive_forms.dart';

const maxImagesByPost = 5;
const maxSubPostsByPost = 4;

class PostImage {
  final String? oldImage;
  final File? newImage;

  const PostImage({this.newImage, this.oldImage})
      : assert(oldImage == null || newImage == null);
}

extension PostImageExt on PostImage {
  bool get isEmpty => newImage == null && oldImage == null;

  bool get isOld => oldImage != null;

  bool get isNew => newImage != null;
}

class UpdatePostModel {
  String? desc;
  int? id;
  List<PostImage> images;
  List<String> removedImages;

  UpdatePostModel({
    this.id,
    this.desc,
    this.images = const [],
    this.removedImages = const [],
  });

  FormGroup get formGroup {
    List<FormControl<PostImage>> _images =
        List.filled(maxImagesByPost, FormControl<PostImage>(), growable: false);
    for (int i = 0; i < min(images.length, maxImagesByPost); i++) {
      _images[i] = FormControl<PostImage>(value: images[i]);
    }
    return FormGroup(
      {
        'id': FormControl<int>(
          value: id,
          validators: [],
        ),
        'desc': FormControl<String>(
          value: desc,
          validators: [
            Validators.required,
            Validators.minLength(1),
          ],
        ),
        'images': FormArray<PostImage>(_images, validators: [
          Validators.required,
          Validators.minLength(1),
          Validators.maxLength(maxImagesByPost),
        ]),
        'removedImages': FormArray<String>([]),
      },
    );
  }

  List<File> get newImagesOnly {
    final List<File> _images = [];

    images.forEach((element) {
      if (element.newImage != null) _images.add(element.newImage!);
    });
    return _images;
  }
}

class SubPostParam {
  String desc;
  int? id;
  List<File> images;
  List<String> removedImages;

  SubPostParam({
    this.id,
    required this.desc,
    this.images = const [],
    this.removedImages = const [],
  });
}
