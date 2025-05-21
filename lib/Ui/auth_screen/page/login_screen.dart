import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/page/register_screen.dart';
import 'package:taknikat/Ui/auth_screen/page/resetpassword_page.dart';
import 'package:taknikat/Ui/auth_screen/page/signup_page.dart';
import 'package:taknikat/Ui/auth_screen/page/verification_code_page.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/custom_text_field.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/core/widgets/inputs/custom_text_field_password.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/core/widgets/texts/hint_texts.dart';
import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_click.dart';
import '../../../core/base_widget/base_text.dart';
import '../../../core/base_widget/base_toast.dart';
import '../../../core/constent.dart';
import '../../../core/filters/filter_class.dart';
import '../../../core/style/color.dart';
import '../../../core/style/custom_loader.dart';
import '../../../core/style/styles.dart';
import '../../../core/utils/globle.dart';
import '../../../core/widgets/inputs/country/countries.dart';
import '../../../core/widgets/inputs/custom_text_field_phone_code.dart';
import '../../../core/widgets/tabs/custom_tap.dart';
import '../../../injectoin.dart';
import '../../base_page/base_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widget/google_signIn_button.dart';
import 'package:collection/collection.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _bloc = sl<AuthBloc>();
  TextEditingController _passwordControllerLogin = TextEditingController();
  String? dialCodeText='966';
  TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if(kDebugMode){
      dialCodeText='20';
      _phoneController.text='1014140000';
      _passwordControllerLogin.text='123123';
    }
    DateTime date = DateTime(2024, 12, 12);
    bool result = isAfterTwoDays(date);
    print('asdasdasdasdRLoginScreen');

    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: primaryColor,
            body:
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child:
                  SvgPicture.asset(AppImages.back,height: double.infinity,fit: BoxFit.cover,),
                  // Image.asset(AppImages.backGround,height: double.infinity,fit: BoxFit.cover,),
                ),
                BlocConsumer<AuthBloc, AuthState>(
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
                                _phoneController.text, state.email ?? ''),
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
                          child:
                          Container(
                            // physics: const BouncingScrollPhysics(),
                              padding: 20.paddingHorizontal,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    40.height,
                                    Center(
                                      child: Image.asset(
                                        AppImages.logo,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    26.height,
                                    BlackSemiBoldText(label:getLangLocalization("welcomeBack"),fontSize: 20,),
                                    BlackRegularText(label: getLangLocalization("welcomeBackMess"),fontSize: 16,fontWeight: FontWeight.w300,),
                                    26.height,
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.03),
                                                  spreadRadius: 4,
                                                  blurRadius: 8,
                                                  offset: Offset(3, 5), // تحريك الظل
                                                ),
                                              ],
                                              border: Border.all(
                                                color: Colors.black26.withOpacity(0.01),
                                              ),
                                            ),
                                            child: TabBar(
                                              indicatorColor: primaryColor,
                                              dividerColor: Colors.transparent,
                                              unselectedLabelStyle: TextStyles.font21SimBold.copyWith(
                                                color: blackColor.withOpacity(0.7),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              labelStyle: TextStyles.font21SimBold.copyWith(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              indicator: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white.withOpacity(0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: Offset(0, 1), // تحريك الظل
                                                  ),
                                                ],
                                              ),
                                              indicatorSize: TabBarIndicatorSize.tab,
                                              tabs: [
                                                Tab(text: getLangLocalization("sign in")),
                                                Tab(text: getLangLocalization("sign up")),
                                              ],
                                            ),
                                          ),

                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    // color: Colors.white,
                                                  ),
                                                  // margin: EdgeInsets.symmetric(horizontal: 20),
                                                  child: SingleChildScrollView(
                                                      padding:
                                                      EdgeInsets.symmetric(horizontal: 0),
                                                      child:
                                                      Form(
                                                        key: _formKey,
                                                        child: Column(
                                                          children: [
                                                            32.height,
                                                            StatefulBuilder(builder: (context,setState){
                                                              return
                                                                CustomTextFieldPhoneCode(
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
                                                              height: 10,
                                                            ),
                                                            CustomTextField(
                                                              fillColor: Color(0xffF7F7F8),
                                                              borderColor: Colors.transparent,
                                                              isPassword:  true,
                                                              contentHorizontalPadding: 16,
                                                              borderRadius:8,
                                                              hasShadow: false,
                                                              hintText:AppLocalizations.of(context).translate("Password"),
                                                              controller: _passwordControllerLogin,),
                                                            SizedBox(height: 10,),
                                                            Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Padding(
                                                                      padding: EdgeInsetsDirectional.only(start: sizeAware.width * 0.04),
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


                                                                          )))
                                                                ]),
                                                            SizedBox(
                                                              height: 10,
                                                            ),


                                                            Padding(
                                                                padding: EdgeInsetsDirectional.only(
                                                                    start: 0.0,
                                                                    top: sizeAware.height * 0.04),
                                                                child:
                                                                CustomButton(
                                                                  loading:  state.isLoading,
                                                                  title: AppLocalizations.of(context).translate("Login"),
                                                                  onTap: (){
                                                                    if (_formKey.currentState!.validate() ){
                                                                      _bloc.add(TryLogin((b) =>
                                                                      b..phone = '+${dialCodeText}${_phoneController.text}'
                                                                        ..password = _passwordControllerLogin.text));
                                                                    }
                                                                  },
                                                                )
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),

                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Expanded(child: Divider(
                                                                    indent: 10,
                                                                    endIndent: 10,
                                                                  ),),
                                                                  HintRegularText(label: getLangLocalization('or continue with'),fontSize: 10,),
                                                                  Expanded(child: Divider(
                                                                    indent: 10,
                                                                    endIndent: 10,
                                                                  ),),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
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
                                                                        type:
                                                                        PageTransitionType.fade,
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
                                                                          AppLocalizations.of(context).translate("Enter as a Gust"),
                                                                          color: primaryColor,
                                                                          size: sizeAware.width * 0.04,
                                                                        ),
                                                                        SizedBox(
                                                                          width: sizeAware.width * 0.01,
                                                                        ),
                                                                        AppLocalizations.of(context).locale.toLanguageTag() == "ar"
                                                                            ? Icon(Icons.arrow_back_outlined,
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
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                                RegisterScreen(),
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                    )])));
                    }),
              ],
            )),
      );

  }

  bool isAfterTwoDays(DateTime givenDate) {
    DateTime currentDate = DateTime.now();
    DateTime targetDate = givenDate.add(Duration(days: 2));
    return currentDate.isAfter(targetDate);
  }
}
