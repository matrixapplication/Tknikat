import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/Ui/setting_page/my_services/text_widget.dart';
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';

import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_toast.dart';
import '../../../core/constent.dart';
import '../../../core/custom_text_field.dart';
import '../../../injectoin.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'forget_password_page.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
    AuthBloc _bloc=sl<AuthBloc>();
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xffE8E8E8),
      appBar: AppBar(
        centerTitle: true,
        title:      Text(
          AppLocalizations.of(context)
              .translate("Forgot Password"),
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
       BlocConsumer<AuthBloc, AuthState>(
          bloc: _bloc,
          listener: (_, state) {
            if (state.successForget) {
              Future.delayed(
                  Duration.zero,
                      () => Navigator.of(context).pushReplacement(PageTransition(
                      duration: Duration(milliseconds: 700),
                      type: PageTransitionType.fade,
                      child: ForgetPasswordPage(
                        controller.text,
                      ))));
            }
          },
          builder: (BuildContext context, AuthState state) {
            showToast(state.error);

            return
              SingleChildScrollView(
                child:
                 Form(
                   key: formKey,
                   child: Column(
                     children: [
                       // Container(
                       //   width: double.infinity,
                       //   decoration: BoxDecoration(
                       //     color: primaryColor,
                       //     borderRadius: BorderRadius.only(
                       //       bottomLeft: Radius.circular(20),
                       //       bottomRight: Radius.circular(20),
                       //     ),
                       //   ),
                       //   child: Column(
                       //     children: [
                       //       Text(
                       //         "Forgot Password",
                       //         style: TextStyle(
                       //           fontSize: 40,
                       //           fontWeight: FontWeight.bold,
                       //           color: Colors.white,
                       //         ),
                       //       ),
                       //       SizedBox(
                       //         height: 30,
                       //       ),
                       //     ],
                       //   ),
                       // ),
                       SizedBox(
                         height: 60,
                       ),
                       Icon(
                         Icons.lock_open,
                         size: 100,
                         color: Colors.red,
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       Text(
                         AppLocalizations.of(context)
                             .translate("Trouble Logging in"),
                         style: TextStyle(
                             fontSize: 20,
                             color: Colors.black,
                             fontWeight: FontWeight.bold),
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 40),
                         child: Text(
                           AppLocalizations.of(context)
                               .translate("Trouble Logging Mess"),
                           style: TextStyle(
                             fontSize: 16,
                             color: Colors.grey,
                             fontWeight: FontWeight.w500,
                             height: 1.5,
                           ),
                           textAlign: TextAlign.center,
                         ),
                       ),
                       SizedBox(
                         height: 30,
                       ),
                       Padding(padding: EdgeInsets.symmetric(horizontal: 40),

                         child:  Column(
                           children: [
                             CustomTextField(
                               borderColor: Colors.transparent,
                               contentHorizontalPadding: 16,
                               borderRadius:30,
                               hintText: AppLocalizations.of(context)
                                   .translate("Email"), controller: controller,),
                             SizedBox(
                               height: 20,
                             ),
                             InkWell(
                               onTap: (){
                                 _bloc.add(TryForgetPassword(
                                         (b) => b
                                       ..email =
                                           controller
                                               .text));
                               },
                               child: Container(
                                   width: double.infinity,
                                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8)+EdgeInsets.only(top: 5),
                                   decoration: BoxDecoration(
                                     color: primaryColor,
                                     borderRadius: BorderRadius.circular(30),
                                   ),
                                   child: Center(
                                     child: Text( AppLocalizations.of(context)
                                         .translate("Reset Password2"),style: TextStyle(
                                       fontSize: 16,
                                       color: Colors.white,
                                       fontWeight: FontWeight.w600,
                                     ),
                                     ),)
                               ),
                             )

                           ],
                         ),
                       )
                     ],
                   ),
                 )
              );
          })



    );
  }
}
