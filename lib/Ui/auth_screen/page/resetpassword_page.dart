import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_bloc.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_event.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_state.dart';
import 'package:taknikat/Ui/auth_screen/page/forget_password_page.dart';
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/back_arrow_button.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/custom_text_field.dart';
import '../../../core/widgets/icon_widget.dart';
import 'forget_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool boolValue = false;
  var _mailController = TextEditingController();
  String v = '', textemail = '';

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
          if (state.successForget) {
            Future.delayed(
                Duration.zero,
                () => Navigator.of(context).pushReplacement(PageTransition(
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.fade,
                    child: ForgetPasswordPage(
                      _mailController.text,
                    ))));
          }
          return Scaffold(
              backgroundColor: Colors.white,
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
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
                                  width: sizeAware.width * 0.7,
                                  height: sizeAware.height * 0.4,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Image.asset(
                                    'assets/images/taknikat.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, bottom: 10),
                                    child: Card(
                                        surfaceTintColor: Colors.white,
                                        color: Colors.white,

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        elevation: 10,
                                        child: Container(
                                          margin: 12.paddingVert,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Colors.white,
                                          ),
                                            width: double.infinity,
                                            child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    baseText(AppLocalizations.of(context).translate("Forgot Your Password ?"),
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                      size: 18.0,
                                                    ),
                                                    baseText(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(
                                                              "Please enter the email address until the retrieval code arrive"),
                                                      color: Colors.black,
                                                      textAlign:
                                                          TextAlign.center,
                                                      size: 14.0,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 20)),
                                                    Column(children: [
                                                      CustomTextField(
                                                        fillColor: Color(0xffF7F7F8),
                                                        borderColor: Colors.grey.shade200,
                                                        contentHorizontalPadding: 16,
                                                        borderRadius:12,
                                                        prefixIcon: Icon(Icons.alternate_email),
                                                        hintText: AppLocalizations.of(context)
                                                            .translate("Email"), controller: _mailController,),

                                                      textemail.isNotEmpty
                                                          ? Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .centerStart,
                                                              child: Text(
                                                                textemail,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                    Padding(padding: EdgeInsets.only(top: 20)),

                                                    CustomButton(
                                                        title: AppLocalizations.of(context).translate("Continue"),
                                                        onTap: (){
                                                          if (_mailController
                                                              .text.isEmpty) {
                                                            setState(() {
                                                              v = 'red';
                                                              textemail =
                                                              "email required";
                                                            });
                                                          } else
                                                            _bloc.add(TryForgetPassword(
                                                                    (b) => b
                                                                  ..email =
                                                                      _mailController
                                                                          .text));
                                                        }),

                                                  ],
                                                ))))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40.h,
                        right: 10.w,
                        left: 10.w,
                        child:Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconWidget(
                              onTap: (){
                                context.pop();
                              },
                              color: Colors.white38,
                              widget: Container(
                                padding: 11.paddingAll,
                                child: appLanguage == 'ar'?Icon(Icons.arrow_forward):Icon(Icons.arrow_back),
                              ),
                            ),
                          ],
                        )
                    ),
                    state.isLoading
                        ? Center(
                            child: loader(context: context),
                          )
                        : Container()
                  ],
                ),
              ));
        });
    // return ForgetPasswordScreen();
  }
}
