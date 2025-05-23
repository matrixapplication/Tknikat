
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_localizations.dart';
import '../../../core/constent.dart';
import '../../../core/image_place_holder.dart';
import '../../../model/event_model/event_model.dart';
import '../../../model/share_model/share_model.dart';
import '../provider/provider.dart';

class ShareItemWidget extends StatefulWidget {
  final EventModel? event;
  final int id;
  final int? index;
  final int? eventId;
  final void Function(int id)? onTap;
   ShareItemWidget({ this.event, this.eventId, this.onTap, required this.id, this.index, });

  @override
  State<ShareItemWidget> createState() => _ShareItemWidgetState();
}

class _ShareItemWidgetState extends State<ShareItemWidget> {
  File? image;
  String? initialImage;
  String? text;

  @override
  void initState() {
    // initialImage = widget.shareModel?.image;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.read<ShareProvider>();
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
        widget.id!=1?
                  '${widget.id} - ${AppLocalizations.of(context)
                      .translate('description')}':AppLocalizations.of(context).translate('description'),
                  style: theme.textTheme.titleSmall,
                ),
                Spacer(),
                InkWell(
                    onTap:(){
                      widget.onTap!(widget.id);
                      provider.deleteItem(widget.id);
                    },
                    child: Icon(Icons.delete_forever,color: Colors.red,))
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              minLines: 7,
              maxLines: null,
              initialValue: '',
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return AppLocalizations.of(context)
                      .translate('description required');
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                text =value;
                setState(() {

                });
                provider.onDescriptionChanged(value);
                provider.onDescriptionLst(value,widget.index!);
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF1F1F1),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                      BorderRadius.circular(5))),
            ),
            SizedBox(height: 20),
            !provider.isEdit
                ? InkWell(
                onTap: () async {
                  try {
                    image = await pickImage();
                    setState(() {});
                    provider.onImageChanged(image);
                  } catch (e) {}
                },
                child: Stack(
                  children: [
                    Container(
                      height: 235,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            15, 52, 157, 216),
                        borderRadius:
                        BorderRadius.circular(5),
                      ),
                      child: image != null
                          ? Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(image!))),
                      )
                          : Column(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .center,
                        children: [
                          SvgPicture.asset(
                              "assets/images/addButton.svg"),
                          SizedBox(height: 15),
                          Text(
                            'اضافة صورة',
                            style: TextStyle(
                                fontSize: 12,
                                color:
                                primaryColor),
                          ),
                        ],
                      ),
                      //events/share
                    ),
                    if (image != null)
                      Positioned.directional(
                        end: 10,
                        textDirection:
                        Directionality.of(context),
                        top: 10,
                        child: IconButton(
                            onPressed: () {
                              image = null;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      )
                  ],
                ))
                : Stack(
              children: [
                Container(
                    height: 235,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                          15, 52, 157, 216),
                      borderRadius:
                      BorderRadius.circular(5),
                    ),
                    child: Builder(
                      builder: (context) {
                        if (initialImage == null) {
                          return _pickImageWidget();
                        }

                        if (initialImage!
                            .startsWith('http')) {
                          return _networkImageWidget(
                              initialImage!);
                        }
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                File(initialImage!),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                Container(
                  height: 235,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                        100, 51, 51, 51),
                    borderRadius:
                    BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          "assets/images/cameraIcon.svg"),
                      SizedBox(height: 15),
                      Text(
                        'لا يمكن تعديل الصورة',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
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
      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9
      // ],
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
      final provider = context.read<ShareProvider>();
      provider.onImageLst( File(croppedFile.path),widget.id,widget.index!);
      return File(croppedFile.path);

    }
    return null;
  }
  _pickImageWidget() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset("assets/images/addButton.svg"),
      SizedBox(height: 15),
      Text(
        'اضافة صورة',
        style: TextStyle(fontSize: 12, color: primaryColor),
      ),
    ],
  );

  _networkImageWidget(String image) => CachedNetworkImage(
    placeholderFadeInDuration: Duration(seconds: 1),
    errorWidget: (context, url, error) => Container(
      alignment: Alignment.center,
      color: othercolor,
      child: FittedBox(
        child: Icon(Icons.error),
      ),
    ),
    placeholder: (_, __) => ImagePlaceholder.rectangular(),
    imageUrl: image,
    imageBuilder: (context, imageProvider) => CircleAvatar(
      backgroundImage: imageProvider,
      radius: 28,
    ),
  );

}
