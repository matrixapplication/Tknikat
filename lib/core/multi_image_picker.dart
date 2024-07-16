import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';

class MultiImagePicker extends StatefulWidget {
  final List<File> images;

  MultiImagePicker(this.images);

  @override
  _MultiImagePickerState createState() => _MultiImagePickerState();
}

class _MultiImagePickerState extends State<MultiImagePicker> {
  final picker = ImagePicker();

  Future<File?> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    try {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1),
          itemCount: widget.images.length + 1,
          itemBuilder: (context, index) {
            if (widget.images.length == index)
              return InkWell(
                onTap: () async {
                  try {
                    //add
                    var x = await getImage();
                    if (x != null) {
                      setState(() {
                        widget.images.add(x);
                      });
                    }
                  } catch (e) {}
                },
                child: Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 1,
                          color: secondryColor)),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: secondryColor,
                  ),
                ),
              );
            return Container(
              height: 60,
              width: 60,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: FileImage(widget.images[index])),
                        border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: secondryColor)),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.images.removeAt(index);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                      ))
                ],
              ),
            );
          });
    } catch (e) {
      return Center(
        child: Container(
          margin: EdgeInsets.all(30),
          width: sizeAware.width,
          child: Text('Error In Image Picker Try again', style: TextStyle()),
        ),
      );
    }
  }
}
