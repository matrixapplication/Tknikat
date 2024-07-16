import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';

Future<List<File?>> compressImages(List<File> files) {
  return Future.wait(_compress(files)).then((files) {
    if (!(files.every((element) => element != null))) {
      throw Exception();
    }
    return files.cast<File>();
  });
}

List<XFile>? pickFifeImages() {
  ImagePicker().pickMultiImage().then((pickedFile) {
    if (pickedFile != null) {
      if (pickedFile.length > 6) {
        showToast('يجب أن يكون عدد الصور 5 على الأكثر');
        return null;
      }
      return pickedFile;
    }
  });
  return null;
}
//
// Future<File?> pickImage() async {
//   final XFile? pickedFile =
//       await ImagePicker().pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) return File(pickedFile.path);
//   return null;
// }

Iterable<Future<File?>> _compress(List<File> files, {int quality = 60}) sync* {
  for (File file in files) {
    final String filePath = file.path;
    final lastIndex = filePath.lastIndexOf('.');
    final splitted = filePath.substring(0, lastIndex);
    final outPath = "${splitted}_out.jpeg";
    File outFile = File(outPath);
    final compressed = FlutterImageCompress.compressAndGetFile(
      file.path,
      outFile.path,
      quality: quality,
    );

    yield compressed.then((value) => File(value!.path));
  }
}

Future<File?> pickImage({bool cropImage = true}) async {
  final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  final imageFile = pickedImage != null ? File(pickedImage.path) : null;
  if (imageFile != null && cropImage) {
    return _cropImage(imageFile);
  }
  return null;
}

Future<File?> _cropImage(File imageFile) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Taknikat',
          toolbarColor: primaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Taknikat',
      ),
    ],
  );
  if (croppedFile != null) {
    return File(croppedFile.path);
  }
  return null;
}
