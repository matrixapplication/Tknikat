import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_bloc.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_event.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_state.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

class ChangePasswordPage extends StatefulWidget {
  final String mobile;

  ChangePasswordPage(this.mobile);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool boolValue = false;
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwordconfirmController = TextEditingController();
  bool isPassword = true;
  bool isPasswordconfirm = true;
  final _bloc = sl<AuthBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, AuthState state) {
          showToast(state.error);
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());
          if (state.success) {
            Future.delayed(
                Duration.zero,
                () => Navigator.of(context).push(PageTransition(
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.fade,
                    child: SignInPage())));
          }
          return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 0),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: sizeAware.width * 0.4,
                                height: sizeAware.height * 0.4,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: SvgPicture.asset(
                                  'assets/images/logo.svg',
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
                                      child: Container(
                                          width: double.infinity,
                                          child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  baseText(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            "New Password"),
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    size: 18.0,
                                                  ),
                                                  baseText(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            "Please enter yout new password and press Continue"),
                                                    color: Colors.black,
                                                    textAlign: TextAlign.center,
                                                    size: 14.0,
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20, bottom: 15),
                                                      child: textCard(
                                                        name:
                                                            AppLocalizations.of(
                                                                    context)
                                                                .translate(
                                                                    "Password"),
                                                        isPassword: true,
                                                        controller:
                                                            _passwordController,
                                                        prefixIcon: Icon(
                                                          Icons.lock,
                                                        ),
                                                        obscureText: isPassword,
                                                        suffixIcon:
                                                            GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    isPassword =
                                                                        !isPassword;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  isPassword
                                                                      ? Icons
                                                                          .visibility
                                                                      : Icons
                                                                          .visibility_off,
                                                                  color: Colors
                                                                      .grey,
                                                                )),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20, bottom: 15),
                                                      child: textCard(
                                                        name: AppLocalizations
                                                                .of(context)
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
                                                        suffixIcon:
                                                            GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    isPasswordconfirm =
                                                                        !isPasswordconfirm;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  isPasswordconfirm
                                                                      ? Icons
                                                                          .visibility
                                                                      : Icons
                                                                          .visibility_off,
                                                                  color: Colors
                                                                      .grey,
                                                                )),
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .only(
                                                            start: 0.0, top: 0),
                                                    child: baseClick(
                                                        AppLocalizations.of(
                                                                context)
                                                            .translate(
                                                                "Save Changes"),
                                                        colorTitle:
                                                            Colors.white,
                                                        radius: 5,
                                                        height: 50,
                                                        FontWeight:
                                                            FontWeight.bold,
                                                        sizeTitle: 14.0,
                                                        color: othercolor,
                                                        width: double.infinity,
                                                        onTap: () {
                                                      if (_passwordController
                                                          .text.isEmpty) {
                                                        showToast(AppLocalizations
                                                                .of(context)
                                                            .translate(
                                                                "password required"));
                                                      } else if (_passwordconfirmController
                                                          .text.isEmpty) {
                                                        showToast(AppLocalizations
                                                                .of(context)
                                                            .translate(
                                                                "password confirm required"));
                                                      } else if (_passwordController
                                                              .text !=
                                                          _passwordconfirmController
                                                              .text) {
                                                        showToast(AppLocalizations
                                                                .of(context)
                                                            .translate(
                                                                "passwords not same"));
                                                      }
                                                      // else {
                                                      //   _bloc.add(TryChangePassword(
                                                      //       (b) => b
                                                      //         ..mobile =
                                                      //             widget
                                                      //                 .mobile
                                                      //         ..password =
                                                      //             _passwordController
                                                      //                 .text
                                                      //         ..password_confirmation =
                                                      //             _passwordconfirmController
                                                      //                 .text));
                                                      // }
                                                      // Navigator.of(context).push(
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             LoginPage()));
                                                    }),
                                                  ),
                                                ],
                                              ))))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  state.isLoading
                      ? Center(child: loader(context: context))
                      : Container()
                ],
              ));
        });
  }
}
