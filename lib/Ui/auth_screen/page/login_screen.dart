import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/page/resetpassword_page.dart';
import 'package:taknikat/Ui/auth_screen/page/signup_page.dart';
import 'package:taknikat/Ui/auth_screen/page/verification_code_page.dart';
import 'package:taknikat/core/custom_text_field.dart';

import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_click.dart';
import '../../../core/base_widget/base_text.dart';
import '../../../core/base_widget/base_toast.dart';
import '../../../core/constent.dart';
import '../../../core/style/custom_loader.dart';
import '../../../injectoin.dart';
import '../../base_page/base_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widget/google_signIn_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _bloc = sl<AuthBloc>();
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  String numberPhone = '';
  TextEditingController _passwordControllerLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime date =
        DateTime(2024, 12, 8); //تاريخ رddddفع اخر نسخه android & ios
    bool result = isAfterTwoDays(date);
    return Scaffold(
        backgroundColor: primaryColor,
        body: BlocConsumer<AuthBloc, AuthState>(
            bloc: _bloc,
            listener: (context, state) {
              if ((state.error?.isNotEmpty ?? false) &&
                  state.error == 'api.please_verify_your_account') {
                _bloc.add(SendEmailCode((b) => b..email = state.email));

                Navigator.of(context).push(
                  PageTransition(
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.fade,
                    child: VerificationCodePage('verfy-email',
                        number.phoneNumber.toString(), state.email ?? ''),
                  ),
                );
              } else if (state.success) {
                Navigator.of(context).pushReplacement(PageTransition(
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.fade,
                    child: BasePage()));
              }
            },
            builder: (BuildContext context, AuthState state) {
              showToast(state.error);
              if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());
              return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: sizeAware.width * 0.5,
                              height: sizeAware.height * 0.3,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Image.asset(
                                'assets/images/taknikat.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsets.only(right: 0, left: 0),
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black54,
                                                      width: 1),
                                                  borderRadius:
                                                  BorderRadius.circular(50)),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 2),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(left: 20.0,right: 10,top: 5),
                                            child: Center(
                                              child:
                                              InternationalPhoneNumberInput(
                                                selectorConfig: SelectorConfig(
                                                  selectorType:
                                                  PhoneInputSelectorType.DIALOG,
                                                ),
                                                errorMessage:AppLocalizations.of(context).translate("InvalidMess") ,
                                                countries: [
                                                  'AF',
                                                  'AL',
                                                  'DZ',
                                                  'AS',
                                                  'AD',
                                                  'AO',
                                                  'AI',
                                                  'AQ',
                                                  'AG',
                                                  'AR',
                                                  'AM',
                                                  'AW',
                                                  'AU',
                                                  'AT',
                                                  'AZ',
                                                  'BS',
                                                  'BH',
                                                  'BD',
                                                  'BB',
                                                  'BY',
                                                  'BE',
                                                  'BZ',
                                                  'BJ',
                                                  'BM',
                                                  'BT',
                                                  'BO',
                                                  'BQ',
                                                  'BA',
                                                  'BW',
                                                  'BV',
                                                  'BR',
                                                  'IO',
                                                  'BN',
                                                  'BG',
                                                  'BF',
                                                  'BI',
                                                  'KH',
                                                  'CM',
                                                  'CA',
                                                  'CV',
                                                  'KY',
                                                  'CF',
                                                  'TD',
                                                  'CL',
                                                  'CN',
                                                  'CX',
                                                  'CC',
                                                  'CO',
                                                  'KM',
                                                  'CG',
                                                  'CD',
                                                  'CK',
                                                  'CR',
                                                  'HR',
                                                  'CU',
                                                  'CW',
                                                  'CY',
                                                  'CZ',
                                                  'DK',
                                                  'DJ',
                                                  'DM',
                                                  'DO',
                                                  'EC',
                                                  'EG',
                                                  'SV',
                                                  'GQ',
                                                  'ER',
                                                  'EE',
                                                  'SZ',
                                                  'ET',
                                                  'FK',
                                                  'FO',
                                                  'FJ',
                                                  'FI',
                                                  'FR',
                                                  'GF',
                                                  'PF',
                                                  'TF',
                                                  'GA',
                                                  'GM',
                                                  'GE',
                                                  'DE',
                                                  'GH',
                                                  'GI',
                                                  'GR',
                                                  'GL',
                                                  'GD',
                                                  'GP',
                                                  'GU',
                                                  'GT',
                                                  'GG',
                                                  'GN',
                                                  'GW',
                                                  'GY',
                                                  'HT',
                                                  'HM',
                                                  'HN',
                                                  'HK',
                                                  'HU',
                                                  'IS',
                                                  'IN',
                                                  'ID',
                                                  'IR',
                                                  'IQ',
                                                  'IE',
                                                  'IM',
                                                  'IT',
                                                  'CI',
                                                  'JM',
                                                  'JP',
                                                  'JE',
                                                  'JO',
                                                  'KZ',
                                                  'KE',
                                                  'KI',
                                                  'KP',
                                                  'KR',
                                                  'KW',
                                                  'KG',
                                                  'LA',
                                                  'LV',
                                                  'LB',
                                                  'LS',
                                                  'LR',
                                                  'LY',
                                                  'LI',
                                                  'LT',
                                                  'LU',
                                                  'MO',
                                                  'MK',
                                                  'MG',
                                                  'MW',
                                                  'MY',
                                                  'MV',
                                                  'ML',
                                                  'MT',
                                                  'MH',
                                                  'MQ',
                                                  'MR',
                                                  'MU',
                                                  'YT',
                                                  'MX',
                                                  'FM',
                                                  'MD',
                                                  'MC',
                                                  'MN',
                                                  'ME',
                                                  'MS',
                                                  'MA',
                                                  'MZ',
                                                  'MM',
                                                  'NA',
                                                  'NR',
                                                  'NP',
                                                  'NL',
                                                  'NC',
                                                  'NZ',
                                                  'NI',
                                                  'NE',
                                                  'NG',
                                                  'NU',
                                                  'NF',
                                                  'MP',
                                                  'NO',
                                                  'OM',
                                                  'PK',
                                                  'PW',
                                                  'PS',
                                                  'PA',
                                                  'PG',
                                                  'PY',
                                                  'PE',
                                                  'PH',
                                                  'PN',
                                                  'PL',
                                                  'PT',
                                                  'PR',
                                                  'QA',
                                                  'RE',
                                                  'RO',
                                                  'RU',
                                                  'RW',
                                                  'BL',
                                                  'SH',
                                                  'KN',
                                                  'LC',
                                                  'MF',
                                                  'PM',
                                                  'VC',
                                                  'WS',
                                                  'SM',
                                                  'ST',
                                                  'SA',
                                                  'SN',
                                                  'RS',
                                                  'SC',
                                                  'SL',
                                                  'SG',
                                                  'SX',
                                                  'SK',
                                                  'SI',
                                                  'SB',
                                                  'SO',
                                                  'ZA',
                                                  'GS',
                                                  'SS',
                                                  'ES',
                                                  'LK',
                                                  'SD',
                                                  'SR',
                                                  'SJ',
                                                  'SE',
                                                  'CH',
                                                  'SY',
                                                  'TW',
                                                  'TJ',
                                                  'TZ',
                                                  'TH',
                                                  'TL',
                                                  'TG',
                                                  'TK',
                                                  'TO',
                                                  'TT',
                                                  'TN',
                                                  'TR',
                                                  'TM',
                                                  'TC',
                                                  'TV',
                                                  'UG',
                                                  'UA',
                                                  'AE',
                                                  'GB',
                                                  'US',
                                                  'UM',
                                                  'UY',
                                                  'UZ',
                                                  'VU',
                                                  'VA',
                                                  'VE',
                                                  'VN',
                                                  'VG',
                                                  'VI',
                                                  'WF',
                                                  'EH',
                                                  'YE',
                                                  'ZM',
                                                  'ZW'
                                                ],
                                                onInputChanged:
                                                    (PhoneNumber number) {
                                                  this.number = number;
                                                  numberPhone = number.parseNumber();
                                                },
                                                maxLength: 100,
                                                onInputValidated: (bool value) {
                                                  print(value);
                                                },
                                                spaceBetweenSelectorAndTextField:
                                                5,
                                                inputDecoration:
                                                InputDecoration(
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2.0,
                                                          color: Colors
                                                              .transparent)),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                  InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                  InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 15),
                                                  hintText: AppLocalizations.of(
                                                      context)
                                                      .translate(
                                                    "Phone Number",
                                                  ),
                                                ),
                                                ignoreBlank: false,
                                                textStyle: TextStyle(
                                                  color: Colors.grey[600],
                                                ),
                                                autoValidateMode:
                                                AutovalidateMode.onUserInteraction,
                                                selectorTextStyle: TextStyle(
                                                  color: Colors.grey[600],
                                                ),
                                                // initialValue: number,
                                                textFieldController:
                                                TextEditingController(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: CustomTextField(
                                          borderRadius: 50,
                                          contentHorizontalPadding: 20,
                                          hintText: AppLocalizations.of(context)
                                              .translate("Password"),
                                          controller: _passwordControllerLogin,
                                          isPassword: true,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        start: sizeAware.width *
                                                            0.04),
                                                child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(PageTransition(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      700),
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  ResetPasswordScreen()));
                                                    },
                                                    child: baseText(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(
                                                              "forgot your password ?"),
                                                      color: primaryColor,
                                                      size: sizeAware.width *
                                                          0.04,
                                                    )))
                                          ]),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    state.isLoading
                                      ? Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 0.0,
                                              top: sizeAware.height * 0.04),
                                          child: loader())
                                      :
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 0.0,
                                            top: sizeAware.height * 0.04),
                                        child: baseClick(
                                            AppLocalizations.of(context)
                                                .translate("Login"),
                                            colorTitle: Colors.white,
                                            radius: 50,
                                            height: 50,
                                            FontWeight: FontWeight.bold,
                                            sizeTitle: sizeAware.width * 0.04,
                                            color: primaryColor,
                                            width: double.infinity, onTap: () {
                                          if (number.phoneNumber?.isNotEmpty ??
                                              false) {
                                            if (_passwordControllerLogin
                                                .text.isNotEmpty) {
                                              _bloc.add(TryLogin((b) => b
                                                ..phone =
                                                    // '+971552520225'
                                                    number.phoneNumber
                                                ..password =
                                                    _passwordControllerLogin
                                                        .text));
                                            } else {
                                              showToast(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          "password required"));
                                            }
                                          } else {
                                            showToast(AppLocalizations.of(
                                                    context)
                                                .translate("phone required"));
                                          }
                                        }),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2),
                                              child: baseText(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        "You don't have an account"),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    PageTransition(
                                                        duration: Duration(
                                                            milliseconds: 700),
                                                        type: PageTransitionType
                                                            .fade,
                                                        child: SignUpPage()));
                                              },
                                              child: baseText(
                                                  AppLocalizations.of(context)
                                                      .translate("Sign Up"),
                                                  textAlign: TextAlign.center,
                                                  color: primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        indent: 45,
                                        endIndent: 45,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      if (Platform.isIOS && result == true)
                                        GoogleSignInButton()
                                      else if (Platform.isAndroid)
                                        GoogleSignInButton(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              PageTransition(
                                                  duration: Duration(
                                                      milliseconds: 700),
                                                  type: PageTransitionType.fade,
                                                  child: BasePage()));
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 20),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  /////push to home page ////
                                                  baseText(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            "Enter as a Gust"),
                                                    color: primaryColor,
                                                    size:
                                                        sizeAware.width * 0.04,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        sizeAware.width * 0.01,
                                                  ),
                                                  AppLocalizations.of(context)
                                                              .locale
                                                              .toLanguageTag() ==
                                                          "ar"
                                                      ? Icon(
                                                          Icons
                                                              .arrow_back_outlined,
                                                          color: primaryColor,
                                                        )
                                                      : RotatedBox(
                                                          quarterTurns: 2,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_back_outlined,
                                                            color: primaryColor,
                                                          ),

                                                          //  onPressed: null,
                                                        ),
                                                ],
                                              ),
                                            )),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ));
            }));
  }

  bool isAfterTwoDays(DateTime givenDate) {
    DateTime currentDate = DateTime.now();
    DateTime targetDate = givenDate.add(Duration(days: 2));
    return currentDate.isAfter(targetDate);
  }
}
