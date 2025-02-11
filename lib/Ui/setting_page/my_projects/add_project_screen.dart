import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taknikat/Ui/setting_page/my_projects/text_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/icon_widget.dart';
import '../../../core/widgets/texts/black_texts.dart';
import 'bloc/my_projects_bloc.dart';
import 'bloc/my_projects_event.dart';
import 'bloc/my_projects_state.dart';

class AddProjectScreen extends StatefulWidget {
  AddProjectScreen();

  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  var _title = TextEditingController();
  var _description = TextEditingController();
  var _youtubeUrl = TextEditingController();
  bool _titleValidator = false;
  bool _descriptionValidator = false;
  bool _youtubeUrlValidator = false;

  File? _image;
  final _bloc = sl<MyProjectsBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(ClearState());
  }

  List<File> images = <File>[];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MyProjectsState state) {
          showToast(state.error);
          if (state.addSuccess) {
            Future.delayed(Duration.zero, () {
              AwesomeDialog(
                  context: context,
                  btnOkText: AppLocalizations.of(context).translate("Ok"),
                  btnOkColor: primaryColor,
                  dialogType: DialogType.success,
                  title:
                      AppLocalizations.of(context).translate("Project action"),
                  desc: AppLocalizations.of(context)
                      .translate("new project saved successfully"),
                  btnOkOnPress: () {},
                  onDismissCallback: (type) {
                    _bloc.add(ClearState());
                    sl<MyProjectsBloc>().add(GetMyProjects());
                    Navigator.pop(context, true);
                  })
                ..show();
            });
          }
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());

          return Scaffold(
            resizeToAvoidBottomInset: false,
            body:  Stack(
              children: [
                SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),

                SingleChildScrollView(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 6),
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
                                BlackMediumText(label:AppLocalizations.of(context).translate("Add a new project"),),
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
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                _image = File(pickedFile.path);
                                setState(() {});
                              }
                            } catch (e) {}
                          },
                          child: Container(
                            height: sizeAware.height * 0.338095238095238,
                            width: sizeAware.width,
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                                margin: EdgeInsets.all(0),
                                child: _image != null
                                    ? Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(_image!))),
                                )
                                    : Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffF2F9FD)
                                  ),
                                  padding: 16.paddingAll,
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppImages.addImage5),
                                      8.height,
                                      BlackRegularText(label: 'Add Image',fontWeight: FontWeight.w300,fontSize: 13,)
                                    ],
                                  ),
                                )
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
                              _bloc.add(AddProject((b) => b
                                ..title = _title.text
                                ..description = _description.text
                                ..yotubeUrl = _youtubeUrl.text
                                ..image = _image));
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
