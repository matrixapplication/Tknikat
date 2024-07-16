import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/appBar.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

import 'bloc/edit_profile_bloc.dart';
import 'bloc/edit_profile_event.dart';
import 'bloc/edit_profile_state.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isSwitched = true;
  bool stateAnimation = false;
  bool stateAnimationLanguage = false;
  String? dropdownLanguage, dropdownMony;
  var _passwordnewController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwordconfirmController = TextEditingController();
  bool isPassword = true, isPasswordnew = true, isPasswordconfirm = true;
  final _bloc = sl<EditProfileBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, EditProfileState state) {
          if (state.success && Navigator.canPop(context))
            Future.delayed(Duration.zero, () => Navigator.pop(context));
          showToast(state.error);
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: appBar(
                context: this.context,
                //'التصوير',

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: baseText(
                      AppLocalizations.of(context).translate('Change Password'),
                      color: Colors.black,
                      size: sizeAware.width * 0.04,
                    ))
                  ],
                ),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    // new Positioned(
                    //     top: 16.0,
                    //     right: 13.0,
                    //     child: new Center(
                    //       child: Container(
                    //         margin: EdgeInsets.only(right: 5),
                    //         width: 7,
                    //         height: 7,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: primaryColor,
                    //         ),
                    //       ),
                    //     )),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  new SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: sizeAware.width * 0.05,
                            end: sizeAware.width * 0.05,
                            top: sizeAware.height * 0.03,
                            bottom: sizeAware.height * 0.04),
                        child: Column(
                          children: [
                            SizedBox(
                              height: sizeAware.height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                baseText(
                                    AppLocalizations.of(context)
                                        .translate('Change Password'),
                                    size: sizeAware.width * 0.05,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.02,
                            ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          start: sizeAware.width * 0.05,
                                          end: sizeAware.width * 0.05,
                                          top: sizeAware.height * 0.03,
                                          bottom: sizeAware.height * 0.04),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              baseText(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          'Old Password'),
                                                  size: sizeAware.width * 0.05,
                                                  color: Colors.black),
                                            ],
                                          ),
                                          SizedBox(
                                            height: sizeAware.height * 0.02,
                                          ),
                                          textCard(
                                            name: AppLocalizations.of(context)
                                                .translate("Password"),
                                            isPassword: true,
                                            controller: _passwordController,
                                            prefixIcon: Icon(
                                              Icons.lock,
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
                                          SizedBox(
                                            height: sizeAware.height * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              baseText(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          'New Password'),
                                                  size: sizeAware.width * 0.05,
                                                  color: Colors.black),
                                            ],
                                          ),
                                          SizedBox(
                                            height: sizeAware.height * 0.02,
                                          ),
                                          textCard(
                                            name: AppLocalizations.of(context)
                                                .translate("Password"),
                                            isPassword: true,
                                            controller: _passwordnewController,
                                            prefixIcon: Icon(
                                              Icons.lock,
                                            ),
                                            obscureText: isPasswordnew,
                                            suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isPasswordnew =
                                                        !isPasswordnew;
                                                  });
                                                },
                                                child: Icon(
                                                  isPasswordnew
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey,
                                                )),
                                          ),
                                          SizedBox(
                                            height: sizeAware.height * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              baseText(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          'Confirm Password'),
                                                  size: sizeAware.width * 0.05,
                                                  color: Colors.black),
                                            ],
                                          ),
                                          SizedBox(
                                            height: sizeAware.height * 0.02,
                                          ),
                                          textCard(
                                            name: AppLocalizations.of(context)
                                                .translate("Password"),
                                            isPassword: true,
                                            controller:
                                                _passwordconfirmController,
                                            prefixIcon: Icon(
                                              Icons.lock,
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
                                          SizedBox(
                                            height: sizeAware.height * 0.03,
                                          ),
                                          baseClick(
                                              AppLocalizations.of(context)
                                                  .translate('Save Changes'),
                                              colorTitle: Colors.white,
                                              FontWeight: FontWeight.bold,
                                              color: primaryColor,
                                              sizeTitle: sizeAware.width * 0.04,
                                              //borderColor: HexColor("#707070"),
                                              height:
                                                  50, //sizeAware.height*0.1,
                                              onTap: () {
                                            if (_passwordController
                                                .text.isEmpty) {
                                              showToast(AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      "old password required"));
                                            } else if (_passwordnewController
                                                .text.isEmpty) {
                                              showToast(AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      "new password required"));
                                            } else if (_passwordconfirmController
                                                .text.isEmpty) {
                                              showToast(AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      "confirm password required"));
                                            } else if (_passwordnewController
                                                    .text !=
                                                _passwordnewController.text) {
                                              showToast(AppLocalizations.of(
                                                      context)
                                                  .translate(
                                                      "passwords not same"));
                                            } else {
                                              _bloc.add(ResetPassword((b) => b
                                                ..old_password =
                                                    _passwordController.text
                                                ..password =
                                                    _passwordnewController.text
                                                ..password_confirmation =
                                                    _passwordconfirmController
                                                        .text));
                                            }
                                          }),
                                        ],
                                      ))),
                            ),
                            SizedBox(
                              height: sizeAware.height * 0.02,
                            )
                          ],
                        )),
                  ),
                  state.isLoading
                      ? Center(
                          child: loader(context: context),
                        )
                      : Container()
                ],
              ));
        });
  }
}
