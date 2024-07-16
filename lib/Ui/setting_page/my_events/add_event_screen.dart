import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

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
  TextEditingController _numberOfInputController = TextEditingController();

  selectStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      currentDate: startDate,
      locale: appLanguage == 'ar' ? Locale('ar') : Locale('en'),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != startDate)
      setState(() {
        startDate = picked;
      });
  }

  selectEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: startDate,
      currentDate: endDate,
      locale: appLanguage == 'ar' ? Locale('ar') : Locale('en'),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != endDate)
      setState(() {
        endDate = picked;
      });
  }

  File? image;
  final CreateEventBloc _bloc = sl<CreateEventBloc>();
  final _key = GlobalKey<FormState>();

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
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: baseText(AppLocalizations.of(context)
                  .translate("Add_event"), color: Colors.white),
              elevation: 0,
              centerTitle: true,
              leading: BackButton(color: Colors.white),
            ),
            body: Stack(
              children: [
                Form(
                  key: _key,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          color: primaryColor,
                          child: Column(
                            children: [
                              Container(height: 20),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)
                                          .translate("event_name"),
                                      style: TextStyle(fontSize: 14)),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    controller: _nameController,
                                    validator: (value) {
                                      if (value?.isEmpty ?? false) {
                                        return  AppLocalizations.of(context)
                                            .translate("event_name_req");
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFFF1F1F1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              AppLocalizations.of(context)
                                                  .translate("date_start_event"),
                                              style: TextStyle(fontSize: 14)),
                                          SizedBox(height: 10),
                                          InkWell(
                                            onTap: selectStartDate,
                                            child: Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) -
                                                  20,
                                              padding: EdgeInsets.all(13),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFF1F1F1),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(getDateOnly(
                                                  startDate.toString())),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              AppLocalizations.of(context)
                                                  .translate("date_end_event"),
                                              style: TextStyle(fontSize: 14)),
                                          SizedBox(height: 10),
                                          InkWell(
                                            onTap: selectEndDate,
                                            child: Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) -
                                                  20,
                                              padding: EdgeInsets.all(13),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFF1F1F1),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(getDateOnly(
                                                  endDate.toString())),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                      AppLocalizations.of(context)
                                          .translate("number_set"),
                                      style: TextStyle(fontSize: 14)),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _numberOfInputController,
                                    validator: (value) {
                                      if (value?.isEmpty ?? false) {
                                        return AppLocalizations.of(context)
                                            .translate("number_set_req");
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFFF1F1F1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                      AppLocalizations.of(context)
                                          .translate("terms_conditions"),
                                      style: TextStyle(fontSize: 14)),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    minLines: 8,
                                    maxLines: null,
                                    controller: _rulesController,
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return AppLocalizations.of(context)
                                            .translate("terms_conditions_req");
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFFF1F1F1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
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
                                                    SvgPicture.asset(
                                                        "assets/images/addButton.svg"),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      AppLocalizations.of(context)
                                                          .translate("Add_image"),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: primaryColor),
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
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (!_key.currentState!.validate())
                                        return;

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
                                    },
                                    child: Text(

                                        AppLocalizations.of(context)
                                            .translate("Add_event"),
                                        )),
                              ),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
