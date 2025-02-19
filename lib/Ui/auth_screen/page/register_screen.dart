import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/page/verification_code_page.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';
import 'package:taknikat/core/widgets/tap_effect.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/core/widgets/texts/primary_texts.dart';

import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_toast.dart';
import '../../../core/constent.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/style/custom_loader.dart';
import '../../../core/utils/globle.dart';
import '../../../core/widgets/inputs/custom_text_field_phone_code.dart';
import '../../../injectoin.dart';
import '../../AllCategories_page/bloc/all_categories_event.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'otp/otp_screen.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  final _formKey = GlobalKey<FormState>();
   final _bloc = sl<AuthBloc>();
   bool checkBoxValue = false;
   String? dialCodeText='966';
   TextEditingController _phoneController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('asdfasdf');
    return Container(
      child:
      BlocConsumer<AuthBloc, AuthState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state.successSignup) {
              Navigator.of(context).push(PageTransition(
                  duration: Duration(milliseconds: 700),
                  type: PageTransitionType.fade,
                  child: VerificationCodePage( 'signup',state.user.phoneNumber??number.phoneNumber.toString(),state.user.email??_emailController.text)));
              _passwordController.clear();
              _lastNameController.clear();
              _firstNameController.clear();
              _emailController.clear();
              _passwordConfirmController.clear();

            }
          },
          builder: (BuildContext context, AuthState state) {
            showToast(state.error);
           // if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());
            return
              SingleChildScrollView(
                  child:
                  Form(
                    key: _formKey,
                    child:Column(
                      children: [
                         20.height,
                        Padding(padding: EdgeInsets.symmetric(horizontal: 0),
                          child:  Column(
                            children: [
                              CustomTextField(
                                contentHorizontalPadding: 16,
                                borderRadius:12,
                                fillColor: Color(0xffF7F7F8),
                                borderColor: Colors.grey.shade200,
                                hintText:AppLocalizations.of(context).translate("First Name"), controller: _firstNameController,),
                              SizedBox(
                                height: 25,
                              ),
                              CustomTextField(

                                contentHorizontalPadding: 16,
                                borderRadius:12,
                                fillColor: Color(0xffF7F7F8),
                                borderColor: Colors.grey.shade200,
                                hintText:AppLocalizations.of(context).translate("Last Name"), controller: _lastNameController,),
                              SizedBox(
                                height: 25,
                              ),
                              CustomTextField(
                                textInputType: TextInputType.emailAddress,
                                contentHorizontalPadding: 16,
                                borderRadius:12,
                                fillColor: Color(0xffF7F7F8),
                                borderColor: Colors.grey.shade200,
                                hintText:AppLocalizations.of(context).translate("Email") , controller: _emailController,),
                              SizedBox(
                                height: 25,
                              ),
                              StatefulBuilder(builder: (context,setState){
                                return  CustomTextFieldPhoneCode(
                                  height: 46.h,
                                  hint:AppLocalizations.of(context).translate("Phone Number"),
                                  controller: _phoneController,
                                  defaultValue: _phoneController.text,
                                  onCountryChanged: (county){

                                    setState((){
                                      dialCodeText=county.dialCode;
                                    });

                                  },

                                  textInputAction: TextInputAction.next,
                                );
                              }),

                              SizedBox(
                                height: 25,
                              ),
                              CustomTextField(
                                isPassword:  true,
                                contentHorizontalPadding: 16,
                                borderRadius:12,
                                fillColor: Color(0xffF7F7F8),
                                borderColor: Colors.grey.shade200,
                                hintText:AppLocalizations.of(context).translate("Password")
                                , controller: _passwordController,),
                              SizedBox(
                                height: 25,
                              ),
                              CustomTextField(
                                isPassword:  true,
                                contentHorizontalPadding: 16,
                                borderRadius:12,
                                fillColor: Color(0xffF7F7F8),
                                borderColor: Colors.grey.shade200,
                                validationFunc:(value){
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context).translate("this_field_required");
                                  }
                                  // if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                  //   return 'This field cannot contain numbers or special characters';
                                  // }
                                  if(_passwordController.text != _passwordConfirmController.text ){
                                    return 'The passwords do not match';
                                  }
                                  return null;
                                },
                                hintText:AppLocalizations.of(context)
                                    .translate("Confirm Password"), controller: _passwordConfirmController,),
                              SizedBox(
                                height: 10,
                              ),
                              Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: StatefulBuilder(
                                    builder: (context, setState) =>
                                        CheckboxListTile(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide.none),
                                          title: Align(
                                              alignment: Alignment.centerRight,
                                              child:
                                              BlackRegularText(label:  AppLocalizations.of(context)
                                                  .translate("Agree to the terms and conditions"),fontSize: 16,)

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
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTapEffect(
                                      onTap: () {
                                        launchURL(
                                            'https://sites.google.com/view/taknikatprivacypolicy/main_page');
                                      },
                                      child: PrimaryRegularText(label: 'سياسة الخصوصية',fontSize: 10,)),
                                  20.width,
                                  CustomTapEffect(
                                      onTap: () {
                                        launchURL(
                                            'https://sites.google.com/view/taknikatusoeofterms/main_page');
                                      },
                                      child:PrimaryRegularText(label: 'الشروط والأحكام',fontSize: 10,) ),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              state.isLoading
                                  ? Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 0.0,
                                      top: sizeAware.height * 0.04),
                                  child: loader())
                                  :

                                  CustomButton(
                                      title: AppLocalizations.of(context).translate("sign up"),
                                      onTap: (){
                                            if (_formKey.currentState!.validate()) {
                                              if(checkBoxValue==true){
                                                _bloc.add(SignUp((b) => b
                                                  ..email = _emailController.text
                                                  ..phoneNumber ='+${dialCodeText}${_phoneController.text}'
                                                  ..password = _passwordController.text
                                                  ..first_name = _firstNameController.text
                                                  ..last_name = _lastNameController.text
                                                ));
                                              }else{
                                                showToast(AppLocalizations.of(context).translate("Plz agree terms and conditions"));
                                              }
                                            }


                                      }),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.of(context).push(PageTransition(
                              //         duration: Duration(milliseconds: 700),
                              //         type: PageTransitionType.fade,
                              //
                              //         child: OTPScreen(phone: state.user.phoneNumber??number.phoneNumber.toString(), type: 'signup',email: state.user.email??_emailController.text,)));
                              //     // print(phoneNumber);
                              //     // if (_formKey.currentState!.validate()) {
                              //     //   if(phoneNumber.isNotEmpty){
                              //     //     if(checkBoxValue==true){
                              //     //       _bloc.add(SignUp((b) => b
                              //     //         ..email = _emailController.text
                              //     //         ..phoneNumber = phoneNumber.isNotEmpty?phoneNumber:number.phoneNumber.toString()
                              //     //         ..password =
                              //     //             _passwordController
                              //     //                 .text
                              //     //         ..first_name =
                              //     //             _firstNameController.text
                              //     //         ..last_name =
                              //     //             _lastNameController.text
                              //     //       ));
                              //     //     }else{
                              //     //       showToast(AppLocalizations.of(context).translate("Plz agree terms and conditions"));
                              //     //     }
                              //     //   }else{
                              //     //
                              //     //   }
                              //     //
                              //     // }
                              //   },
                              //   child: Container(
                              //       width: double.infinity,
                              //       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8)+EdgeInsets.only(top: 5),
                              //       decoration: BoxDecoration(
                              //         color: primaryColor,
                              //         borderRadius: BorderRadius.circular(16),
                              //       ),
                              //       child: Center(
                              //         child: Text( AppLocalizations.of(context).translate("sign up"),style: TextStyle(
                              //           fontSize: 16,
                              //           color: Colors.white,
                              //           fontWeight: FontWeight.w600,
                              //         ),
                              //         ),)
                              //   ),
                              // ),
                              16.height

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
