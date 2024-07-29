import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taknikat/Ui/AllCategories_page/bloc/all_categories_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_products/text_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/core/multi_image_picker.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

import 'bloc/my_services_bloc.dart';
import 'bloc/my_services_event.dart';
import 'bloc/my_services_state.dart';

class AddServiceScreen extends StatefulWidget {
  AddServiceScreen();
  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  var _title = TextEditingController();
  var _description = TextEditingController();
  var _price = TextEditingController();
  bool _titleValidator = false;
  bool _descriptionValidator = false;
  bool _priceValidator = false;
  int? categoryId;
  File? _image;
  final _bloc = sl<MyServicesBloc>();
  @override
  void initState() {
    super.initState();
    _bloc.add(ClearState());
  }

  List<File> images = <File>[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MyServicesState state) {
          showToast(state.error);
          if (state.addSuccess) {
            Future.delayed(Duration.zero, () {
              AwesomeDialog(
                  context: context,
                  btnOkText: AppLocalizations.of(context).translate("Ok"),
                  btnOkColor: primaryColor,
                  dialogType: DialogType.success,
                  title:
                      AppLocalizations.of(context).translate("Service action"),
                  desc: AppLocalizations.of(context)
                      .translate("new Service saved successfully"),
                  btnOkOnPress: () {},
                  onDismissCallback: (type) {
                    _bloc.add(ClearState());
                    sl<MyServicesBloc>().add(GetMyServices());
                    Navigator.pop(context, true);
                  })
                ..show();
            });
          }
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());

          return Scaffold(
            resizeToAvoidBottomInset: false, // this avoids the overflow error

            appBar: AppBar(
              title: Container(
                margin: EdgeInsets.all(13),
                width: sizeAware.width * 0.282051282051282,
                child: SvgPicture.asset(
                  "assets/images/logo-white.svg",
                  color: Colors.white,
                  height: sizeAware.height * 0.060090047393365,
                ),
              ),
              centerTitle: true,
              backgroundColor: primaryColor,
              elevation: 0,
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
                                      .translate("Add a new service"),
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
                                                          "Service title"),
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
                                          .translate("Service title"),
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
                                                          "Service description"),
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
                                          .translate("Service description"),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  children: [
                                    _priceValidator
                                        ? Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "Service price"),
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
                                      keyboardType: TextInputType.number,
                                      controller: _price,
                                      hint: AppLocalizations.of(context)
                                          .translate("Service price"),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  children: [
                                    _priceValidator
                                        ? Row(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "main section"),
                                                  style: TextStyle()),
                                              Text(
                                                "*",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          )
                                        : Container(),
                                    Container(
                                      alignment: Alignment.center,
                                      height: sizeAware.height * 0.056992,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButton<int>(
                                        value: categoryId,
                                        items: sl<AllCategoriesBloc>()
                                                .state
                                                .servicesCategories
                                                .isEmpty
                                            ? []
                                            : sl<AllCategoriesBloc>()
                                                .state
                                                .servicesCategories
                                                .map(
                                                  (e) => DropdownMenuItem<int>(
                                                    value: e.id,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .only(start: 8.0),
                                                      child: Text(
                                                        e.name!,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                        onChanged: (selected) {
                                          setState(() {
                                            categoryId = selected;
                                          });
                                        },
                                        isExpanded: true,
                                        underline: Container(),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: primaryColor,
                                        ),
                                        hint: Row(
                                          children: [
                                            SizedBox(width: 4),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "main section"),
                                                  style: TextStyle()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  try {
                                    ImagePicker()
                                        .pickImage(source: ImageSource.gallery)
                                        .then((pickedFile) => setState(() {
                                              if (pickedFile != null)
                                                _image = File(pickedFile.path);
                                            }));
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
                                        : Icon(
                                            Icons.add_a_photo_outlined,
                                            color: secondryColor,
                                          ),
                                  ),
                                ),
                              ),
                              Container(
                                height: sizeAware.height * 0.238095238095238,
                                width: sizeAware.width,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: MultiImagePicker(images),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(8),
                                child: baseClick(
                                    AppLocalizations.of(context)
                                        .translate("Publish service"),
                                    onTap: () {
                                  _titleValidator = false;
                                  _descriptionValidator = false;
                                  _priceValidator = false;

                                  setState(() {
                                    if (_title.text.trim().isEmpty) {
                                      showToast(
                                        AppLocalizations.of(context)
                                            .translate("Title required"),
                                      );
                                      _titleValidator = true;
                                    } else if (_description.text
                                        .trim()
                                        .isEmpty) {
                                      showToast(AppLocalizations.of(context)
                                          .translate("Desctiption required"));
                                      _descriptionValidator = true;
                                    } else if (_price.text.trim().isEmpty) {
                                      showToast(AppLocalizations.of(context)
                                          .translate("Price required"));
                                      _priceValidator = true;
                                    } else {
                                      _bloc.add(AddService((b) => b
                                        ..title = _title.text
                                        ..description = _description.text
                                        ..price = _price.text
                                        ..categoryId = categoryId
                                        ..image = _image
                                        ..images = images));
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
