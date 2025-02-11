import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_bloc.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_event.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_state.dart';
import 'package:taknikat/Ui/base_page/base_page.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/back_arrow_button.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

import 'complete_profile_page.dart';
import 'otp/otp_screen.dart';

class VerificationCodePage extends StatefulWidget {
  final String phone;
  final String? email;
  final String type;
  VerificationCodePage( this.type, this.phone, this.email);
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage>
    with SingleTickerProviderStateMixin {
  String? _code;
  bool resendCode = false;

  late AuthBloc _bloc;
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
    return OTPScreen(phone: widget.phone, type: widget.type,email: widget.email,);
    // return BlocConsumer<AuthBloc, AuthState>(
    //     bloc: _bloc,
    //     listener: (_, state) {
    //       if (state.successVerfy) {
    //         if (widget.type == 'change-phone')
    //           AwesomeDialog(
    //               headerAnimationLoop: false,
    //               context: context,
    //               btnOkText: AppLocalizations.of(context).translate("Ok"),
    //               btnOkColor: primaryColor,
    //               dialogType: DialogType.success,
    //               title: AppLocalizations.of(context).translate("profile edit"),
    //               desc: AppLocalizations.of(context)
    //                   .translate("your profile has been updated successfully"),
    //               btnOkOnPress: () {},
    //               onDismissCallback: (type) {
    //                 Navigator.of(context).pushReplacement(PageTransition(
    //                     duration: Duration(milliseconds: 500),
    //                     type: PageTransitionType.fade,
    //                     child: BasePage()));
    //               })
    //             ..show();
    //          else
    //            // if (appUser?.isCompleted!=null && appUser?.isCompleted == 0)
    //               Navigator.of(context).pushReplacement(PageTransition(
    //                   duration: Duration(milliseconds: 500),
    //                   type: PageTransitionType.fade,
    //                   child: CompleteProfilePage(phone: widget.phone, email: widget.email??'',)));
    //
    //
    //           // Navigator.of(context).pushReplacement(PageTransition(
    //           //     duration: Duration(milliseconds: 500),
    //           //     type: PageTransitionType.fade,
    //           //     child: BasePage()));
    //       }
    //     },
    //     builder: (BuildContext context, AuthState state) {
    //       showToast(state.error);
    //       if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());
    //       return Scaffold(
    //           backgroundColor: Colors.white,
    //           body: Stack(
    //             children: [
    //               GestureDetector(
    //                 onTap: () => FocusScope.of(context).unfocus(),
    //                 child: SingleChildScrollView(
    //                     child: Center(
    //                         child: Column(
    //                   children: [
    //                     Container(
    //                       width: sizeAware.width * 0.7,
    //                       height: sizeAware.height * 0.4,
    //                       margin: EdgeInsets.symmetric(vertical: 10),
    //                       child: Image.asset(
    //                         'assets/images/taknikat.png',
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                     Column(
    //                       children: [
    //                         Padding(
    //                           padding: EdgeInsets.only(left: 20, right: 20),
    //                           child: Container(
    //                               color: Colors.white70,
    //                               child: Padding(
    //                                   padding: EdgeInsets.only(top: 70),
    //                                   child: Card(
    //                                       elevation: 10,
    //                                       shape: RoundedRectangleBorder(
    //                                         //  side: BorderSide(color:HexColor(color), width: 1),
    //                                         borderRadius: BorderRadius.only(
    //                                           topRight: Radius.circular(30),
    //                                           topLeft: Radius.circular(30),
    //                                           bottomRight: Radius.circular(30),
    //                                           bottomLeft: Radius.circular(30),
    //                                         ),
    //                                       ),
    //                                       child: Container(
    //                                           width: double.infinity,
    //                                           child: Column(
    //                                             children: [
    //                                               Padding(
    //                                                   padding: EdgeInsets.only(
    //                                                       top: 60, bottom: 0)),
    //                                               baseText(
    //                                                   AppLocalizations.of(context).translate("Phone Verification"),
    //                                                   textAlign: TextAlign.center,
    //                                                   color: Colors.black,
    //                                                   fontWeight: FontWeight.bold,
    //                                                   size: 22.0),
    //                                               baseText(
    //                                                   AppLocalizations.of(context).translate("Please enter the code that is sent on"),
    //                                                   textAlign:
    //                                                       TextAlign.center,
    //                                                   color: Colors.black,
    //                                                   size: 16.0),
    //                                               baseText(widget.email??'',
    //                                                   textAlign:
    //                                                       TextAlign.center,
    //                                                   color: primaryColor,
    //                                                   size: 22.0),
    //                                               // VerificationCode(
    //                                               //   textStyle: TextStyle(
    //                                               //     fontFamily: "Tajawal",
    //                                               //     fontSize: 20.0,
    //                                               //     color: HexColor(color),
    //                                               //   ),
    //                                               //   keyboardType:
    //                                               //       TextInputType.number,
    //                                               //   underlineColor:
    //                                               //       HexColor(color),
    //                                               //   length: 6,
    //                                               //   autofocus: true,
    //                                               //   clearAll: Icon(Icons
    //                                               //       .clear_all_rounded),
    //                                               //   onCompleted:
    //                                               //       (String value) {
    //                                               //     setState(() {
    //                                               //       _code = value;
    //                                               //       if (widget.type ==
    //                                               //               'verfy-email' ||
    //                                               //           widget.type ==
    //                                               //               'change-phone')
    //                                               //         _bloc.add(VerfyCode(
    //                                               //             (b) => b
    //                                               //               ..phone_number =
    //                                               //                   widget
    //                                               //                       .mobile
    //                                               //               ..activation_code =
    //                                               //                   _code));
    //                                               //       else if (widget.type ==
    //                                               //           'signup')
    //                                               //         _bloc.add(ActivateAccount(
    //                                               //             (b) => b
    //                                               //               ..phone_number =
    //                                               //                   widget
    //                                               //                       .mobile
    //                                               //               ..activation_code =
    //                                               //                   _code));
    //                                               //     });
    //                                               //   },
    //                                               //   onEditing: (bool value) {
    //                                               //     setState(() {
    //                                               //       _onEditing = value;
    //                                               //     });
    //                                               //     if (!_onEditing)
    //                                               //       FocusScope.of(context)
    //                                               //           .unfocus();
    //                                               //   },
    //                                               // ),
    //                                               Padding(
    //                                                   padding: const EdgeInsets
    //                                                       .symmetric(
    //                                                       vertical: 8.0,
    //                                                       horizontal: 30),
    //                                                   child: Directionality(
    //                                                     textDirection:
    //                                                         TextDirection.ltr,
    //                                                     child: PinCodeTextField(
    //                                                       appContext: context,
    //                                                       pastedTextStyle:
    //                                                           TextStyle(
    //                                                         fontFamily:
    //                                                             "Tajawal",
    //                                                         color: primaryColor,
    //                                                         fontWeight:
    //                                                             FontWeight.bold,
    //                                                       ),
    //                                                       length: 6,
    //                                                       animationType:
    //                                                           AnimationType
    //                                                               .fade,
    //                                                       pinTheme: PinTheme(
    //                                                           shape: PinCodeFieldShape
    //                                                               .box,
    //                                                           borderRadius:
    //                                                               BorderRadius
    //                                                                   .circular(
    //                                                                       5),
    //                                                           fieldHeight: 50,
    //                                                           fieldWidth: 40,
    //                                                           activeFillColor:
    //                                                               Colors.grey[
    //                                                                   500],
    //                                                           activeColor:
    //                                                               Colors
    //                                                                       .grey[
    //                                                                   500],
    //                                                           selectedFillColor:
    //                                                               primaryColor,
    //                                                           selectedColor:
    //                                                               primaryColor,
    //                                                           inactiveColor:
    //                                                               othercolor,
    //                                                           inactiveFillColor:
    //                                                               othercolor),
    //                                                       autoFocus: true,
    //                                                       textStyle: TextStyle(
    //                                                           fontFamily:
    //                                                               "Tajawal",
    //                                                           color:
    //                                                               Colors.white),
    //                                                       cursorColor:
    //                                                           Colors.white,
    //                                                       animationDuration:
    //                                                           Duration(
    //                                                               milliseconds:
    //                                                                   300),
    //                                                       enableActiveFill:
    //                                                           true,
    //                                                       keyboardType:
    //                                                           TextInputType
    //                                                               .number,
    //                                                       onCompleted: (value) {
    //                                                         _code = value;
    //                                                         if (widget.type ==
    //                                                                 'verfy-email' ||
    //                                                             widget.type ==
    //                                                                 'change-phone')
    //                                                           _bloc.add(VerfyCode(
    //                                                               (b) => b
    //                                                                 ..email = widget.email
    //                                                                 ..activation_code = _code));
    //                                                         else if (widget
    //                                                                 .type ==
    //                                                             'signup')
    //                                                           _bloc.add(VerfyCode(
    //                                                                   (b) => b
    //                                                                 ..email = widget.email
    //                                                                 ..activation_code = _code));
    //                                                           // _bloc.add(ActivateAccount(
    //                                                           //     (b) => b
    //                                                           //       ..email = widget.email
    //                                                           //       ..activation_code = _code));
    //                                                       },
    //                                                       onChanged: (value) {
    //                                                         print(value);
    //                                                         setState(() {
    //                                                           _code = value;
    //                                                         });
    //                                                       },
    //                                                       beforeTextPaste:
    //                                                           (text) {
    //                                                         return true;
    //                                                       },
    //                                                     ),
    //                                                   )),
    //                                               SizedBox(
    //                                                 height: 20,
    //                                               ),
    //                                               resendCode
    //                                                   ? StreamBuilder(
    //                                                       stream: _clock(),
    //                                                       builder: (context,
    //                                                           AsyncSnapshot<
    //                                                                   String>
    //                                                               snapshot) {
    //                                                         if (snapshot
    //                                                                 .connectionState ==
    //                                                             ConnectionState
    //                                                                 .waiting) {
    //                                                           return const CircularProgressIndicator();
    //                                                         }
    //                                                         return snapshot.data !=
    //                                                                 null
    //                                                             ? baseText(
    //                                                                 AppLocalizations.of(context).translate(
    //                                                                         "Resend Again") +
    //                                                                     "  " +
    //                                                                     snapshot
    //                                                                         .data!,
    //                                                                 size: 14.0,
    //                                                                 color:
    //                                                                     primaryColor,
    //                                                                 textAlign:
    //                                                                     TextAlign
    //                                                                         .center)
    //                                                             : Container();
    //                                                       })
    //                                                   : InkWell(
    //                                                       onTap: () {
    //                                                         setState(() {
    //                                                           resendCode = true;
    //                                                           _bloc.add(ResendCode(
    //                                                               (b) => b
    //                                                                 ..email = widget
    //                                                                     .phone));
    //                                                         });
    //                                                       },
    //                                                       child: baseText(
    //                                                           AppLocalizations.of(
    //                                                                   context)
    //                                                               .translate(
    //                                                                   "Resend The Code"),
    //                                                           size: 14.0,
    //                                                           color:
    //                                                               primaryColor,
    //                                                           textAlign:
    //                                                               TextAlign
    //                                                                   .center),
    //                                                     ),
    //                                               SizedBox(
    //                                                 height: sizeAware.height *
    //                                                     0.035714285714286,
    //                                               )
    //                                             ],
    //                                           ))))),
    //                         ),
    //                       ],
    //                     ),
    //                     SizedBox(
    //                       height: 40,
    //                     )
    //                   ],
    //                 ))),
    //               ),
    //               appLanguage == 'en'
    //                   ? BackButtonArrowLeft()
    //                   : BackButtonArrowRight(),
    //               state.isLoading
    //                   ? Center(
    //                       child: loader(context: context),
    //                     )
    //                   : Container()
    //             ],
    //           ));
    //     });
  }

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
