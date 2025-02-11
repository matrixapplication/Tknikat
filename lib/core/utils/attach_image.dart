import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/dialog/show_pickup_image_dialog.dart';
String? path;

Future<String?> onPickImagesPressed(BuildContext context) async {
  // Create a Completer to wait for user action
  final Completer<String?> completer = Completer<String?>();

  await showPickUpImageDialog(
    context: context,
    onTapGallery: () async {
      String? selectedPath = await onPickImagesGallery(context);
      Navigator.pop(context);
      print('Selected from gallery: $selectedPath');
      completer.complete(selectedPath); // Complete with the gallery path
    },
    onTapCamera: () async {
      String? selectedPath = await onPickImagesCamera(context); // Replace with a camera-specific method if needed
      Navigator.pop(context);
      print('Selected from camera: $selectedPath');
      completer.complete(selectedPath); // Complete with the camera path
    },
  );

  // Wait until the Completer is completed
  return completer.future;
}



Future<String?> onPickImagesGallery(BuildContext context) async {
  List<PlatformFile>? paths;
  const multiPick = false;
  const filesType = FileType.custom;
  const extensions = 'jpg , png , jpeg';
  FocusManager.instance.primaryFocus!.unfocus();

  try {
    paths = (await FilePicker.platform.pickFiles(
      type: filesType,
      allowMultiple: multiPick,
      allowedExtensions:
      (true) ? extensions.replaceAll(' ', '').split(',') : null,
    ))
        ?.files;
  } on PlatformException catch (e) {
    // log(_tag, "Unsupported operation $e");
  } catch (ex) {

    // log(_tag, ex.toString());
  }

  if (paths != null) {
    // log(_tag, 'onPickImagesPressed ${_paths.map((e) => e.name).toString()}');
    return paths[0].path ?? '';
  } else {
    return null;
  }
}

Future<String?> onPickImagesCamera(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  try {
    image = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
    );
  } catch (e) {
    print('Error picking image from camera: $e');
    return null;
  }

  if (image != null) {
    return image.path; // Return the path of the captured image
  } else {
    return null; // No image was selected or an error occurred
  }
}