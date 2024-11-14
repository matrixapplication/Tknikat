import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_bloc.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_event.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_state.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/back_arrow_button.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

class ForgetPasswordPage extends StatefulWidget {
  final String email;

  ForgetPasswordPage(
    this.email,
  );

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool boolValue = false;
  var _passwordController = TextEditingController();
  var _passwordconfirmController = TextEditingController();
  bool isPassword = true;
  bool isPasswordconfirm = true;
  String _code = "";
  bool _onEditing = true;

  late AuthBloc _bloc;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc = sl<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        bloc: _bloc,
        listener: (_, state) {
          if (state.successForget) {
            AwesomeDialog(
                headerAnimationLoop: false,
                context: context,
                btnOkText: AppLocalizations.of(context).translate("Ok"),
                btnOkColor: primaryColor,
                dialogType: DialogType.success,
                title: '',
                desc: AppLocalizations.of(context)
                    .translate("your password changed successfully"),
                btnOkOnPress: () {},
                onDismissCallback: (type) {
                  Navigator.of(context).pushReplacement(PageTransition(
                      duration: Duration(milliseconds: 500),
                      type: PageTransitionType.fade,
                      child: SignInPage()));
                }).show();
          }
        },
        builder: (BuildContext context, AuthState state) {
          showToast(state.error);

          return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 32),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    height: 260,
                                    child: Image.asset(
                                      'assets/images/taknikat.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 0, right: 0, bottom: 10),
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          elevation: 10,
                                          child: Form(
                                            key: formKey,
                                            child: Container(
                                                width: double.infinity,
                                                child: Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        baseText(
                                                            AppLocalizations
                                                                    .of(context)
                                                                .translate(
                                                                    "Please enter the code that is sent on"),
                                                            textAlign: TextAlign
                                                                .center,
                                                            color: Colors.black,
                                                            size: 16.0),
                                                        baseText(widget.email,
                                                            textAlign: TextAlign
                                                                .center,
                                                            color: primaryColor,
                                                            size: 22.0),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        8.0,
                                                                    horizontal:
                                                                        30),
                                                            child:
                                                                Directionality(
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                              child:
                                                                  PinCodeTextField(
                                                                appContext:
                                                                    context,
                                                                pastedTextStyle:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Tajawal",
                                                                  color:
                                                                      primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                length: 6,
                                                                animationType:
                                                                    AnimationType
                                                                        .fade,
                                                                validator:
                                                                    (value) {
                                                                  if ((value?.isNotEmpty ??
                                                                          false) &&
                                                                      value!.length ==
                                                                          6) {
                                                                    return null;
                                                                  }

                                                                  return AppLocalizations.of(
                                                                          context)
                                                                      .translate(
                                                                          "Code is required");
                                                                },
                                                                pinTheme: PinTheme(
                                                                    shape:
                                                                        PinCodeFieldShape
                                                                            .box,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5),
                                                                    fieldHeight:
                                                                        50,
                                                                    fieldWidth:
                                                                        40,
                                                                    activeFillColor:
                                                                        Colors.grey[
                                                                            500],
                                                                    activeColor:
                                                                        Colors.grey[
                                                                            500],
                                                                    selectedFillColor:
                                                                        primaryColor,
                                                                    selectedColor:
                                                                        primaryColor,
                                                                    inactiveColor:
                                                                        othercolor,
                                                                    inactiveFillColor:
                                                                        othercolor),
                                                                autoFocus: true,
                                                                textStyle: TextStyle(
                                                                    fontFamily:
                                                                        "Tajawal",
                                                                    color: Colors
                                                                        .white),
                                                                cursorColor:
                                                                    Colors
                                                                        .white,
                                                                animationDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            300),
                                                                enableActiveFill:
                                                                    true,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                onCompleted:
                                                                    (value) {
                                                                  _code = value;
                                                                },
                                                                onChanged:
                                                                    (value) {
                                                                  print(value);
                                                                  setState(() {
                                                                    _code =
                                                                        value;
                                                                  });
                                                                },
                                                                beforeTextPaste:
                                                                    (text) {
                                                                  return true;
                                                                },
                                                              ),
                                                            )),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        baseText(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .translate(
                                                                  "New Password"),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          size: 18.0,
                                                        ),
                                                        baseText(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .translate(
                                                                  "Please enter yout new password and press Continue"),
                                                          color: Colors.black,
                                                          textAlign:
                                                              TextAlign.center,
                                                          size: 14.0,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 20,
                                                                    bottom: 15),
                                                            child: textCard(
                                                              name: AppLocalizations
                                                                      .of(
                                                                          context)
                                                                  .translate(
                                                                      "Password"),
                                                              isPassword: true,
                                                              controller:
                                                                  _passwordController,
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return AppLocalizations.of(
                                                                          context)
                                                                      .translate(
                                                                          "password required");
                                                                }
                                                                return null;
                                                              },
                                                              prefixIcon: Icon(
                                                                Icons.lock,
                                                              ),
                                                              obscureText:
                                                                  isPassword,
                                                              suffixIcon:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          isPassword =
                                                                              !isPassword;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        isPassword
                                                                            ? Icons.visibility
                                                                            : Icons.visibility_off,
                                                                        color: Colors
                                                                            .grey,
                                                                      )),
                                                            )),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 20,
                                                                    bottom: 15),
                                                            child: textCard(
                                                              name: AppLocalizations
                                                                      .of(
                                                                          context)
                                                                  .translate(
                                                                      "Confirm Password"),
                                                              isPassword: true,
                                                              controller:
                                                                  _passwordconfirmController,
                                                              prefixIcon: Icon(
                                                                Icons.lock,
                                                              ),
                                                              obscureText:
                                                                  isPasswordconfirm,
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return AppLocalizations.of(
                                                                          context)
                                                                      .translate(
                                                                          "password confirm required");
                                                                }
                                                                if (_passwordconfirmController
                                                                        .text !=
                                                                    _passwordController
                                                                        .text) {
                                                                  return AppLocalizations.of(
                                                                          context)
                                                                      .translate(
                                                                          "passwords not same");
                                                                }
                                                                return null;
                                                              },
                                                              suffixIcon:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          isPasswordconfirm =
                                                                              !isPasswordconfirm;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        isPasswordconfirm
                                                                            ? Icons.visibility
                                                                            : Icons.visibility_off,
                                                                        color: Colors
                                                                            .grey,
                                                                      )),
                                                            )),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .only(
                                                                  start: 0.0,
                                                                  top: 0),
                                                          child: baseClick(
                                                              AppLocalizations.of(
                                                                      context)
                                                                  .translate(
                                                                      "Submit"),
                                                              colorTitle:
                                                                  Colors.white,
                                                              radius: 5,
                                                              height: 50,
                                                              FontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              sizeTitle: 14.0,
                                                              color:
                                                                  primaryColor,
                                                              width: double
                                                                  .infinity,
                                                              onTap: () {
                                                            if (!formKey
                                                                .currentState!
                                                                .validate()) {
                                                              return;
                                                            } else {
                                                              _bloc.add(
                                                                  TryForgetPasswordConfirm(
                                                                      (b) => b
                                                                        ..email =
                                                                            widget.email
                                                                        ..password =
                                                                            _passwordController.text
                                                                        ..token =
                                                                            _code));
                                                            }
                                                          }),
                                                        ),
                                                      ],
                                                    ))),
                                          ))),
                                ],
                              ),
                            ],
                          ),
                        ),
                        appLanguage == 'en'
                            ? BackButtonArrowLeft()
                            : BackButtonArrowRight(),
                        state.isLoading
                            ? Center(
                                child: loader(context: context),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  bool resendCode = false;

  Stream<String> _clock() async* {
    for (int i = 60; i >= 1; i--) {
      yield i.toString();
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    setState(() {
      resendCode = false;
    });
  }
}
