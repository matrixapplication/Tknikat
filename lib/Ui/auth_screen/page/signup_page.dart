import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_bloc.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_event.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_state.dart';
import 'package:taknikat/Ui/auth_screen/page/verification_code_page.dart';
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_bloc.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_state.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/model/country/country_model.dart';

import '../../../injectoin.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  final _bloc = sl<AuthBloc>();
  bool checkBoxValue = false;
  int? selectedCountry;
  int? selectedCity;
  Country? currentCountry;
  String selectedGender = "";

  String vmail = "",
      vv = "",
      textphonelogin = "",
      textphone = "",
      textpasswordlogin = "",
      textpassword = "",
      textpasswordconfirm = "",
      textemail = "",
      textname = "";
  String v = "", vpassword = '', vcpassword = '', vfname = '', vlname = '';
  var _fnameController = TextEditingController();
  var _lnameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwordConfirmController = TextEditingController();

  File image = File("");
  bool uploadImage = false;
  final picker = ImagePicker();
  bool isPassword = true;
  bool isPasswordconfirm = true;
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  final formKey = GlobalKey<FormState>();
  var _mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.successSignup) {
            _passwordController.clear();
            _phoneController.clear();
            _fnameController.clear();
            _lnameController.clear();
            _passwordConfirmController.clear();

            Navigator.of(context).push(PageTransition(
                duration: Duration(milliseconds: 700),
                type: PageTransitionType.fade,
                child: VerificationCodePage( 'signup',state.user.phoneNumber!,state.user.email??'')));
          }
        },
        builder: (BuildContext context, AuthState state) {
          showToast(state.error);
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: primaryColor, //change your color here
                ),
                title: baseText(
                  AppLocalizations.of(context).translate("Sign Up"),
                  color: primaryColor,
                )),
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: sizeAware.height - 50,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                // Container(
                                //   decoration: new BoxDecoration(
                                //       color: Colors.transparent),
                                //   child: Stack(
                                //     children: <Widget>[
                                //       InkWell(
                                //         onTap: () {
                                //           getImage();
                                //         },
                                //         child: Card(
                                //             elevation: 2,
                                //             shape: RoundedRectangleBorder(
                                //               side: BorderSide(
                                //                   color: Colors.grey, width: 2),
                                //               borderRadius:
                                //                   BorderRadius.circular(180),
                                //             ),
                                //             child: Container(
                                //                 padding: EdgeInsets.all(8),
                                //                 decoration: BoxDecoration(
                                //                     color: Colors.white60,
                                //                     shape: BoxShape.circle),
                                //                 child: !uploadImage
                                //                     ? CircleAvatar(
                                //                         radius:
                                //                             sizeAware.width *
                                //                                 0.12998723,
                                //                         backgroundColor:
                                //                             Colors.transparent,
                                //                         backgroundImage: AssetImage(
                                //                             "assets/images/profile.png"))
                                //                     : CircleAvatar(
                                //                         radius:
                                //                             sizeAware.width *
                                //                                 0.12998723,
                                //                         backgroundColor:
                                //                             Colors.transparent,
                                //                         backgroundImage:
                                //                             FileImage(image),
                                //                       ))),
                                //       ),
                                //       Positioned(
                                //         bottom: 0,
                                //         left: 0,
                                //         child: Center(
                                //             child: GestureDetector(
                                //                 onTap: () {
                                //                   getImage();
                                //                 },
                                //                 child: Card(
                                //                     elevation: 10,
                                //                     shape:
                                //                         RoundedRectangleBorder(
                                //                       side: BorderSide(
                                //                           color: Colors.white70,
                                //                           width: 1),
                                //                       borderRadius:
                                //                           BorderRadius.circular(
                                //                               180),
                                //                     ),
                                //                     child: CircleAvatar(
                                //                       radius: sizeAware.width *
                                //                           0.040,
                                //                       backgroundColor:
                                //                           Colors.white,
                                //                       child: CircleAvatar(
                                //                         radius:
                                //                             sizeAware.width *
                                //                                 0.04,
                                //                         backgroundColor:
                                //                             Colors.white,
                                //                         child: Icon(
                                //                           Icons
                                //                               .camera_alt_outlined,
                                //                           color: primaryColor,
                                //                         ),
                                //                       ),
                                //                     )))),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                SizedBox(
                                  height: sizeAware.height * 0.04,
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  textCard(
                                                    name: AppLocalizations.of(
                                                            context)
                                                        .translate("First Name"),
                                                    isPassword: false,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    controller: _fnameController,
                                                    prefixIcon: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      child: SvgPicture.asset(
                                                          "assets/images/user.svg",
                                                          color: primaryColor),
                                                    ),
                                                      validator:(value){
                                                        if (value == null || value.isEmpty) {
                                                          return 'This field cannot be empty';
                                                        }
                                                        if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                                          return 'This field cannot contain numbers or special characters';
                                                        }
                                                        return null;
                                                      }
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
                                                    validator:(value){
                                                      if (value == null || value.isEmpty) {
                                                        return 'This field cannot be empty';
                                                      }
                                                      if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                                        return 'This field cannot contain numbers or special characters';
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.text,
                                                    controller: _lnameController,
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
                                      Padding(
                                        padding:  EdgeInsets.only(right: 10),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black54,
                                                  width: 1),
                                              borderRadius: BorderRadius.circular(10)),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 20.0),
                                            child: Center(
                                              child: InternationalPhoneNumberInput(
                                                countries:
                                                [
                                                  'AF', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'BT', 'BO', 'BQ', 'BA', 'BW', 'BV', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'KH', 'CM', 'CA', 'CV', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CG', 'CD', 'CK', 'CR', 'HR', 'CU', 'CW', 'CY', 'CZ', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'SZ', 'ET', 'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE', 'IM', 'IT', 'CI', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'KP', 'KR', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MK', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NU', 'NF', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'RE', 'RO', 'RU', 'RW', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS', 'SC', 'SL', 'SG', 'SX', 'SK', 'SI', 'SB', 'SO', 'ZA', 'GS', 'SS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SE', 'CH', 'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TR', 'TM', 'TC', 'TV', 'UG', 'UA', 'AE', 'GB', 'US', 'UM', 'UY', 'UZ', 'VU', 'VA', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW'
                                                ],
                                                onInputChanged: (PhoneNumber number) {
                                                  this.number = number;
                                                },
                                                maxLength: 100,
                                                onInputValidated: (bool value) {
                                                  print(value);
                                                },
                                                spaceBetweenSelectorAndTextField:5,
                                                inputDecoration: InputDecoration(
                                                  focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2.0,
                                                          color: Colors.transparent)),
                                                  border: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[600],
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
                                                initialValue: number,
                                                textFieldController: _phoneController,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          textCard(
                                            name: AppLocalizations.of(context)
                                                .translate("Email"),
                                            isPassword: false,
                                            keyboardType: TextInputType.emailAddress,
                                            controller: _mailController,
                                            prefixIcon: Container(
                                              padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                              child: SvgPicture.asset(
                                                  "assets/images/mail.svg",
                                                  color: primaryColor),
                                            ),
                                          ),
                                          textemail.isNotEmpty
                                              ? Align(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            child: Text(
                                              textemail,
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          )
                                              : Container(),
                                        ],
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

                                      textCard(
                                        name: AppLocalizations.of(context)
                                            .translate("Password"),
                                        isPassword: true,
                                        controller: _passwordController,
                                        prefixIcon: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: SvgPicture.asset(
                                              "assets/images/lock.svg",
                                              color: primaryColor),
                                        ),
                                        obscureText: isPassword,
                                        suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isPassword = !isPassword;
                                              });
                                            },
                                            child: Icon(
                                              isPassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.grey,
                                            )),
                                      ),
                                      textpassword.isNotEmpty
                                          ? Align(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              child: Text(
                                                textpassword,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      textCard(
                                        name: AppLocalizations.of(context)
                                            .translate("Confirm Password"),
                                        isPassword: true,
                                        controller: _passwordConfirmController,
                                        prefixIcon: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: SvgPicture.asset(
                                              "assets/images/lock.svg",
                                              color: primaryColor),
                                        ),
                                        obscureText: isPasswordconfirm,
                                        suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isPasswordconfirm =
                                                    !isPasswordconfirm;
                                              });
                                            },
                                            child: Icon(
                                              isPasswordconfirm
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.grey,
                                            )),
                                      ),
                                      textpasswordconfirm.isNotEmpty
                                          ? Align(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
                                              child: Text(
                                                textpasswordconfirm,
                                                style:
                                                    TextStyle(color: Colors.red),
                                              ),
                                            )
                                          : Container(),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       child: RadioListTile<String>(
                                      //         contentPadding: EdgeInsets.zero,
                                      //         value: Gender.male.apiKey,
                                      //         groupValue: selectedGender,
                                      //         onChanged: (value) {
                                      //           setState(() {
                                      //             selectedGender = value!;
                                      //           });
                                      //           print(selectedGender);
                                      //         },
                                      //         title: Text(
                                      //           AppLocalizations.of(context)
                                      //               .translate('male'),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       child: RadioListTile<String>(
                                      //         contentPadding: EdgeInsets.zero,
                                      //         value: Gender.female.apiKey,
                                      //         groupValue: selectedGender,
                                      //         onChanged: (value) {
                                      //           setState(() {
                                      //             selectedGender = value!;
                                      //           });
                                      //           print(selectedGender);
                                      //         },
                                      //         title: Text(
                                      //           AppLocalizations.of(context)
                                      //               .translate('female'),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // BlocBuilder<SettingsBloc, SettingsState>(
                                      //   bloc: sl<SettingsBloc>(),
                                      //   builder: (context, state) {
                                      //     return Column(
                                      //       children: [
                                      //         Container(
                                      //           margin: EdgeInsets.all(6),
                                      //           alignment: Alignment.center,
                                      //           height:
                                      //               sizeAware.height * 0.056992,
                                      //           decoration: BoxDecoration(
                                      //             color: Colors.grey[200],
                                      //             borderRadius:
                                      //                 BorderRadius.circular(10),
                                      //           ),
                                      //           child: DropdownButton<int>(
                                      //             value: selectedCountry,
                                      //             items: state.countries.isEmpty
                                      //                 ? []
                                      //                 : state.countries
                                      //                     .map(
                                      //                       (e) =>
                                      //                           DropdownMenuItem<
                                      //                               int>(
                                      //                         value: e.id,
                                      //                         child: Padding(
                                      //                           padding:
                                      //                               const EdgeInsetsDirectional
                                      //                                       .only(
                                      //                                   start:
                                      //                                       8.0),
                                      //                           child: Text(
                                      //                             e.name!,
                                      //                             style:
                                      //                                 TextStyle(
                                      //                               fontSize: 14,
                                      //                             ),
                                      //                           ),
                                      //                         ),
                                      //                       ),
                                      //                     )
                                      //                     .toList(),
                                      //             onChanged: (selected) {
                                      //               setState(() {
                                      //                 selectedCountry = selected!;
                                      //                 currentCountry = state
                                      //                     .countries
                                      //                     .singleWhere((x) =>
                                      //                         x.id == selected);
                                      //               });
                                      //             },
                                      //             isExpanded: true,
                                      //             underline: Container(),
                                      //             icon: Container(
                                      //               margin: EdgeInsets.symmetric(
                                      //                   horizontal: 10),
                                      //               child: Icon(
                                      //                 Icons
                                      //                     .keyboard_arrow_down_rounded,
                                      //                 color: primaryColor,
                                      //               ),
                                      //             ),
                                      //             hint: Row(
                                      //               children: [
                                      //                 SizedBox(width: 4),
                                      //                 Padding(
                                      //                   padding:
                                      //                       EdgeInsets.all(8.0),
                                      //                   child: Text(
                                      //                       AppLocalizations.of(
                                      //                               context)
                                      //                           .translate(
                                      //                               "Country"),
                                      //                       style: TextStyle()),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ),
                                      //         selectedCountry != null
                                      //             ? Container(
                                      //                 margin: EdgeInsets.all(6),
                                      //                 alignment: Alignment.center,
                                      //                 height: sizeAware.height *
                                      //                     0.056992,
                                      //                 decoration: BoxDecoration(
                                      //                   color: Colors.grey[200],
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           10),
                                      //                 ),
                                      //                 child: DropdownButton<int>(
                                      //                   value: selectedCity,
                                      //                   items: currentCountry
                                      //                               ?.cities
                                      //                               .isEmpty ??
                                      //                           false
                                      //                       ? []
                                      //                       : currentCountry!
                                      //                           .cities
                                      //                           .map(
                                      //                             (e) =>
                                      //                                 DropdownMenuItem<
                                      //                                     int>(
                                      //                               value: e.id,
                                      //                               child:
                                      //                                   Padding(
                                      //                                 padding: const EdgeInsetsDirectional
                                      //                                         .only(
                                      //                                     start:
                                      //                                         8.0),
                                      //                                 child: Text(
                                      //                                   e.name!,
                                      //                                   style:
                                      //                                       TextStyle(
                                      //                                     fontSize:
                                      //                                         14,
                                      //                                   ),
                                      //                                 ),
                                      //                               ),
                                      //                             ),
                                      //                           )
                                      //                           .toList(),
                                      //                   onChanged: (selected) {
                                      //                     setState(() {
                                      //                       print(selected);
                                      //                       selectedCity =
                                      //                           selected!;
                                      //                     });
                                      //                   },
                                      //                   isExpanded: true,
                                      //                   underline: Container(),
                                      //                   icon: Container(
                                      //                     margin: EdgeInsets
                                      //                         .symmetric(
                                      //                             horizontal: 10),
                                      //                     child: Icon(
                                      //                       Icons
                                      //                           .keyboard_arrow_down_rounded,
                                      //                       color: primaryColor,
                                      //                     ),
                                      //                   ),
                                      //                   hint: Row(
                                      //                     children: [
                                      //                       SizedBox(width: 4),
                                      //                       Padding(
                                      //                         padding:
                                      //                             EdgeInsets.all(
                                      //                                 8.0),
                                      //                         child: Text(
                                      //                             AppLocalizations.of(
                                      //                                     context)
                                      //                                 .translate(
                                      //                                     "City"),
                                      //                             style:
                                      //                                 TextStyle()),
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                 ),
                                      //               )
                                      //             : Container(),
                                      //       ],
                                      //     );
                                      //   },
                                      // ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: sizeAware.width * 0.04,
                                              top: 2),
                                          child: StatefulBuilder(
                                            builder: (context, setState) =>
                                                CheckboxListTile(
                                              shape: RoundedRectangleBorder(
                                                  side: BorderSide.none),
                                              title: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "Agree to the terms and conditions"),
                                                ),
                                              ),
                                              visualDensity:
                                                  VisualDensity.comfortable,
                                              activeColor: primaryColor,
                                              value: checkBoxValue,
                                              onChanged: (isChecked) {
                                                print(isChecked);
                                                setState(() {
                                                  checkBoxValue = isChecked!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: sizeAware.width * 0.04, top: 2),
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            launchURL(
                                                'https://sites.google.com/view/taknikatprivacypolicy/main_page');
                                          },
                                          child: Text('سياسة الخصوصية')),
                                      TextButton(
                                          onPressed: () {
                                            launchURL(
                                                'https://sites.google.com/view/taknikatusoeofterms/main_page');
                                          },
                                          child: Text('الشروط والأحكام')),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: sizeAware.height * 0.04),
                                  child: Column(
                                    children: <Widget>[
                                      state.isLoading
                                          ? Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 0.0,
                                                      top: sizeAware.height *
                                                          0.04),
                                              child: loader())
                                          : Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 0.0,
                                                      top: sizeAware.height *
                                                          0.04,
                                                      bottom: sizeAware.height *
                                                          0.05),
                                              child: baseClick(
                                                  AppLocalizations.of(context)
                                                      .translate("Sign Up"),
                                                  color: primaryColor,
                                                  colorTitle: Colors.white,
                                                  sizeTitle: sizeAware.width * 0.04,
                                                  FontWeight: FontWeight.bold,
                                                  radius: 20,
                                                  height: 50,
                                                  width: double.infinity,
                                                  onTap: () {
                                                    print(number.phoneNumber);

                                                    if(formKey.currentState!.validate()){

                                                      String pattern =
                                                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
                                                      RegExp regex = RegExp(pattern);
                                                      if (_fnameController.text.isEmpty ||
                                                          _lnameController.text.isEmpty) {
                                                        setState(() {
                                                          _fnameController
                                                              .text.isEmpty
                                                              ? vfname = "red"
                                                              : vlname = "red";

                                                          textname = AppLocalizations
                                                              .of(context)
                                                              .translate(
                                                              "name required");
                                                          vmail = '';
                                                          vpassword = '';
                                                          vcpassword = '';
                                                          vv = '';
                                                          textphone = '';
                                                          textpassword = '';
                                                          textpasswordconfirm = '';
                                                          textemail = '';
                                                        });
                                                        // error(AppLocalizations.of(context).translate("name required"));
                                                      }
                                                      // else if (_phoneController
                                                      //     .text.isEmpty) {
                                                      //   setState(() {
                                                      //     vfname = "";
                                                      //     vlname = "";
                                                      //     textname = '';
                                                      //     vmail = '';
                                                      //     vpassword = '';
                                                      //     vcpassword = '';
                                                      //     vv = 'red';
                                                      //     textphone = AppLocalizations
                                                      //             .of(context)
                                                      //         .translate(
                                                      //             "phone required");
                                                      //     textpassword = '';
                                                      //     textpasswordconfirm = '';
                                                      //     textemail = '';
                                                      //   });
                                                      // }
                                                    else if (_passwordController
                                                          .text.isEmpty) {
                                                        setState(() {
                                                          vpassword = "red";
                                                          textpassword = AppLocalizations
                                                              .of(context)
                                                              .translate(
                                                              "password required");
                                                          vmail = "";
                                                          textemail = '';
                                                          vfname = "";
                                                          vlname = "";
                                                          textname = '';
                                                          vcpassword = '';
                                                          vv = '';
                                                          textphone = '';
                                                          textpasswordconfirm = '';
                                                        });
                                                        // error(AppLocalizations.of(context).translate("password required"));
                                                      }

                                                      else if (!regex.hasMatch(
                                                          _mailController
                                                              .text) &&
                                                          _mailController
                                                              .text.isNotEmpty ||
                                                          _mailController
                                                              .text.isEmpty) {
                                                        setState(() {
                                                          vmail = "red";
                                                          textemail = AppLocalizations
                                                              .of(context)
                                                              .translate(
                                                              "Enter Valid Email");
                                                        });
                                                      }
                                                    else if (_passwordController
                                                          .text.length <
                                                          6) {
                                                        setState(() {
                                                          vpassword = "red";
                                                          textpassword = AppLocalizations
                                                              .of(context)
                                                              .translate(
                                                              "password must be more than 6 characters");
                                                          vmail = "";
                                                          textemail = '';
                                                          vlname = "";
                                                          vfname = "";
                                                          textname = '';
                                                          vcpassword = '';
                                                          vv = '';
                                                          textphone = '';
                                                          textpasswordconfirm = '';
                                                        });
                                                      } else if (_passwordConfirmController
                                                          .text.isEmpty) {
                                                        setState(() {
                                                          vpassword = "";
                                                          textpassword = '';
                                                          vmail = "";
                                                          textemail = '';
                                                          vfname = "";
                                                          vlname = "";
                                                          textname = '';
                                                          vv = '';
                                                          textphone = '';

                                                          vcpassword = 'red';
                                                          textpasswordconfirm =
                                                              AppLocalizations.of(
                                                                  context)
                                                                  .translate(
                                                                  "password confirm required");
                                                        });
                                                      } else if (_passwordController
                                                          .text !=
                                                          _passwordConfirmController
                                                              .text) {
                                                        setState(() {
                                                          vpassword = "";
                                                          textpassword = '';
                                                          vmail = "";
                                                          textemail = '';
                                                          vfname = "";
                                                          vlname = "";
                                                          textname = '';
                                                          vv = '';
                                                          textphone = '';
                                                          vcpassword = 'red';
                                                          textpasswordconfirm =
                                                              AppLocalizations.of(
                                                                  context)
                                                                  .translate(
                                                                  "passwords not same");
                                                        });
                                                      } else if (!checkBoxValue) {
                                                        print('dadad');
                                                        showToast(AppLocalizations.of(
                                                            context)
                                                            .translate(
                                                            "Plz agree terms and conditions"));
                                                      } else {

                                                        _bloc.add(SignUp((b) => b
                                                          ..email =
                                                              _mailController.text
                                                          ..phoneNumber = number.phoneNumber
                                                          ..password =
                                                              _passwordController
                                                                  .text
                                                          ..first_name =
                                                              _fnameController.text
                                                          ..last_name =
                                                              _lnameController.text
                                                          // ..avatar = image
                                                          // ..country =
                                                          //     selectedCountry
                                                          // ..city = selectedCity
                                                          // ..terms = checkBoxValue
                                                          // ..gender =
                                                          //     selectedGender
                                                        ));
                                                        checkBoxValue = false;
                                                    }

                                                }

                                                // Navigator.of(context).push(
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             VerificationCodePage()));
                                              }),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                state.isLoading
                    ? Center(child: loader(context: context))
                    : Container()
              ],
            ),
          );
        });
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
        uploadImage = true;
      });
    }
  }
}
