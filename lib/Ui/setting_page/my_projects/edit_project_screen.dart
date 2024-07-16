import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taknikat/Ui/setting_page/my_projects/bloc/my_projects_state.dart';
import 'package:taknikat/Ui/setting_page/my_projects/text_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/project_model/project_model.dart';

import 'bloc/my_projects_bloc.dart';
import 'bloc/my_projects_event.dart';

class EditProjectScreen extends StatefulWidget {
  final ProjectModel project;

  EditProjectScreen(this.project);

  @override
  _EditProjectScreenState createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends State<EditProjectScreen> {
  var _title = TextEditingController();
  var _description = TextEditingController();
  var _youtubeUrl = TextEditingController();
  bool _titleValidator = false;
  bool _descriptionValidator = false;
  bool _youtubeUrlValidator = false;
  final _bloc = sl<MyProjectsBloc>();
  File? _image;

  @override
  void initState() {
    super.initState();
    _bloc.add(ClearState());
    _title.text = widget.project.name ?? '';
    _description.text = widget.project.description ?? '';
    _youtubeUrl.text = widget.project.youtubeLink ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MyProjectsState state) {
          showToast(state.error);
          if (state.editSuccess) {
            Future.delayed(Duration.zero, () {
              AwesomeDialog(
                  context: context,
                  btnOkText: AppLocalizations.of(context).translate("Ok"),
                  btnOkColor: primaryColor,
                  dialogType: DialogType.success,
                  title:
                      AppLocalizations.of(context).translate("Project action"),
                  desc: AppLocalizations.of(context)
                      .translate("Project updated successfully"),
                  btnOkOnPress: () {},
                  onDismissCallback: (type) {
                    Navigator.pop(context);
                    _bloc.add(ClearState());
                  })
                ..show();
            });
          }
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());

          return Scaffold(
            resizeToAvoidBottomInset: false, // this avoids the overflow error

            appBar: AppBar(
              elevation: 0,
              backgroundColor: primaryColor,
              title: baseText(
                  AppLocalizations.of(context).translate("Edit Project"),
                  color: Colors.white),
            ),
            body: Column(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    color: primaryColor,
                    child: Column(
                      children: [
                        Container(
                          height: (sizeAware.height * 0.098483412322275) / 1.5,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                alignment: AlignmentDirectional.topStart,
                                height: 60,
                                child: MainTitle(
                                  AppLocalizations.of(context)
                                      .translate("Edit Project"),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  children: [
                                    _titleValidator
                                        ? Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "Project name"),
                                                  style: TextStyle()),
                                              Text(
                                                "*",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          )
                                        : Container(),
                                    customTextField(
                                      controller: _title,
                                      hint: AppLocalizations.of(context)
                                          .translate("Project name"),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  children: [
                                    _descriptionValidator
                                        ? Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "Project Description"),
                                                  style: TextStyle()),
                                              Text(
                                                "*",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          )
                                        : Container(),
                                    customTextField(
                                      controller: _description,
                                      hint: AppLocalizations.of(context)
                                          .translate("Project Description"),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  children: [
                                    _youtubeUrlValidator
                                        ? Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "Project video link"),
                                                  style: TextStyle()),
                                              Text(
                                                "*",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          )
                                        : Container(),
                                    customTextField(
                                        controller: _youtubeUrl,
                                        hint: AppLocalizations.of(context)
                                            .translate("Project video link")),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  try {
                                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                    if (pickedFile != null) {
                                      _image = File(pickedFile.path);
                                      setState(() {});
                                    }
                                  } catch (e) {}
                                },
                                child: Container(
                                  height: sizeAware.height * 0.338095238095238,
                                  width: sizeAware.width,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: _image != null
                                        ? Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: FileImage(_image!))),
                                          )
                                        : widget.project.featuredImage
                                                    ?.trim()
                                                    .isEmpty ??
                                                true
                                            ? Icon(
                                                Icons.add_a_photo_outlined,
                                                color: secondryColor,
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            getImagePath(widget
                                                                .project
                                                                .featuredImage!)))),
                                              ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   height: sizeAware.height * 0.238095238095238,
                              //   width: sizeAware.width,
                              //   margin: EdgeInsets.all(8),
                              //   decoration: BoxDecoration(
                              //     color: Colors.grey[200],
                              //     borderRadius: BorderRadius.circular(8),
                              //   ),
                              //   child: MultiImagePicker(images),
                              // ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(8),
                                child: baseClick(
                                    AppLocalizations.of(context)
                                        .translate("Publish the project"),
                                    onTap: () {
                                  _titleValidator = false;
                                  _descriptionValidator = false;
                                  _youtubeUrlValidator = false;

                                  setState(() {
                                    if (_title.text.trim().isEmpty) {
                                      showToast(AppLocalizations.of(context)
                                          .translate("Title required"));
                                      _titleValidator = true;
                                    } else if (_description.text
                                        .trim()
                                        .isEmpty) {
                                      showToast(AppLocalizations.of(context)
                                          .translate("Desctiption required"));
                                      _descriptionValidator = true;
                                    } else if (_youtubeUrl.text
                                        .trim()
                                        .isEmpty) {
                                      showToast(AppLocalizations.of(context)
                                          .translate("Youtube Url  required"));
                                      _youtubeUrlValidator = true;
                                    } else {
                                      _bloc.add(EditProject((b) {
                                        b
                                          ..id = widget.project.id
                                          ..title = _title.text
                                          ..description = _description.text
                                          ..yotubeUrl = _youtubeUrl.text;
                                        if (_image != null) b..image = _image;
                                      }));
                                    }
                                  });
                                },
                                    height: sizeAware.height * 0.05952380952381,
                                    FontWeight: FontWeight.bold,
                                    colorTitle: Colors.white,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                      state.isLoading
                          ? Center(
                              child: loader(context: context),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
