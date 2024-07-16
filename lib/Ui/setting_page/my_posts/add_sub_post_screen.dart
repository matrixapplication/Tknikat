import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_state.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

class AddSubPostScreen extends StatefulWidget {
  final int? parentId;

  const AddSubPostScreen({Key? key, this.parentId}) : super(key: key);

  @override
  State<AddSubPostScreen> createState() => _AddSubPostScreenState();
}

class _AddSubPostScreenState extends State<AddSubPostScreen> {
  List<File?> _images = List.filled(5, null, growable: false);
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<PostsBloc>(),
      child: BlocConsumer<PostsBloc, PostsState>(
        listener: (context, state) {
          if (state.addSuccess) {
            Navigator.pop(context);
            showToast('تمت العملية بنجاح');
          }
          if (state.error?.isNotEmpty ?? false) {
            showToast(state.error.toString());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              elevation: 0,
            ),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
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
                                      _images[index] = await pickImage();
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
                                          color:
                                              Color.fromARGB(15, 52, 157, 216),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: _images[index] != null
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                  _images[index]!,
                                                ))),
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/images/addButton.svg"),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    'اضافة صورة',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: primaryColor),
                                                  ),
                                                ],
                                              ),
                                      ),
                                      if (_images[index] != null)
                                        IconButton(
                                            onPressed: () {
                                              _images[index] = null;
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
                          TextFormField(
                            minLines: 12,
                            maxLines: null,
                            controller: _descriptionController,
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return AppLocalizations.of(context)
                                    .translate('description required');
                              } else {
                                return null;
                              }
                            },
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
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate())
                                    return;

                                  final List<File> newList = [];
                                  _images.forEach((element) {
                                    if (element != null) {
                                      newList.add(element);
                                    }
                                  });
                                  if (newList.isEmpty) {
                                    showToast(
                                        'يجب أن يحتوي المنشور صورة واحدة على الأقل');
                                    return;
                                  }

                                  context.read<PostsBloc>().add(AddPost((b) => b
                                    ..id = widget.parentId.toString()
                                    ..images = newList
                                    ..subPosts = []
                                    ..description =
                                        _descriptionController.text));
                                },
                                child: Text('إضافة المنشور')),
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
}
