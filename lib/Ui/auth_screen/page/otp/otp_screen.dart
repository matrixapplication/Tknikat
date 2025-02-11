import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taknikat/Ui/auth_screen/bloc/auth_state.dart';
import 'package:taknikat/Ui/auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/style/color.dart';
import 'package:taknikat/core/style/styles.dart';

import '../../../../core/app_localizations.dart';
import '../../../../core/assets_image/app_images.dart';
import '../../../../core/base_widget/base_text.dart';
import '../../../../core/constent.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/texts/black_texts.dart';
import '../../../../core/widgets/texts/primary_texts.dart';
import '../../../../injectoin.dart';
import '../../bloc/auth_bloc.dart';
import '../complete_profile_page.dart';

///شييشيس
class OTPScreen extends StatefulWidget {
  final String phone;
  final String? email;
  final String type;

  @override
  _OTPScreenState createState() => _OTPScreenState();

  OTPScreen({required this.phone, this.email, required this.type});


}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _codeController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void _onResendCode() async {
    // await BlocProvider.of<OtpViewModelCubit>(context,listen: false).reSendCode(phone: widget._phone);
  }

  void _onSubmit(context) async {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CompleteProfilePage(phone: '', email: '',)));
    // NavigationService.push(Routes.driverRegistrationScreen,);

    // String otp = _codeController.text;
    // if (otp.length==4) {
    //   var response = await BlocProvider.of<OtpViewModelCubit>(context,listen: false).otpCode(phone: widget._phone,otp: otp,countryEntity: widget._countryEntity,type: widget._checkOTPType );
    //
    //
    //   if (response.isSuccess) {
    //     if (widget._checkOTPType == CheckOTPType.register) {
    //       Navigator.pushNamedAndRemoveUntil(context, Routes.congratulationsScreen, (route) => false);
    //     } else {
    //       // NavigationService.push(Routes.resetPasswordScreen, arguments: {'phone': widget._phone});
    //     }
    //   } else {
    //     _codeController.clear();
    //   }
    // }
  }
  late AuthBloc _bloc;
  @override
  void initState() {
    _bloc = sl<AuthBloc>();
    setState(() {
      resendCode = true;
    });
    super.initState();
  }
  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }
  bool resendCode = false;

  @override
  Widget build(BuildContext context) {
  final  _bloc = sl<AuthBloc>();

    return Scaffold(
      // appBar: CustomAppBar(title: el.tr(LocaleKeys.phoneVerification)),
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
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

         BlocConsumer<AuthBloc,AuthState>(
             bloc: _bloc,
             builder: (context,state){
           return SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 30.height,
                  AuthHeaderWidget(title: AppLocalizations.of(context).translate("Verification")),
                 Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       24.height,
                        BlackBoldText(label: AppLocalizations.of(context).translate("Hi!"),fontSize: 20,),
                        BlackRegularText(label: AppLocalizations.of(context).translate("VerificationMess"),fontSize: 16,fontWeight: FontWeight.w300,),
                       PrimaryRegularText(label: widget.phone??'',fontSize: 16,),
                       60.height,
                       _buildForm(),
                       Center(child:   _buildResendCode(),),
                       32.height,
                       Center(child: CustomButton(loading: false,title:  AppLocalizations.of(context).translate("Verify")  ,onTap: ()=> _onSubmit(context))),
                       16.height
                     ],
                   ),)
               ],
             ),
           );
         }, listener: (context,state){})

       ],
     )
    );
  }

  _buildResendCode(){
    // bool isLoading = context.watch<OtpViewModelCubit>().isResendLoading;
    // bool isTimerDone = context.watch<OtpViewModelCubit>().isTimerDone;

    return Column(
     children: [
       16.height,
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           BlackRegularText(label: 'Don’t receive OTP?',fontSize: 16,fontWeight: FontWeight.w300,),
           8.width,
           resendCode ?
           StreamBuilder(
               stream: _clock(),
               builder: (context,
                   AsyncSnapshot<
                       String>
                   snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return const CircularProgressIndicator();
                 }
                 return snapshot.data != null ? baseText(
                     AppLocalizations.of(context).translate("Resend Again") + "  " +
                         snapshot.data!,
                     size: 14.0,
                     color:
                     primaryColor,
                     textAlign:
                     TextAlign
                         .center)
                     : Container();
               }) : InkWell(
             onTap: () {
               setState(() {
                 resendCode = true;
                 // _bloc.add(ResendCode(
                 //         (b) => b
                 //       ..email = widget
                 //           .phone));
               });
             },
             child: baseText(
                 AppLocalizations.of(
                     context)
                     .translate(
                     "Resend The Code"),
                 size: 14.0,
                 color:
                 primaryColor,
                 textAlign:
                 TextAlign
                     .center),
           ),

         ],
       ),



     ],
   );
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

  _buildForm(){
    return  Center(child: PinCodeTextField(
      appContext: context,
      length: 4,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      obscureText: false,
      showCursor: false,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        inactiveColor: Colors.transparent,
        disabledColor: Colors.transparent,
        activeColor: Colors.transparent,
        selectedColor: primaryColor,
        errorBorderColor:Colors.transparent,
        inactiveFillColor: Colors.grey.withOpacity(0.1),
        selectedFillColor: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 48.r,
        fieldWidth: 48.r,
        activeFillColor: Colors.grey.withOpacity(0.1),
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      textStyle:
      TextStyles.font16Bold.copyWith(fontSize: 24,color: Colors.black),
      enableActiveFill: true,
      boxShadows:  [ BoxShadow(color: Colors.black.withOpacity(0.5), spreadRadius: 10, blurRadius: 10,offset: Offset(5,8))],
      controller: _codeController,
      beforeTextPaste: (text) {return true;}, onChanged: (String value) {},
    ),);
  }
}
