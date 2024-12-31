import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_bloc.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_event.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_state.dart';
import 'package:taknikat/Ui/auth_screen/page/resetpassword_page.dart';
import 'package:taknikat/Ui/auth_screen/page/signup_page.dart';
import 'package:taknikat/Ui/auth_screen/page/verification_code_page.dart';
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';
import 'package:taknikat/Ui/base_page/base_page.dart';
import 'package:taknikat/app/bloc/app_bloc.dart';
import 'package:taknikat/app/bloc/app_event.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/notifications_service.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

import '../widget/google_signIn_button.dart';
import 'login_screen.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool checkBoxValue = false;
  String vmail = "",
      vv = "",
      textpasswordlogin = "",
      textpassword = "",
      textpasswordconfirm = "",
      textemail = "",
      textname = "";
  bool isPassword = true;
  String v = "", vpassword = '', vcpassword = '', vname = '';

  var _mailControllerlogin = TextEditingController();
  var _passwordControllerlogin = TextEditingController();

  final _bloc = sl<AuthBloc>();
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  String numberPhone ='';
  TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(2024, 12, 31);//تاريخ رddddفع اخر نسخه loading & ios
    bool result = isAfterTwoDays(date);
 // return LoginScreen();
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthBloc, AuthState>(
            bloc: _bloc,
            listener: (context, state) {
              if ((state.error?.isNotEmpty ?? false) && state.error == 'api.please_verify_your_account') {
                _bloc.add(SendEmailCode((b) => b..email = state.email));

                Navigator.of(context).push(
                  PageTransition(
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.fade,
                    child: VerificationCodePage(
                      'verfy-email',number.phoneNumber.toString(),state.email??''),
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: sizeAware.width * 0.04,
                        end: sizeAware.width * 0.04,
                        top: 0),
                    child: Column(
                      children: [
                        Column(
                          children: <Widget>[
                            Container(
                              width: sizeAware.width * 0.5,
                              height: sizeAware.height * 0.3,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Image.asset(
                                'assets/images/taknikat.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context).translate("Login"),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: sizeAware.width * 0.04,
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
                                      selectorConfig: SelectorConfig(
                                        selectorType:
                                        PhoneInputSelectorType
                                            .DIALOG,
                                      ),
                                      countries:
                                      [
                                        'AF', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'BT', 'BO', 'BQ', 'BA', 'BW', 'BV', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'KH', 'CM', 'CA', 'CV', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CG', 'CD', 'CK', 'CR', 'HR', 'CU', 'CW', 'CY', 'CZ', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'SZ', 'ET', 'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE', 'IM', 'IT', 'CI', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'KP', 'KR', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MK', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NU', 'NF', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'RE', 'RO', 'RU', 'RW', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS', 'SC', 'SL', 'SG', 'SX', 'SK', 'SI', 'SB', 'SO', 'ZA', 'GS', 'SS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SE', 'CH', 'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TR', 'TM', 'TC', 'TV', 'UG', 'UA', 'AE', 'GB', 'US', 'UM', 'UY', 'UZ', 'VU', 'VA', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW'
                                      ],
                                      onInputChanged: (PhoneNumber number) {
                                       this.number = number;
                                       numberPhone=number.parseNumber();
                                       print('sddsf ${numberPhone}');
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
                                      textFieldController: _mailControllerlogin,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Column(children: [
                            //   textCard(
                            //     keyboardType: TextInputType.phone,
                            //     name: AppLocalizations.of(context)
                            //         .translate("Phone"),
                            //     controller: _mailControllerlogin,
                            //     prefixIcon: Container(
                            //       padding: EdgeInsets.symmetric(vertical: 8),
                            //       child: SvgPicture.asset(
                            //           "assets/images/call.svg",
                            //           color: primaryColor),
                            //     ),
                            //     obscureText: isPassword,
                            //   ),
                            //   textemail.isNotEmpty
                            //       ? Container(
                            //           margin:
                            //               EdgeInsets.symmetric(horizontal: 10),
                            //           alignment:
                            //               AlignmentDirectional.centerStart,
                            //           child: Text(
                            //             textemail,
                            //             textAlign: TextAlign.start,
                            //             style: TextStyle(
                            //               color: Colors.red,
                            //             ),
                            //           ),
                            //         )
                            //       : Container(),
                            // ]),
                            Column(children: [
                              textCard(
                                name: AppLocalizations.of(context)
                                    .translate("Password"),
                                isPassword: true,
                                controller: _passwordControllerlogin,
                                prefixIcon: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
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
                              textpasswordlogin.isNotEmpty
                                  ? Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        textpasswordlogin,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ]),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          start: sizeAware.width * 0.04),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                PageTransition(
                                                    duration: Duration(
                                                        milliseconds: 700),
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        ResetPasswordScreen()));
                                          },
                                          child: baseText(
                                            AppLocalizations.of(context)
                                                .translate(
                                                    "forgot your password ?"),
                                            color: primaryColor,
                                            size: sizeAware.width * 0.04,
                                          )))
                                ]),
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
                                        radius: 20,
                                        height: 50,
                                        FontWeight: FontWeight.bold,
                                        sizeTitle: sizeAware.width * 0.04,
                                        color: othercolor,
                                        width: double.infinity, onTap: () {
                                      setState(() {
                                        textemail = v = textpasswordlogin;
                                        if (_mailControllerlogin.text.isEmpty) {
                                          textemail = "phone required".tr(context);
                                        } else if (_passwordControllerlogin.text.isEmpty) {
                                          v = "red";
                                          textpasswordlogin = AppLocalizations.of(context).translate("password required");
                                        }
                                        // else if (!RegExp(
                                        //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        //     .hasMatch(
                                        //         _mailControllerlogin.text)) {
                                        //   textemail =
                                        //       "Enter Valid Email".tr(context);
                                        // }
                                        else {
                                          _bloc.add(TryLogin((b) => b
                                            ..phone =
                                                // '+971552520225'
                                                number.phoneNumber
                                            ..password =
                                                _passwordControllerlogin.text));
                                        }
                                      });
                                    }),
                                  ),
                              SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2),
                                    child: baseText(
                                      AppLocalizations.of(context).translate(
                                          "You don't have an account"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(PageTransition(
                                          duration: Duration(milliseconds: 700),
                                          type: PageTransitionType.fade,
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
                            SizedBox(height: 5,),

                           if(Platform.isIOS&&result==true)
                            GoogleSignInButton()
                            else if(Platform.isAndroid)
                             GoogleSignInButton(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(PageTransition(
                                      duration: Duration(milliseconds: 700),
                                      type: PageTransitionType.fade,
                                      child: BasePage()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: sizeAware.height * 0.06,
                                      bottom: sizeAware.height * 0.04),
                                  child:
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        /////push to home page ////
                                        baseText(
                                          AppLocalizations.of(context)
                                              .translate("Enter as a Gust"),
                                          color: primaryColor,
                                          size: sizeAware.width * 0.04,
                                        ),
                                        SizedBox(
                                          width: sizeAware.width * 0.01,
                                        ),
                                        AppLocalizations.of(context)
                                                    .locale
                                                    .toLanguageTag() ==
                                                "ar"
                                            ? Icon(
                                                Icons.arrow_back_outlined,
                                                color: primaryColor,
                                              )
                                            : RotatedBox(
                                                quarterTurns: 2,
                                                child: Icon(
                                                  Icons.arrow_back_outlined,
                                                  color: primaryColor,
                                                ),

                                                //  onPressed: null,
                                              ),
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
  bool isAfterTwoDays(DateTime givenDate) {
    DateTime currentDate = DateTime.now();
    DateTime targetDate = givenDate.add(Duration(days: 2));
    return currentDate.isAfter(targetDate);
  }
}
