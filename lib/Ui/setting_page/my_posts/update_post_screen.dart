import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_state.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';

import 'update_post/update_post_provider.dart';

class UpdatePostScreen extends StatefulWidget {
  final PostModel postModel;

  const UpdatePostScreen({Key? key, required this.postModel}) : super(key: key);

  @override
  State<UpdatePostScreen> createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  late FormGroup mainPostForm;

  @override
  void initState() {
    initForm(widget.postModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<PostsBloc>(),
      child: BlocConsumer<PostsBloc, PostsState>(
        listener: (context, state) {
          if (state.editSuccess) {
            Navigator.pop(context);
            showToast('تمت العملية بنجاح');
          }
          if (state.error?.isNotEmpty ?? false) {
            showToast(state.error.toString());
          }
        },
        builder: (context, state) {
          final bloc = context.read<PostsBloc>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              elevation: 0,
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: ReactiveForm(
                  formGroup: mainPostForm,
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Text('إضافة صور', style: TextStyle(fontSize: 12)),
                          SizedBox(height: 10),
                          Container(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    try {
                                      (mainPostForm.control('images')
                                                  as FormArray<PostImage>)
                                              .value?[index] =
                                          PostImage(
                                              newImage: await pickImage());
                                      setState(() {});
                                    } catch (e) {}
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 8),
                                          width: 125,
                                          height: 125,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                15, 52, 157, 216),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final image = (mainPostForm
                                                          .control('images')
                                                      as FormArray<PostImage>)
                                                  .value?[index];
                                              if (image?.isEmpty ?? true) {
                                                return _pickImageWidget();
                                              }
                                              if (image!.isOld) {
                                                return _networkImageWidget(
                                                  image.oldImage!,
                                                );
                                              }
                                              return Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                  image.newImage!,
                                                ))),
                                              );
                                            },
                                          )),

                                      //Delete button
                                      ///delete locally if the image is a file that has been picked soon
                                      ///or: delete locally  and insert this image to a list that will be deleted from server
                                      if (!((mainPostForm.control('images')
                                                  as FormArray<PostImage>)
                                              .value?[index]
                                              ?.isEmpty ??
                                          true))
                                        IconButton(
                                            onPressed: () {
                                              final image = (mainPostForm
                                                          .control('images')
                                                      as FormArray<PostImage>)
                                                  .value?[index];
                                              if (image!.isOld) {
                                                (mainPostForm.control(
                                                            'removedImages')
                                                        as FormArray<String>)
                                                    .add(FormControl(
                                                        value: image.oldImage));
                                              }
                                              (mainPostForm.control('images')
                                                      as FormArray<PostImage>)
                                                  .value?[index] = null;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.delete_outline_rounded,
                                              color: primaryColor,
                                            ))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Text('المنشور', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 10),
                          ReactiveTextField(
                            minLines: 12,
                            maxLines: null,
                            formControlName: 'desc',
                            decoration: InputDecoration(
                              fillColor: Color(0xFFF1F1F1),
                              filled: true,
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xFF898E92)),
                              hintText:
                                  'اكتب بما تفكر يا ${appUser!.firstName} ؟',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  AppLocalizations.of(context)
                                      .translate('description required'),
                            },
                          ),
                          SizedBox(height: 50.0),
                          if ((mainPostForm.control('subPosts') as FormArray)
                                  .value!
                                  .length <
                              maxSubPostsByPost)
                            OutlinedButton(
                              onPressed: () {
                                (mainPostForm.control('subPosts') as FormArray)
                                    .add(UpdatePostModel().formGroup);
                                setState(() {});
                              },
                              child: Text(
                                'إرفاق منشور فرعي',
                                style: TextStyle(
                                    fontSize: 16, color: primaryColor),
                              ),
                            ),
                          ListView.separated(
                              padding: const EdgeInsets.all(8.0),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Divider(thickness: 2),
                                  ),
                              itemCount: (mainPostForm.control('subPosts'))
                                  .value!
                                  .length,
                              itemBuilder: (context, index) =>
                                  _subPostItem(index)),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (mainPostForm.invalid) {
                                    mainPostForm.markAllAsTouched();
                                    return;
                                  }
                                  if ((mainPostForm.control('images')
                                              as FormArray<PostImage>)
                                          .value
                                          ?.every(
                                              (element) => element == null) ??
                                      true) {
                                    showToast(
                                        'يجب أن يحتوي المنشور الرئيسي على صورة واحدة على الأقل');
                                    return;
                                  }
                                  final numOfSubPosts = (mainPostForm
                                          .control('subPosts') as FormArray)
                                      .controls
                                      .length;
                                  for (int postIndex = 0;
                                      postIndex < numOfSubPosts;
                                      postIndex++) {
                                    if ((((mainPostForm.control('subPosts')
                                                                as FormArray)
                                                            .controls[postIndex]
                                                        as FormGroup)
                                                    .control('images')
                                                as FormArray<PostImage>)
                                            .value
                                            ?.every(
                                                (element) => element == null) ??
                                        true) {
                                      showToast(
                                          'يجب أن يحتوي المنشور ${postIndex + 1} على صورة واحدة على الأقل');
                                      return;
                                    }
                                  }
                                  final event = EditPost((b) {
                                    final List<SubPostParam> subPosts = [];
                                    final y = (mainPostForm.control('subPosts')
                                            as FormArray)
                                        .controls;
                                    final List<FormGroup> x =
                                        y.map((e) => e as FormGroup).toList();
                                    x.forEach(
                                      (element) {
                                        subPosts.add(
                                          SubPostParam(
                                            id: element.control('id').value,
                                            desc: element.control('desc').value
                                                as String,
                                            removedImages: (element
                                                    .control('removedImages')
                                                    .value as List<String?>)
                                                .whereType<String>()
                                                .toList(),
                                            images: getNewImages(element
                                                .control('images')
                                                .value as List<PostImage?>),
                                          ),
                                        );
                                      },
                                    );

                                    return b
                                      ..id = widget.postModel.id!
                                      ..imagesToRemove =
                                          (mainPostForm.control('removedImages')
                                                  as FormArray<String>)
                                              .value
                                              ?.whereType<String>()
                                              .toList()
                                      ..images = getNewImages((mainPostForm
                                          .control('images')
                                          .value as List<PostImage?>))
                                      ..description =
                                          mainPostForm.control('desc').value
                                      ..subPosts = subPosts;
                                  });

                                  bloc.add(event);
                                },
                                child: Text('تعديل المنشور')),
                          ),
                        ],
                      ),
                      if (state.isLoading)
                        Center(
                          child: loader(context: context),
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
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

  Widget _subPostItem(int subPostIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('إضافة صور', style: TextStyle(fontSize: 12)),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, imageIndex) {
              return InkWell(
                onTap: () async {
                  try {
                    (((mainPostForm.control('subPosts') as FormArray)
                                    .controls[subPostIndex] as FormGroup)
                                .control('images') as FormArray<PostImage>)
                            .value?[imageIndex] =
                        PostImage(newImage: await pickImage());
                    setState(() {});
                  } catch (e) {}
                },
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 8),
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(15, 52, 157, 216),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Builder(
                          builder: (context) {
                            final image =
                                getSubPostImage(subPostIndex, imageIndex);

                            if (image?.isEmpty ?? true) {
                              return _pickImageWidget();
                            }
                            if (image!.isOld) {
                              return _networkImageWidget(
                                image.oldImage!,
                              );
                            }
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(
                                image.newImage!,
                              ))),
                            );
                          },
                        )),

                    //Delete button
                    ///delete locally if the image is a file that has been picked soon
                    ///or: delete locally  and insert this image to a list that will be deleted from server
                    if (!((getSubPostImage(subPostIndex, imageIndex))
                            ?.isEmpty ??
                        true))
                      IconButton(
                          onPressed: () {
                            var image =
                                getSubPostImage(subPostIndex, imageIndex);
                            if (image!.isOld) {
                              (((mainPostForm.control('subPosts') as FormArray)
                                          .controls[subPostIndex] as FormGroup)
                                      .control(
                                          'removedImages') as FormArray<String>)
                                  .value
                                  ?.add(image.oldImage);
                            }
                            (((mainPostForm.control('subPosts') as FormArray)
                                        .controls[subPostIndex] as FormGroup)
                                    .control('images') as FormArray<PostImage>)
                                .value?[imageIndex] = null;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            color: primaryColor,
                          ))
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 15),
        Text('المنشور', style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
        ReactiveTextField(
          minLines: 12,
          maxLines: null,
          formControl: ((mainPostForm.control('subPosts') as FormArray)
                  .controls[subPostIndex] as FormGroup)
              .control('desc') as FormControl,
          decoration: InputDecoration(
            fillColor: Color(0xFFF1F1F1),
            filled: true,
            hintStyle: TextStyle(fontSize: 16, color: Color(0xFF898E92)),
            hintText: 'اكتب بما تفكر يا ${appUser!.firstName} ؟',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          validationMessages: {
            ValidationMessage.required: (_) =>
                AppLocalizations.of(context).translate('description required'),
          },
        ),
        IconButton(
            onPressed: () {
              (mainPostForm.control('subPosts') as FormArray)
                  .removeAt(subPostIndex);
              setState(() {});
            },
            icon: Icon(Icons.delete))
      ],
    );
  }

  PostImage? getSubPostImage(postIndex, imageIndex) =>
      (((mainPostForm.control('subPosts') as FormArray).controls[postIndex]
                  as FormGroup)
              .control('images') as FormArray<PostImage>)
          .value?[imageIndex];

  initForm(PostModel mainPost) {
    ///init images got from server
    List<FormControl<PostImage>> _images =
        List.filled(maxImagesByPost, FormControl<PostImage>(), growable: false);
    if (mainPost.images != null)
      for (int i = 0; i < min(mainPost.images!.length, maxImagesByPost); i++) {
        _images[i] = FormControl<PostImage>(
          value: PostImage(oldImage: getImagePath(mainPost.images![i])),
        );
      }

    /// /////////////////////////////
    mainPostForm = FormGroup(
      {
        'desc': FormControl<String>(
          value: mainPost.description,
          validators: [
            Validators.required,
          ],
        ),
        'images': FormArray<PostImage>(
          _images,
          validators: [
            Validators.required,
            Validators.minLength(1),
            Validators.maxLength(maxImagesByPost),
          ],
        ),
        'removedImages': FormArray<String>([]),
        'subPosts': FormArray(
          ///Todo : check null check operator
          mainPost.subPosts!
              .map(
                (item) => UpdatePostModel(
                  id: item.id,
                  desc: item.description!,
                  images: List.generate(
                    item.images!.length,
                    (index) =>
                        PostImage(oldImage: getImagePath(item.images![index])),
                  ),
                  removedImages: [],
                ).formGroup,
              )
              .toList(),
        )
      },
    );
  }

  List<File> getNewImages(List<PostImage?> images) {
    final List<File> _images = [];
    images.forEach((element) {
      if (element?.newImage != null) _images.add(element!.newImage!);
    });
    return _images;
  }
}
