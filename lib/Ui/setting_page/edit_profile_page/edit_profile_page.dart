import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart' as phs;
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_bloc.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';

import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import 'bloc/edit_profile_bloc.dart';
import 'bloc/edit_profile_event.dart';
import 'bloc/edit_profile_state.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isSwitched = true;
  bool stateAnimation = false;
  bool stateAnimationLanguage = false;
  bool _countryValidator = false;
  bool _cityValidator = false;
  bool isEdited = false;

  PhoneNumber initPhone =
      PhoneNumber(phoneNumber: '', dialCode: '+963', isoCode: 'SA');

  String vmail = "", vv = "", textphone = "", textemail = "", textname = "";
  String v = "", vfname = '', vlname = '';
  var _fnameController = TextEditingController();
  var _lnameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _mailController = TextEditingController();
  var _facebookController = TextEditingController();
  var _youtubeController = TextEditingController();
  var _instagramController = TextEditingController();
  var _linkedinController = TextEditingController();
  var _twitterController = TextEditingController();
  var _snapchatController = TextEditingController();
  var _summaryController = TextEditingController();
  File? _image;
  final _bloc = sl<EditProfileBloc>();
  final _bloc2 = sl<SettingsBloc>();
  int? selectedCountry;
  int? selectedCity;
  String selectedGender = '';
  Country? currentCountry;
  List<SkillModel> listSkills = [];

  @override
  void initState() {
    super.initState();
    // _bloc2.add(InitSettings());
    final user = appUser!;
    _fnameController.text = user.firstName ?? '';
    _lnameController.text = user.lastName ?? '';
    _mailController.text = user.email ?? '';
    _facebookController.text = user.facebook ?? '';
    _twitterController.text = user.twitter ?? '';
    _instagramController.text = user.instagram ?? '';
    _snapchatController.text = user.snapchat ?? '';
    _linkedinController.text = user.linkedin ?? '';
    _youtubeController.text = user.youtube ?? '';
    _phoneController.text = user.phoneNumber ?? '';
    _summaryController.text = user.summary ?? '';
    selectedCountry = user.countryId;
    selectedGender = user.gender ?? Gender.none.name;
    init();
    // setState(() {});
    listSkills = user.skills?.toList() ?? [];
     if (user.countryId != null) {
      currentCountry = _bloc2
          .state
          .countries
          .singleWhere((x) => x.id == user.countryId);
      if (currentCountry != null) selectedCity = user.cityId;

    }
    isEdited = false;
  }

  void init() async {
    if (appUser!.phoneNumber != null) {
      final initPhone = phs.PhoneNumber.parse(appUser!.phoneNumber!);
      this.initPhone = PhoneNumber(
        phoneNumber: initPhone.nsn,
        dialCode: initPhone.countryCode,
        isoCode: initPhone.isoCode.name,
      );
      setState(() {});
    }
  }

  Future<bool?> _onBackPressed() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('هل تريد الخروج دون حفظ التغيرات؟'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('الخروج')),
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('الرجوع'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = isEdited ? await _onBackPressed() : true;
        return shouldPop ?? false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: baseText(
                AppLocalizations.of(context).translate("My Profile"),
                color: Colors.white),
          ),
          body: BlocBuilder(
              bloc: _bloc,
              builder: (BuildContext context, EditProfileState state) {
                if (state.success) {
                  _bloc.add(GetProfile());
                  Future.delayed(Duration.zero, () {
                    AwesomeDialog(
                      context: context,
                      btnOkText: AppLocalizations.of(context).translate("Ok"),
                      btnOkColor: primaryColor,
                      dialogType: DialogType.success,
                      title: AppLocalizations.of(context)
                          .translate("profile edit"),
                      desc: AppLocalizations.of(context).translate(
                          "your profile has been updated successfully"),
                      btnOkOnPress: () {
                        Navigator.of(context).pop();
                      },
                    )..show();
                  });
                }

                showToast(state.error);
                if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Container(
                              margin: EdgeInsets.all(13),
                              child: baseText(
                                  AppLocalizations.of(context)
                                      .translate("Edit Profile Data"),
                                  size: sizeAware.width * 0.05,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          state.data == null
                              ? Container()
                              : Container(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: new BoxDecoration(
                                            color: Colors.transparent),
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: othercolor,
                                                    shape: BoxShape.circle),
                                                child: CircleAvatar(
                                                  radius:
                                                      sizeAware.width * 0.16,
                                                  backgroundImage: (_image !=
                                                              null
                                                          ? FileImage(_image!)
                                                          : state.data.avatar !=
                                                                  null
                                                              ? CachedNetworkImageProvider(
                                                                  getImagePath(state
                                                                      .data
                                                                      .avatar!))
                                                              : AssetImage(
                                                                  "assets/images/profile.png"))
                                                      as ImageProvider,
                                                )),
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    getImage();
                                                    // setState(() {
                                                    //   isEdited = true;
                                                    // });
                                                  },
                                                  child: CircleAvatar(
                                                    radius:
                                                        sizeAware.width * 0.045,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: CircleAvatar(
                                                      radius: sizeAware.width *
                                                          0.04,
                                                      backgroundColor:
                                                          Colors.white,
                                                      //backgroundImage:
                                                      child: Icon(
                                                        Icons
                                                            .camera_alt_outlined,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: sizeAware.height * 0.04,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  textCard(
                                                    name: AppLocalizations.of(
                                                            context)
                                                        .translate(
                                                            "First Name"),
                                                    isPassword: false,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    controller:
                                                        _fnameController,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isEdited = true;
                                                      });
                                                    },
                                                    prefixIcon: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      child: SvgPicture.asset(
                                                          "assets/images/user.svg",
                                                          color: primaryColor),
                                                    ),
                                                  ),
                                                  textname.isNotEmpty
                                                      ? Align(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .centerStart,
                                                          child: Text(
                                                            textname,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  textCard(
                                                    name: AppLocalizations.of(
                                                            context)
                                                        .translate("Last Name"),
                                                    isPassword: false,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    controller:
                                                        _lnameController,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isEdited = true;
                                                      });
                                                    },
                                                    prefixIcon: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      child: SvgPicture.asset(
                                                          "assets/images/user.svg",
                                                          color: primaryColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      textCard(
                                        isPassword: false,
                                        prefixIcon: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: SvgPicture.asset(
                                              "assets/images/mail.svg",
                                              color: primaryColor),
                                        ),
                                        controller: _mailController,
                                        onChanged: (value) {
                                          setState(() {
                                            isEdited = true;
                                          });
                                        },
                                      ),

                                      SizedBox(
                                        height: sizeAware.height * 0.04,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        padding: EdgeInsetsDirectional.only(
                                            start: 10.0),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 2),
                                        child: Center(
                                          child: InternationalPhoneNumberInput(
                                            onInputChanged:
                                                (PhoneNumber number) {
                                              if (_phoneController.text !=
                                                  number.toString())
                                                setState(() {
                                                  isEdited = true;
                                                });
                                              _phoneController.text =
                                                  number.phoneNumber ?? '';
                                            },
                                            key: ValueKey(initPhone.toString()),
                                            maxLength: 100,
                                            onInputValidated: (bool value) {
                                              if (!value) {
                                                textphone =
                                                    "invalid phone number"
                                                        .tr(context);
                                              } else {
                                                textphone = "";
                                              }
                                              setState(() {});
                                            },
                                            inputDecoration: InputDecoration(
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2.0,
                                                          color: Colors
                                                              .transparent)),
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintStyle: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 15),
                                              hintText:
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                "Phone Number",
                                              ),
                                            ),
                                            ignoreBlank: false,
                                            textStyle: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                            autoValidateMode:
                                                AutovalidateMode.disabled,
                                            selectorTextStyle: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                            initialValue: initPhone,
                                          ),
                                        ),
                                      ),
                                      textphone.isNotEmpty
                                          ? Align(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              child: Text(
                                                textphone,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile<String>(
                                              contentPadding: EdgeInsets.zero,
                                              value: Gender.male.apiKey,
                                              selected: selectedGender ==
                                                  Gender.male.apiKey,
                                              groupValue: selectedGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedGender = value!;
                                                  isEdited = true;
                                                });
                                              },
                                              title: Text(
                                                AppLocalizations.of(context)
                                                    .translate('male'),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile<String>(
                                              contentPadding: EdgeInsets.zero,
                                              value: Gender.female.apiKey,
                                              selected: selectedGender ==
                                                  Gender.female.apiKey,
                                              groupValue: selectedGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedGender = value!;
                                                  isEdited = true;
                                                });
                                              },
                                              title: Text(
                                                AppLocalizations.of(context)
                                                    .translate('female'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        color: Colors.grey[100],
                                        width: double.infinity,
                                        margin: EdgeInsets.all(8),
                                        padding: EdgeInsets.all(13),
                                        child: TextFormField(
                                          controller: _summaryController,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              isEdited = true;
                                            });
                                          },
                                          minLines: 3,
                                          maxLines: 10,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                AppLocalizations.of(context)
                                                    .translate("no summary"),
                                            hintStyle: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12),
                                            labelStyle: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                                color: primaryColor),
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.all(6),
                                      //   child: Column(
                                      //     children: [
                                      //       _countryValidator
                                      //           ? Row(
                                      //               children: [
                                      //                 Text(AppLocalizations.of(
                                      //                         context)
                                      //                     .translate(
                                      //                         "Country")),
                                      //                 Text(
                                      //                   "*",
                                      //                   style: TextStyle(
                                      //                       color: Colors.red),
                                      //                 )
                                      //               ],
                                      //             )
                                      //           : Container(),
                                      //       Container(
                                      //         alignment: Alignment.center,
                                      //         height:
                                      //             sizeAware.height * 0.056992,
                                      //         decoration: BoxDecoration(
                                      //           color: Colors.grey[200],
                                      //           borderRadius:
                                      //               BorderRadius.circular(10),
                                      //         ),
                                      //         child: DropdownButton<int>(
                                      //           value: selectedCountry,
                                      //           items: sl<SettingsBloc>()
                                      //                   .state
                                      //                   .countries
                                      //                   .isNotEmpty
                                      //               ? []
                                      //               : sl<SettingsBloc>()
                                      //                   .state
                                      //                   .countries
                                      //                   .map(
                                      //                     (e) =>
                                      //                         DropdownMenuItem<
                                      //                             int>(
                                      //                       value: e.id,
                                      //                       child: Padding(
                                      //                         padding:
                                      //                             const EdgeInsetsDirectional
                                      //                                 .only(
                                      //                                 start:
                                      //                                     8.0),
                                      //                         child: Text(
                                      //                           e.name!,
                                      //                           style:
                                      //                               TextStyle(
                                      //                             fontSize: 14,
                                      //                           ),
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   )
                                      //                   .toList(),
                                      //           onChanged: (selected) {
                                      //             setState(() {
                                      //               selectedCountry = selected;
                                      //               selectedCity = null;
                                      //               currentCountry =
                                      //                   sl<SettingsBloc>()
                                      //                       .state
                                      //                       .countries
                                      //                       .singleWhere((x) =>
                                      //                           x.id ==
                                      //                           selected);
                                      //               isEdited = true;
                                      //             });
                                      //           },
                                      //           isExpanded: true,
                                      //           underline: Container(),
                                      //           icon: Container(
                                      //             margin: EdgeInsets.symmetric(
                                      //                 horizontal: 10),
                                      //             child: Icon(
                                      //               Icons
                                      //                   .keyboard_arrow_down_rounded,
                                      //               color: primaryColor,
                                      //             ),
                                      //           ),
                                      //           hint: Row(
                                      //             children: [
                                      //               SizedBox(width: 4),
                                      //               Padding(
                                      //                 padding:
                                      //                     EdgeInsets.all(8.0),
                                      //                 child: Text(
                                      //                     AppLocalizations.of(
                                      //                             context)
                                      //                         .translate(
                                      //                             "Country"),
                                      //                     style: TextStyle()),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       )
                                      //     ],
                                      //   ),
                                      // ),
                                      Container(
                                        margin: EdgeInsets.all(6),
                                        child: Column(
                                          children: [
                                            // _cityValidator
                                            //     ? Row(
                                            //         children: [
                                            //           Text(AppLocalizations.of(
                                            //                   context)
                                            //               .translate("City")),
                                            //           Text(
                                            //             "*",
                                            //             style: TextStyle(
                                            //                 color: Colors.red),
                                            //           )
                                            //         ],
                                            //       )
                                            //     : Container(),
                                            // selectedCountry != null
                                            //     ? Container(
                                            //         alignment: Alignment.center,
                                            //         height: sizeAware.height *
                                            //             0.056992,
                                            //         decoration: BoxDecoration(
                                            //           color: Colors.grey[200],
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   10),
                                            //         ),
                                            //         child: DropdownButton<int>(
                                            //           value: selectedCity,
                                            //           items: currentCountry
                                            //                       ?.cities
                                            //                       .isEmpty ??
                                            //                   true
                                            //               ? []
                                            //               : currentCountry!
                                            //                   .cities
                                            //                   .map(
                                            //                     (e) =>
                                            //                         DropdownMenuItem<
                                            //                             int>(
                                            //                       value: e.id,
                                            //                       child:
                                            //                           Padding(
                                            //                         padding: const EdgeInsetsDirectional
                                            //                             .only(
                                            //                             start:
                                            //                                 8.0),
                                            //                         child: Text(
                                            //                           e.name!,
                                            //                           style:
                                            //                               TextStyle(
                                            //                             fontSize:
                                            //                                 14,
                                            //                           ),
                                            //                         ),
                                            //                       ),
                                            //                     ),
                                            //                   )
                                            //                   .toList(),
                                            //           onChanged: (selected) {
                                            //             setState(() {
                                            //               print(selected);
                                            //               selectedCity =
                                            //                   selected;
                                            //               isEdited = true;
                                            //             });
                                            //           },
                                            //           isExpanded: true,
                                            //           underline: Container(),
                                            //           icon: Container(
                                            //             margin: EdgeInsets
                                            //                 .symmetric(
                                            //                     horizontal: 10),
                                            //             child: Icon(
                                            //               Icons
                                            //                   .keyboard_arrow_down_rounded,
                                            //               color: primaryColor,
                                            //             ),
                                            //           ),
                                            //           hint: Row(
                                            //             children: [
                                            //               SizedBox(width: 4),
                                            //               Padding(
                                            //                 padding:
                                            //                     EdgeInsets.all(
                                            //                         8.0),
                                            //                 child: Text(
                                            //                     AppLocalizations.of(
                                            //                             context)
                                            //                         .translate(
                                            //                             "City"),
                                            //                     style:
                                            //                         TextStyle()),
                                            //               ),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       )
                                            //     : Container()
                                            BlocBuilder<SettingsBloc, SettingsState>(
                                              bloc: sl<SettingsBloc>(),
                                              builder: (context, state) {
                                                return Column(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.all(6),
                                                      alignment: Alignment.center,
                                                      height: sizeAware.height * 0.056992,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                        BorderRadius.circular(10),
                                                      ),
                                                      child: DropdownButton<int>(
                                                        value: selectedCountry,
                                                        items: appCountries!.isEmpty
                                                            ? []
                                                            : appCountries!
                                                            .map(
                                                              (e) =>
                                                              DropdownMenuItem<
                                                                  int>(
                                                                value: e.id,
                                                                child: Padding(
                                                                  padding:
                                                                  const EdgeInsetsDirectional
                                                                      .only(
                                                                      start:
                                                                      8.0),
                                                                  child: Text(
                                                                    e.name!,
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize: 14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                            .toList(),
                                                        onChanged: (selected) {
                                                          setState(() {
                                                            selectedCity=null;
                                                            selectedCountry = selected!;
                                                            currentCountry = appCountries!
                                                                .singleWhere((x) =>
                                                            x.id == selected);
                                                          });
                                                        },
                                                        isExpanded: true,
                                                        underline: Container(),
                                                        icon: Container(
                                                          margin: EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        hint: Row(
                                                          children: [
                                                            SizedBox(width: 4),
                                                            Padding(
                                                              padding:
                                                              EdgeInsets.all(8.0),
                                                              child: Text(
                                                                  AppLocalizations.of(
                                                                      context)
                                                                      .translate(
                                                                      "Country"),
                                                                  style: TextStyle()),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    selectedCountry != null
                                                        ?
                                                    Container(
                                                      margin: EdgeInsets.all(6),
                                                      alignment: Alignment.center,
                                                      height: sizeAware.height *
                                                          0.056992,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                      ),
                                                      child: DropdownButton<int>(
                                                        value: selectedCity??null,
                                                        items: currentCountry
                                                            ?.cities
                                                            .isEmpty ??
                                                            false
                                                            ? []
                                                            : currentCountry!
                                                            .cities
                                                            .map(
                                                              (e) =>
                                                              DropdownMenuItem<
                                                                  int>(
                                                                value: e.id,
                                                                child:
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .only(
                                                                      start:
                                                                      8.0),
                                                                  child: Text(
                                                                    e.name!,
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize:
                                                                      14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                        )
                                                            .toList(),
                                                        onChanged: (selected) {
                                                          setState(() {
                                                            print(selected);
                                                            selectedCity =
                                                            selected!;
                                                          });
                                                        },
                                                        isExpanded: true,
                                                        underline: Container(),
                                                        icon: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 10),
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        hint: Row(
                                                          children: [
                                                            SizedBox(width: 4),
                                                            Padding(
                                                              padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                              child: Text(
                                                                  AppLocalizations.of(
                                                                      context)
                                                                      .translate(
                                                                      "City"),
                                                                  style:
                                                                  TextStyle()),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                        : Container(),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      textCard(
                                        isPassword: false,
                                        prefixIcon: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: SvgPicture.asset(
                                              "assets/images/facebook.svg",
                                              color: primaryColor),
                                        ),
                                        controller: _facebookController,
                                        onChanged: (value) {
                                          setState(() {
                                            isEdited = true;
                                          });
                                        },
                                      ),
                                      textCard(
                                        isPassword: false,
                                        prefixIcon: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: SvgPicture.asset(
                                              "assets/images/linkedin.svg",
                                              color: primaryColor),
                                        ),
                                        controller: _linkedinController,
                                        onChanged: (value) {
                                          setState(() {
                                            isEdited = true;
                                          });
                                        },
                                      ),
                                      textCard(
                                        isPassword: false,
                                        prefixIcon: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: SvgPicture.asset(
                                              "assets/images/instagram.svg",
                                              color: primaryColor),
                                        ),
                                        controller: _instagramController,
                                        onChanged: (value) {
                                          setState(() {
                                            isEdited = true;
                                          });
                                        },
                                      ),
                                      textCard(
                                        isPassword: false,
                                        prefixIcon: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: SvgPicture.asset(
                                              "assets/images/snapchat.svg",
                                              height: 32,
                                              color: primaryColor),
                                        ),
                                        controller: _snapchatController,
                                        onChanged: (value) {
                                          setState(() {
                                            isEdited = true;
                                          });
                                        },
                                      ),
                                      textCard(
                                        isPassword: false,
                                        prefixIcon: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: SvgPicture.asset(
                                              "assets/images/youtube.svg",
                                              color: primaryColor),
                                        ),
                                        controller: _youtubeController,
                                        onChanged: (value) {
                                          setState(() {
                                            isEdited = true;
                                          });
                                        },
                                      ),

                                      Container(
                                        margin: EdgeInsets.all(6),
                                        child:
                                            MultiSelectDialogField<SkillModel>(
                                          items: sl<SettingsBloc>()
                                              .state
                                              .skills
                                              .map((e) =>
                                                  MultiSelectItem(e, e.name!))
                                              .toList(),
                                          initialValue:
                                              appUser?.skills?.toList() ?? [],
                                          title: Text(
                                            AppLocalizations.of(context)
                                                .translate("Skills"),
                                            style: TextStyle(),
                                          ),
                                          // selectedColor:
                                          //     Colors.blue,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          buttonIcon: Icon(
                                            Icons.grid_on_outlined,
                                            color: primaryColor,
                                          ),

                                          itemsTextStyle:
                                              TextStyle(color: Colors.black),
                                          selectedItemsTextStyle:
                                              TextStyle(color: Colors.black),
                                          unselectedColor: Colors.grey[200],
                                          selectedColor: primaryColor,

                                          buttonText: Text(
                                            AppLocalizations.of(context)
                                                .translate("Skills"),
                                            style: TextStyle(),
                                          ),
                                          listType: MultiSelectListType.CHIP,
                                          onConfirm: (results) {
                                            listSkills = results;
                                            isEdited = true;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: sizeAware.height * 0.08,
                                      ),
                                      // Container(
                                      //   margin:
                                      //       EdgeInsets.symmetric(horizontal: 13),
                                      //   padding: EdgeInsets.all(13),
                                      //   child: baseClick(
                                      //       AppLocalizations.of(context)
                                      //           .translate("Change Password"),
                                      //       width: double.infinity,
                                      //       onTap: () {},
                                      //       height: 40,
                                      //       color: primaryColor),
                                      // ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 13),
                                        padding: EdgeInsets.all(13),
                                        child: baseClick(
                                            AppLocalizations.of(context)
                                                .translate("Save Changes"),
                                            FontWeight: FontWeight.bold,
                                            height: 40,
                                            borderColor: primaryColor,
                                            colorTitle: primaryColor,
                                            color: Colors.white, onTap: () {
                                          _bloc.add(TryEdit((b) => b
                                            ..first_name = _fnameController.text
                                            ..last_name = _lnameController.text
                                            ..email = _mailController.text
                                            ..facebook =
                                                _facebookController.text
                                            ..instagram =
                                                _instagramController.text
                                            ..linkedin =
                                                _linkedinController.text
                                            ..youtube = _youtubeController.text
                                            ..snapchat =
                                                _snapchatController.text
                                            ..phone = _phoneController.text
                                            ..countryId = selectedCountry
                                            ..cityId = selectedCity
                                            ..skills = listSkills
                                            ..summary = _summaryController.text
                                            ..image = _image
                                            ..gender = selectedGender));
                                          setState(() {
                                            isEdited = false;
                                          });
                                        }),
                                      ),
                                    ],
                                  )),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    state.isLoading
                        ? Center(
                            child: loader(context: context),
                          )
                        : Container()
                  ],
                );
              })),
    );
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}
