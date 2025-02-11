import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/image.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/core/widgets/inputs/custom_text_field_area.dart';
import 'package:taknikat/core/widgets/inputs/custom_text_field_numeric.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/main_title.dart';
import '../../../core/widgets/icon_widget.dart';
import '../../../core/widgets/inputs/custom_text_field_date.dart';
import '../../../core/widgets/texts/black_texts.dart';
import 'bloc/bloc/create_event_bloc.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen();

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TextEditingController _rulesController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  TextEditingController _numberOfInputController = TextEditingController();

  File? image;
  final CreateEventBloc _bloc = sl<CreateEventBloc>();
  final _key = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocConsumer<CreateEventBloc, CreateEventState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Future.delayed(Duration.zero, () {
              AwesomeDialog(
                  context: context,
                  btnOkText: AppLocalizations.of(context).translate("Ok"),
                  btnOkColor: primaryColor,
                  dialogType: DialogType.success,
                  title:AppLocalizations.of(context)
                      .translate("Add_event"),
                  desc:AppLocalizations.of(context)
                      .translate("add_event_done"),
                  btnOkOnPress: () {},
                  onDismissCallback: (type) {
                    Navigator.pop(context, true);
                  })
                ..show();
            });
          }
          if (state.error.isNotEmpty) showToast(state.error);
        },
        builder: (context, state) {
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: primaryColor,
            //   title: baseText(AppLocalizations.of(context)
            //       .translate("Add_event"), color: Colors.white),
            //   elevation: 0,
            //   centerTitle: true,
            //   leading: BackButton(color: Colors.white),
            // ),
            body: Stack(
              children: [
                SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),

                Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.always,
                  child:
                  Container(
                    padding: 16.paddingHorizontal,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                BlackMediumText(label: AppLocalizations.of(context).translate("Add_event"),),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListView(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: AlignmentDirectional.topStart,
                                      child: MainTitle(
                                        AppLocalizations.of(context).translate("Add_image"),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    10.height,
                                    InkWell(
                                      onTap: () async {
                                        try {
                                          image = await pickImage();

                                          setState(() {});
                                        } catch (e) {}
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 175,
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
                                                      image: FileImage(
                                                          image!))),
                                            )
                                                : Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(AppImages.addImage5),
                                                SizedBox(height: 15),
                                                Text(
                                                  AppLocalizations.of(context)
                                                      .translate("Add_image"),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
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
                                                    color: primaryColor,
                                                  )),
                                            )
                                        ],
                                      ),
                                    ),
                                    Form(
                                      key:_formKey,
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomTextField(
                                              fillColor: Color(0xffF7F7F8),
                                              borderColor: Colors.transparent,
                                              title: AppLocalizations.of(context).translate("event_name"),
                                              hintText: AppLocalizations.of(context).translate("event_name"),
                                              controller: _nameController),
                                          16.height,

                                           Row(
                                             children: [
                                               Expanded(child: CustomTextFieldDate(
                                                   background: Color(0xffF7F7F8),
                                                   title: AppLocalizations.of(context).translate("date_start_event"),
                                                   borderColor: Colors.transparent,
                                                   controller: _startDate),),
                                               10.width,
                                               Expanded(child: CustomTextFieldDate(
                                                   borderColor: Colors.transparent,
                                                   background: Color(0xffF7F7F8),
                                                   title: AppLocalizations.of(context).translate("date_end_event"),
                                                   controller: _endDate),),
                                             ],
                                           ),
                                          16.height,
                                          CustomTextField(
                                              textInputType:TextInputType.number ,
                                              fillColor: Color(0xffF7F7F8),
                                              borderColor: Colors.transparent,
                                              validationFunc: (value){
                                                if (value?.isEmpty ?? false) {
                                                  return AppLocalizations.of(context)
                                                      .translate("number_set_req");
                                                } else {
                                                  return null;
                                                }
                                              },
                                              title: AppLocalizations.of(context).translate("number_set"),
                                              hintText: AppLocalizations.of(context).translate("number_set"),
                                              controller: _numberOfInputController),
                                          16.height,
                                          BlackRegularText(label:  AppLocalizations.of(context).translate("terms_conditions"),fontSize: 16,),
                                          8.height,
                                          CustomTextFieldArea(
                                            background: Color(0xffF7F7F8),
                                            borderColor: Colors.transparent,
                                            controller: _rulesController,
                                            hint:  AppLocalizations.of(context)
                                                .translate("terms_conditions"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                30.height,
                                CustomButton(
                                    title: AppLocalizations.of(context).translate("Add_event"),
                                    onTap: (){
                                      if (_formKey.currentState!.validate()){
                                        if (image == null) {

                                          showToast(
                                            AppLocalizations.of(context)
                                                .translate("image_req"),
                                          );
                                          return;

                                        }
                                        _bloc.add(SubmitEvent(
                                            param: SubmitEventParam(
                                              desc: _rulesController.text,
                                              name: _nameController.text,
                                              image: image!,
                                              endDate: endDate,
                                              startDate: startDate,
                                              number: _numberOfInputController.text,
                                            )));
                                      }
                                }),
                                30.height,

                              ],
                            ),
                          ),
                        ),
                        if (state.isLoading)
                          Center(
                            child: loader(),
                          ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
