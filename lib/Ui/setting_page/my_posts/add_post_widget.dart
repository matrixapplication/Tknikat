import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image.dart';
import 'package:taknikat/injectoin.dart';

class AddPostWidget extends StatefulWidget {
  final int postIndex;

  AddPostWidget({Key? key, required this.postIndex}) : super(key: key);

  @override
  State<AddPostWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget>
    with AutomaticKeepAliveClientMixin<AddPostWidget> {
  List<File?> _images = List.filled(5, null, growable: false);
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final isParent = widget.postIndex == 0;
    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        final CreatePostBloc _bloc = context.read<CreatePostBloc>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isParent)
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        context
                            .read<CreatePostBloc>()
                            .add(RemoveSubPost(widget.postIndex));
                      },
                      child: Text(
                        '${AppLocalizations.of(context)
                            .translate("post3")}' + ' ' + widget.postIndex.toString(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontFamily: 'Tajawal'),
                      ))
                ],
              ),
            SizedBox(
              height: 10,
            ),
            Text(
                AppLocalizations.of(context)
                    .translate("Add_images"),
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => InkWell(
                  onTap: () async {
                    try {
                      _images[index] = await pickImage();

                      setState(() {});
                      final List<File> newList = [];
                      _images.forEach((element) {
                        if (element != null) {
                          newList.add(element);
                        }
                      });
                      _bloc.add(EditSubPost(
                          index: widget.postIndex, images: newList));
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
                        child: _images[index] != null
                            ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(_images[index]!))),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/addButton.svg"),
                                  SizedBox(height: 15),
                                  Text(
                                    AppLocalizations.of(context)
                                        .translate("Add_image"),
                                    style: TextStyle(
                                        fontSize: 12, color: primaryColor),
                                  ),
                                ],
                              ),
                      ),
                      if (_images[index] != null)
                        IconButton(
                            onPressed: () {
                              _images[index] = null;
                              setState(() {});
                              final List<File> newList = [];
                              _images.forEach((element) {
                                if (element != null) {
                                  newList.add(element);
                                }
                              });
                              _bloc.add(
                                  EditSubPost(index: index, images: newList));
                            },
                            icon: Icon(
                              Icons.delete_outline_rounded,
                              color: primaryColor,
                            ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
                AppLocalizations.of(context)
                    .translate("post2"),
                 style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            TextFormField(
              minLines: 12,
              maxLines: null,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return AppLocalizations.of(context)
                      .translate('description required');
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                _bloc.add(EditSubPost(index: widget.postIndex, desc: value));
              },
              decoration: InputDecoration(
                fillColor: Color(0xFFF1F1F1),
                filled: true,
                hintStyle: TextStyle(fontSize: 16, color: Color(0xFF898E92)),
                hintText: ' ${AppLocalizations.of(context)
            .translate("type")} ${appUser!.firstName} ؟',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            if (!isParent)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        context
                            .read<CreatePostBloc>()
                            .add(RemoveSubPost(widget.postIndex));
                      },
                      child: Text(
                        AppLocalizations.of(context)
                            .translate("delete_post"),
                        style: TextStyle(
                            color: Theme.of(context).errorColor,
                            fontSize: 16,
                            fontFamily: 'Tajawal'),
                      ))
                ],
              ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  bool get wantKeepAlive => true;
}
