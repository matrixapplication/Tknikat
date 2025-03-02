import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/base_page/base_page.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/uri_invoker.dart';
import 'package:taknikat/injectoin.dart';

import '../../app/bloc/app_bloc.dart';
import '../../app/bloc/app_event.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/texts/black_texts.dart';
import '../auth_screen/page/complete_profile_page.dart';
import '../auth_screen/page/login_screen.dart';
import '../setting_page/edit_profile_page/bloc/edit_profile_bloc.dart';
import '../setting_page/edit_profile_page/bloc/edit_profile_event.dart';
import '../setting_page/edit_profile_page/bloc/edit_profile_state.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final _bloc = sl<EditProfileBloc>();
  final EditProfileBloc _bloc = sl.get();

  @override
  void initState() {
    _bloc.add(GetProfile());
    sl.registerSingleton<BuildContext>(context);
    super.initState();
    _fetchData();
    isSelectedLanguage =  box.read('isSelectedLanguage');

    }

  Future<void> _fetchData() async {
    var timer = Stopwatch();
    timer.start();
    //   // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    InitBlocs()(() => SchedulerBinding.instance.addPostFrameCallback((_) {
          timer.stop();
          var sleepMore = 1000 - timer.elapsedMilliseconds;
          if (this.mounted) {
            if (sleepMore > 0) Timer(Duration(milliseconds: sleepMore), () {});
            // Navigator.of(context).pushReplacement(PageTransition(
            //     duration: Duration(milliseconds: 700),
            //     type: PageTransitionType.fade,
            //     child: BasePage()));
            // UriInvoker.initPlatformStateForUri(navKey);
          }

          // if (lock.isLocked) lock.release();
          // Uri_invoker.initPlatformStateForUri(navigatorKey);
        }));

  }
  bool? isSelectedLanguage;
  bool? isShowLanguage=false;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    sizeAware = MediaQuery.sizeOf(context);
    Locale myLocale = Localizations.localeOf(context);
    String languageCode = myLocale.languageCode;
    bool isAr =(languageCode.toString()=='ar');

    return BlocConsumer<EditProfileBloc, EditProfileState>(
                        bloc: _bloc,
                        listener: (context,EditProfileState state) {
                          Future.delayed(Duration(seconds: 4)).then((value) {
                            if(isSelectedLanguage==true){
                              if(appUser !=null&& appUser!.isCompleted==0){
                                Navigator.of(navKey.currentContext!).push(MaterialPageRoute(
                                    builder: (context)=>
                                        CompleteProfilePage(phone: appUser?.phoneNumber??'', email:appUser?.email??'',)));
                              }else{

                                Navigator.of(navKey.currentContext!).pushReplacement(PageTransition(
                                    duration: Duration(milliseconds: 700),
                                    type: PageTransitionType.fade,
                                    child: BasePage()));
                                // UriInvoker.initPlatformStateForUri(navKey);

                              }
                            }else{
                              setState(() {
                                isShowLanguage=true;
                              });
                            }

                          });

                        },
                        builder: (context, state) {
                          return Scaffold(
                              backgroundColor: Colors.white,
                              body: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.all(25),
                                      child: Image.asset(
                                        'assets/images/taknikat.png',
                                        width: MediaQuery.sizeOf(context).width / 2,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 100.h,
                                    left: 20.w,
                                    right: 20.w,
                                    child: Center(
                                      child: loader(),
                                    )
                                  ),
                                  if(isShowLanguage==true)
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      right: 10,
                                      child:   StatefulBuilder(
                                        builder: (context, setState) {
                                          return Container(
                                            // color: Colors.white,
                                            margin: 16.paddingHorizontal+16.paddingVert,
                                            padding: 16.paddingVert,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black.withOpacity(0.1),
                                                      blurRadius: 7,
                                                      offset: Offset(3,5)
                                                  )
                                                ]
                                            ),
                                            child:
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                10.height,
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: 16.paddingHorizontal,
                                                      alignment: Alignment.centerRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          color: Colors.black,
                                                          size: 25.r,
                                                        ),
                                                      ),
                                                    ),
                                                    70.width,
                                                    Container(
                                                      height: 4.h,
                                                      width: 72.w,
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius: BorderRadius.circular(4)
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                20.height,
                                                BlackRegularText(
                                                  label: getLangLocalization('selectLanguage'),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                Column(
                                                  children: [
                                                    RadioListTile(
                                                      title: BlackRegularText(
                                                        label:getLangLocalization('ar'),
                                                        fontSize: 16.sp,
                                                      ),
                                                      value: true,
                                                      groupValue: isAr,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isAr = value!;
                                                        });
                                                      },
                                                    ),
                                                    RadioListTile(
                                                      title: BlackRegularText(
                                                        label: getLangLocalization('en'),
                                                        fontSize: 16.sp,
                                                      ),
                                                      value: false,
                                                      groupValue: isAr,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isAr = value!;
                                                        });
                                                      },
                                                    ),
                                                    12.height,
                                                    Container(
                                                      margin: 16.paddingHorizontal,
                                                      child: CustomButton(

                                                        onTap: () async {
                                                          final _blocApp = sl<AppBloc>();

                                                          box.write('isSelectedLanguage',true);
                                                          if (isAr == true) {
                                                            _blocApp.add(SetNewLanguage('ar'));
                                                            appLanguage='ar';
                                                            setState((){});

                                                            Navigator.of(navKey.currentContext!).pushReplacement(PageTransition(
                                                                duration: Duration(milliseconds: 700),
                                                                type: PageTransitionType.fade,
                                                                child: LoginScreen()));
                                                          } else {
                                                            _blocApp.add(SetNewLanguage('en'));
                                                            appLanguage='en';
                                                            setState((){});
                                                            Navigator.of(navKey.currentContext!).pushReplacement(PageTransition(
                                                                duration: Duration(milliseconds: 700),
                                                                type: PageTransitionType.fade,
                                                                child: LoginScreen()));
                                                          }
                                                          //

                                                        },
                                                        raduis: 12,
                                                        title: getLangLocalization('confirm'),
                                                        width: double.infinity,
                                                        height: 40.h,
                                                      ),
                                                    ),
                                                    8.height,
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),)
                                ],
                              ));
                        },
                      );
  }
}
