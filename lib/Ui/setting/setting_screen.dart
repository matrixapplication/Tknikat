import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting/profile_information.dart';
import 'package:taknikat/core/app_localizations.dart';

import '../../app/bloc/app_bloc.dart';
import '../../app/bloc/app_event.dart';
import '../../core/base_widget/dialogcustom.dart';
import '../../core/constent.dart';
import '../../injectoin.dart';
import '../AllNotification_page/allNotification_page.dart';
import '../about_us/about_us_page.dart';
import '../auth_screen/page/login_screen.dart';
import '../auth_screen/page/register_screen.dart';
import '../auth_screen/page/signin_page.dart';
import '../contactus_page/contactus_page.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String languageCode = myLocale.languageCode;
    bool isArabic = languageCode == "ar";
    return Scaffold(
       body:
       SingleChildScrollView(
         padding: EdgeInsets.symmetric(horizontal: 20),
         child:Column(
           children: [
             SizedBox(height: 30,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SettingWidget(
                   // textColor:isArabic ==false?primaryColor:Colors.white,
                   // borderColor: isArabic ==false?primaryColor:Colors.transparent,
                   // backgroundColor: isArabic ==false?Colors.transparent:primaryColor,
                   width: MediaQuery.sizeOf(context).width/2.3,
                   title: "العربية",
                   onTap: (){
                     final _bloc = sl<AppBloc>();
                     _bloc.add(SetNewLanguage('ar'));
                   },
                   context: context,
                 ),
                 SettingWidget(
                   // textColor:isArabic ==false?Colors.white:primaryColor,
                   // borderColor: isArabic ==false?Colors.transparent:primaryColor,
                   // backgroundColor: isArabic ==false?primaryColor:Colors.transparent,
                   width: MediaQuery.sizeOf(context).width/2.3,
                   title: "English",
                   onTap: (){
                     final _bloc = sl<AppBloc>();
                     _bloc.add(SetNewLanguage('en'));
                   },
                   context: context,
                 ),
               ],
             ),
             SizedBox(height: 10,),
             SettingWidget(
               title:
               AppLocalizations.of(context)
                   .translate("Personal data"),
               onTap: (){
                 if (appAuthState)
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInformationPage()));

                 else
                   showLogin(context);
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
               },
               context: context,
             ),
             SizedBox(height: 10,),
             SettingWidget(
               title:  AppLocalizations.of(context)
                   .translate("Notifications"),
               onTap: (){
                 if (appAuthState)
                   Navigator.of(context).push(PageTransition(
                       duration: Duration(milliseconds: 500),
                       type: PageTransitionType.fade,
                       child: AllNotificationPage()));
                 else
                   showLogin(context);
               },
               context: context,
             ),
             SizedBox(height: 10,),
             SettingWidget(
               title:
               AppLocalizations.of(context)
                   .translate("About Us"),
               onTap: (){
                 Navigator.of(context).push(
                     PageTransition(
                         duration: Duration(
                             milliseconds: 700),
                         type: PageTransitionType.fade,
                         child: AboutUsPage()));

               },
               context: context,
             ),
             SizedBox(height: 10,),
             SettingWidget(
               title:
               AppLocalizations.of(context)
                   .translate("terms_conditions"),
               onTap: (){
                 Navigator.of(context).push(
                     PageTransition(
                         duration: Duration(
                             milliseconds: 700),
                         type: PageTransitionType.fade,
                         child: AboutUsPage(title: AppLocalizations.of(context).translate("terms_conditions"),)));
               },
               context: context,
             ),
             SizedBox(height: 10,),
             SettingWidget(
               title:
               AppLocalizations.of(context)
                   .translate("Contact Us"),
               onTap: (){
                 Navigator.of(
                     context)
                     .push(PageTransition(
                     duration: Duration(
                         milliseconds:
                         700),
                     type:
                     PageTransitionType
                         .fade,
                     child:
                     ContactPage()));
               },
               context: context,
             ),
             SizedBox(height: 30,),
             if (appAuthState)
               Center(
                   child: InkWell(
                     onTap: (){
                       AwesomeDialog(
                         context: context,
                         customHeader: Container(
                           child: Icon(
                             Icons.logout,
                             size: 60,
                             color: primaryColor,
                           ),
                         ),
                         btnCancelText:
                         AppLocalizations.of(
                             context)
                             .translate(
                             "Cancel"),
                         btnOkText:
                         AppLocalizations.of(
                             context)
                             .translate("Ok"),
                         btnOkColor: primaryColor,
                         dialogType:
                         DialogType.warning,
                         animType:
                         AnimType.bottomSlide,
                         title: AppLocalizations.of(
                             context)
                             .translate('sign out'),
                         desc: AppLocalizations.of(
                             context)
                             .translate(
                             'are you sure you want to logout'),
                         btnCancelOnPress: () {},
                         btnOkOnPress: () {
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
                               child:
                               SignInPage()));
                         },
                       )..show();
                     },
                     child:  Icon(Icons.logout_sharp,size: 80,color: Colors.red.shade700,),
                   )
               )
             else
               Center(
               child: InkWell(
                 onTap: (){
                   Navigator.of(context).pushReplacement(PageTransition(
                       duration: Duration(
                           milliseconds:
                           500),
                       type:
                       PageTransitionType
                           .fade,
                       child:
                       SignInPage()));
                 },
                 child:  Icon(Icons.login,size: 80,color: primaryColor,),
               )
             )
           ],
         ),
       )
    );
  }
}
Widget SettingWidget({double? width,required String title,void Function()? onTap,required BuildContext context,Color? backgroundColor,Color? textColor,Color? borderColor}){
  return Container(
    child: InkWell(
      onTap: onTap,
      child: Container(
        width:  width??MediaQuery.sizeOf(context).width,
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8)+EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor??Colors.transparent),
          color: backgroundColor??primaryColor,
          borderRadius: BorderRadius.circular( 12),
        ),
        child:
       Center(
         child: Text(
           title,
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w600,
             color:textColor?? Colors.white,
           ),
         ),
       )
      ),
    ),
  );
}