import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_bloc.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/utils/globle.dart';
import '../../base_page/base_page.dart';
import '../../setting_page/bloc/settings_event.dart';
import '../../setting_page/bloc/settings_state.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'otp/widgets/auth_header_widget.dart';

class CompleteProfilePage extends StatefulWidget {
  final String email;
  final String phone;

  CompleteProfilePage({required this.phone, required this.email});

  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  bool isSwitched = true;
  bool stateAnimation = false;
  bool stateAnimationLanguage = false;
  bool isEdited = false;

  PhoneNumber initPhone =
      PhoneNumber(phoneNumber: '', dialCode: '+963', isoCode: 'SA');

  String vmail = "", vv = "", textphone = "", textemail = "", textname = "";
  String v = "", vfname = '', vlname = '';

  var _phoneController = TextEditingController();
  File? _image;
  final _bloc = sl<AuthBloc>();
  final _bloc2 = sl<SettingsBloc>();
  int? selectedCountry;
  int? selectedCity;
  String selectedGender = '';
  Country? currentCountry;
  List<SkillModel> listSkills = [];

  @override
  void initState() {
    super.initState();
    _bloc2.add(InitSettings());
    _phoneController.text = widget.phone ?? '';
    // init();
  }

  // void init() async {
  //   if (appUser!.phoneNumber != null) {
  //     final initPhone = phs.PhoneNumber.parse(appUser!.phoneNumber!);
  //     this.initPhone = PhoneNumber(
  //       phoneNumber: initPhone.nsn,
  //       dialCode: initPhone.countryCode,
  //       isoCode: initPhone.isoCode.name,
  //     );
  //     setState(() {});
  //   }
  // }

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

  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  var _mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    sl<SettingsBloc>().add(InitSettings());
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = isEdited ? await _onBackPressed() : true;
        return shouldPop ?? false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   backgroundColor: primaryColor,
          //   title: baseText(
          //       AppLocalizations.of(context).translate("Complete_Profile"),
          //       color: Colors.white),
          // ),
          body: BlocConsumer(
              bloc: _bloc,
              listener: (BuildContext context, AuthState state) {
                if (state.successComplete) {
                  Navigator.of(context).pushReplacement(PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.fade,
                      child: BasePage()));
                  // Future.delayed(Duration.zero, () {
                  //   AwesomeDialog(
                  //     context: context,
                  //     btnOkText: AppLocalizations.of(context).translate("Ok"),
                  //     btnOkColor: primaryColor,
                  //     dialogType: DialogType.success,
                  //     title: AppLocalizations.of(context)
                  //         .translate("profile edit"),
                  //     desc: AppLocalizations.of(context).translate(
                  //         "your profile has been updated successfully"),
                  //     btnOkOnPress: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //   )..show();
                  // });
                }
              },
              builder: (BuildContext context, AuthState state) {
                showToast(state.error);
                var sizeAware2 = MediaQuery.sizeOf(context);
                // if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: SvgPicture.asset(
                        AppImages.back,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Image.asset(AppImages.backGround,height: double.infinity,fit: BoxFit.cover,),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.0),
                        child: Column(
                          children: [
                            // Align(
                            //   alignment: AlignmentDirectional.topStart,
                            //   child: Container(
                            //     margin: EdgeInsets.all(13),
                            //     child: baseText(
                            //         AppLocalizations.of(context)
                            //             .translate("Edit Profile Data"),
                            //         size: sizeAware2.width * 0.05,
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            SizedBox(
                              height: sizeAware2.height * 0.05,
                            ),
                            AuthHeaderWidget(
                              title: AppLocalizations.of(context)
                                  .translate("Complete_Profile"),
                            ),
                            26.height,
                            Container(
                                margin: 16.paddingHorizontal,
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
                                                backgroundColor: Colors.white,
                                                radius: sizeAware2.width * 0.16,
                                                backgroundImage: (_image != null
                                                    ? FileImage(_image!)
                                                    : state.user.avatar != null
                                                        ? CachedNetworkImageProvider(
                                                            getImagePath(state
                                                                .user.avatar!))
                                                        : AssetImage(AppImages
                                                            .person)) as ImageProvider,
                                              )),
                                          Positioned(
                                              bottom: 0,
                                              left: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.05),
                                                          blurRadius: 8,
                                                          offset: Offset(3, 6))
                                                    ]),
                                                child: GestureDetector(
                                                    onTap: () {
                                                      getImage();
                                                      // setState(() {
                                                      //   isEdited = true;
                                                      // });
                                                    },
                                                    child: CircleAvatar(
                                                      radius: sizeAware2.width *
                                                          0.045,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: CircleAvatar(
                                                          radius: sizeAware2
                                                                  .width *
                                                              0.04,
                                                          backgroundColor:
                                                              Colors.white,
                                                          //backgroundImage:
                                                          child:
                                                              SvgPicture.asset(
                                                                  AppImages
                                                                      .image)
                                                          // Icon(
                                                          //   Icons
                                                          //       .camera_alt_outlined,
                                                          //   color: primaryColor,
                                                          // ),
                                                          ),
                                                    )),
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: sizeAware2.height * 0.04,
                                    ),
                                    BlocConsumer<SettingsBloc, SettingsState>(
                                      listener: (context, state) {},
                                      bloc: _bloc2,
                                      builder: (context, state) {
                                        return Column(
                                          children: [
                                            if (widget.phone.isEmpty) ...[
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 0, left: 0),
                                                    child: Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.03),
                                                                blurRadius: 5,
                                                                offset: Offset(
                                                                    4, 8))
                                                          ],
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.05),
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 6,
                                                              vertical: 2),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30.0,
                                                        right: 20,
                                                        top: 5),
                                                    child: Center(
                                                      child:
                                                          InternationalPhoneNumberInput(
                                                        cursorColor:
                                                            Colors.white,
                                                        selectorConfig:
                                                            SelectorConfig(
                                                          selectorType:
                                                              PhoneInputSelectorType
                                                                  .BOTTOM_SHEET,
                                                        ),
                                                        errorMessage:
                                                            AppLocalizations.of(
                                                                    context)
                                                                .translate(
                                                                    "InvalidMess"),
                                                        countries: countryList,
                                                        onInputChanged:
                                                            (PhoneNumber
                                                                number) {
                                                          this.number = number;
                                                        },
                                                        maxLength: 100,
                                                        onInputValidated:
                                                            (bool value) {
                                                          print(value);
                                                        },
                                                        spaceBetweenSelectorAndTextField:
                                                            5,
                                                        inputDecoration:
                                                            InputDecoration(
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      width:
                                                                          2.0,
                                                                      color: Colors
                                                                          .white)),
                                                          border:
                                                              InputBorder.none,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .grey[600],
                                                              fontSize: 15),
                                                          hintText:
                                                              AppLocalizations.of(
                                                                      context)
                                                                  .translate(
                                                            "Phone Number",
                                                          ),
                                                        ),
                                                        ignoreBlank: false,
                                                        textStyle: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                        autoValidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        selectorTextStyle:
                                                            TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                        // initialValue: number,
                                                        textFieldController:
                                                            TextEditingController(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              16.height,
                                            ],
                                            if (widget.email.isEmpty) ...[
                                              CustomTextField(
                                                textInputType:
                                                    TextInputType.emailAddress,
                                                borderColor: Colors.transparent,
                                                contentHorizontalPadding: 16,
                                                borderRadius: 12,
                                                hasShadow: true,
                                                hintText:
                                                    AppLocalizations.of(context)
                                                        .translate("Email"),
                                                controller: _mailController,
                                              ),
                                              16.height,
                                            ],
                                            Container(
                                              margin: EdgeInsets.all(6),
                                              alignment: Alignment.center,
                                              height:
                                                  sizeAware2.height * 0.056992,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.03),
                                                      blurRadius: 5,
                                                      offset: Offset(4, 8))
                                                ],
                                                color: Colors.white,
                                                border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
                                                borderRadius: BorderRadius.circular(10),
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
                                                    selectedCountry = selected!;
                                                    currentCountry =
                                                        appCountries!
                                                            .singleWhere((x) =>
                                                                x.id ==
                                                                selected);
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
                                                ? Container(
                                                    margin: EdgeInsets.all(6),
                                                    alignment: Alignment.center,
                                                    height: sizeAware2.height *
                                                        0.056992,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(0.03),
                                                            blurRadius: 5,
                                                            offset: Offset(4, 8))
                                                      ],
                                                      color: Colors.white,
                                                      border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: DropdownButton<int>(
                                                      value: selectedCity,
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
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile<String>(
                                              contentPadding: EdgeInsets.zero,
                                              value: Gender.male.apiKey,
                                              groupValue: selectedGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedGender = value!;
                                                });
                                                print(selectedGender);
                                              },
                                              title:
                                             Container(
                                               decoration: BoxDecoration(
                                                 boxShadow: [
                                                   BoxShadow(
                                                       color: Colors.black
                                                           .withOpacity(0.03),
                                                       blurRadius: 5,
                                                       offset: Offset(4, 8))
                                                 ],
                                                 // color: Colors.white,
                                                 border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
                                                 borderRadius: BorderRadius.circular(20),
                                               ),
                                               padding: 16.paddingHorizontal+8.paddingVert,
                                               child: Row(
                                                 children: [
                                                   SvgPicture.asset(AppImages.male),
                                                   8.width,

                                                   Text(
                                                     AppLocalizations.of(context)
                                                         .translate('male'),
                                                   ),

                                                 ],
                                               ),
                                             )
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile<String>(
                                              contentPadding: EdgeInsets.zero,
                                              value: Gender.female.apiKey,
                                              groupValue: selectedGender,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedGender = value!;
                                                });
                                                print(selectedGender);
                                              },
                                              title:

                                              Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.03),
                                                        blurRadius: 5,
                                                        offset: Offset(4, 8))
                                                  ],
                                                  // color: Colors.white,
                                                  border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                padding: 16.paddingHorizontal+8.paddingVert,
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(AppImages.female),
                                                    8.width,

                                                    Text(
                                                      AppLocalizations.of(context)
                                                          .translate('female'),


                                                    ),

                                                  ],
                                                ),
                                              )

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: sizeAware2.height * 0.02,
                                    ),
                                    16.height,
                                    CustomButton(
                                       loading: state.isLoading,
                                        onTap: (){
                                          String pattern =
                                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

                                          RegExp regex = RegExp(pattern);
                                          print("zzacczczxcxzc");

                                          if (_phoneController.text.isEmpty) {
                                            showToast(
                                              AppLocalizations.of(context)
                                                  .translate("phone required"),
                                            );
                                          } else if (widget.email.isEmpty
                                              ? (!regex.hasMatch(
                                              _mailController.text) &&
                                              _mailController
                                                  .text.isNotEmpty ||
                                              _mailController.text.isEmpty)
                                              : 1 == 2) {
                                            setState(() {
                                              vmail = "red";
                                              textemail = AppLocalizations.of(
                                                  context)
                                                  .translate("Enter Valid Email");
                                            });
                                          } else if (selectedCountry == null) {
                                            showToast(
                                              AppLocalizations.of(context)
                                                  .translate("country required"),
                                            );
                                          } else if (selectedCity == null) {
                                            showToast(
                                              AppLocalizations.of(context)
                                                  .translate("city required"),
                                            );
                                          } else if (_image == null) {
                                            showToast(
                                              AppLocalizations.of(context)
                                                  .translate("image required"),
                                            );
                                          } else if (selectedGender.isEmpty) {
                                            showToast(
                                              AppLocalizations.of(context)
                                                  .translate("required gender"),
                                            );
                                          } else {
                                            print("ffdg");
                                            _bloc.add(CompleteProfile((b) => b
                                              ..email = widget.email.isNotEmpty
                                                  ? widget.email
                                                  : _mailController.text
                                              ..phoneNumber =
                                                  _phoneController.text
                                              ..country = selectedCountry
                                              ..city = selectedCity
                                              ..avatar = _image
                                              ..gender = selectedGender));
                                            setState(() {
                                              isEdited = false;
                                            });
                                          }
                                          print("dsfdsfsafsfsaf");
                                        },
                                        title: AppLocalizations.of(context)
                                            .translate("continue"),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    ),
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
