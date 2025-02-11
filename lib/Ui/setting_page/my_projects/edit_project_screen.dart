import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taknikat/Ui/setting_page/my_projects/bloc/my_projects_state.dart';
import 'package:taknikat/Ui/setting_page/my_projects/text_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/project_model/project_model.dart';

import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/icon_widget.dart';
import '../../../core/widgets/texts/black_texts.dart';
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
  final _formKey = GlobalKey<FormState>();

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

            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: primaryColor,
            //   title: baseText(
            //       AppLocalizations.of(context).translate("Edit Project"),
            //       color: Colors.white),
            // ),
            body:
            Stack(
              children: [
                SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
                SingleChildScrollView(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        40.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: (appUser?.avatar == null
                                      ? AssetImage("assets/images/profile.png")
                                      : CachedNetworkImageProvider(
                                      getImagePath(appUser?.avatar??'')))
                                  as ImageProvider),
                            ),
                            Expanded(child: Column(
                              children: [
                                30.height,
                                BlackMediumText(label:'Edit Video',),
                              ],
                            ),),
                            IconWidget(
                              width: 40.w,
                              height: 40.h,
                              onTap: (){
                                context.pop();
                              },
                              widget:Padding(
                                padding:8.paddingAll,
                                child:  SvgPicture.asset(AppImages.add5,height: 24,width: 24,),
                              ),
                            ),
                          ],
                        ),
                        20.height,
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          child: MainTitle(
                            'Add main image',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        10.height,
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
                                color: Color(0xffF2F9FD),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: _image != null
                                  ? Container(
                                  color: Color(0xffF2F9FD),

                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(_image!))),
                              )
                                  : widget.project.featuredImage
                                  ?.trim()
                                  .isEmpty ??
                                  true
                                  ?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.addImage5),
                                  8.height,
                                  BlackRegularText(label: 'Add Image',fontWeight: FontWeight.w300,fontSize: 13,)
                                ],
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
                        Form(
                          key:_formKey,
                          child:Column(
                            children: [
                              CustomTextField(
                                  fillColor: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  title: AppLocalizations.of(context).translate("Project name"),
                                  hintText: AppLocalizations.of(context).translate("Project name"),
                                  controller: _title),
                              16.height,
                              CustomTextField(
                                  fillColor: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  title: AppLocalizations.of(context).translate("Project Description"),
                                  hintText: AppLocalizations.of(context).translate("Project Description"),
                                  controller: _description),
                              16.height,
                              CustomTextField(
                                  fillColor: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  title: AppLocalizations.of(context).translate("Project video link"),
                                  hintText: AppLocalizations.of(context).translate("Project video link"),
                                  controller: _youtubeUrl),
                              16.height,

                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                        CustomButton(
                          onTap: (){
                            if (_formKey.currentState!.validate() ){
                              _bloc.add(EditProject((b) {
                                b..id = widget.project.id
                                  ..title = _title.text
                                  ..description = _description.text
                                  ..yotubeUrl = _youtubeUrl.text;
                                if (_image != null) b..image = _image;
                              }));
                            }
                          },
                          title:AppLocalizations.of(context).translate("Publish the project"),
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
          );
        });
  }
}
