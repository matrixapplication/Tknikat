
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import '../../../Ui/auth_screen/page/signin_page.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../../app/bloc/app_event.dart';
import '../../../injectoin.dart';
import '../../constent.dart';
import '../../filters/filter_class.dart';
import '../custom_button.dart';
import '../texts/black_texts.dart';
import 'base/simple_dialogs.dart';

Future showLogOutDialog(BuildContext context,) async =>
    showCustomDialog(context, _buildBody(context), onDismissCallback: ()=>context.pop() ,isCancellable: true);


_buildBody(BuildContext context){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Container(
      color: Colors.white,
      margin: 16.paddingHorizontal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child:
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.clear,color: Colors.black,size: 25.r,),
            ),
          ),
          16.height,
          BlackRegularText(label:getLangLocalization('Log Out') ,fontSize: 16.sp,fontWeight: FontWeight.w400,),
          8.height,
          BlackRegularText(label:getLangLocalization('logOutMess') ,fontSize: 13.sp,fontWeight: FontWeight.w300,textAlign: TextAlign.center,),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child:   CustomButton(

                color: Colors.white,
                textColor: primaryColor,
                onTap: (){
                  _onLogoutPress(context);
                },
                raduis: 50,
                title:getLangLocalization('yesLogOut') ,width: 150.w,height: 35.h,),),
              8.width,
              CustomButton(onTap: (){
                context.pop();
              },
                raduis: 50,
                title:getLangLocalization('Cancel'),width: 90.w,height: 35.h,),
            ],
          )
        ],
      ),
    ),
  );
}

_onLogoutPress(BuildContext context) {
  sl<AppBloc>()
      .add(LogOutUser());

  Navigator.of(context)
      .pushReplacement(PageTransition(
      duration: Duration(
          milliseconds:
          1000),
      type:
      PageTransitionType
          .fade,
      child: SignInPage()));

}