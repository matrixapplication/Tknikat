import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/base_page/base_page.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/uri_invoker.dart';
import 'package:taknikat/injectoin.dart';

import '../auth_screen/page/complete_profile_page.dart';
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

  @override
  Widget build(BuildContext context) {
    sizeAware = MediaQuery.of(context).size;

    return BlocConsumer<EditProfileBloc, EditProfileState>(
                        bloc: _bloc,
                        listener: (context,EditProfileState state) {
                          Future.delayed(Duration(seconds: 4)).then((value) {
                            if(appUser !=null&& appUser!.isCompleted==0){
                              Navigator.of(navKey.currentContext!).push(MaterialPageRoute(
                                  builder: (context)=>
                                  CompleteProfilePage(phone: appUser?.phoneNumber??'', email:appUser?.email??'',)));
                            }else{
                              Navigator.of(navKey.currentContext!).pushReplacement(PageTransition(
                                  duration: Duration(milliseconds: 700),
                                  type: PageTransitionType.fade,
                                  child: BasePage()));
                              UriInvoker.initPlatformStateForUri(navKey);

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
                                        width: MediaQuery.of(context).size.width / 2,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.all(sizeAware.width * 0.3),
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(othercolor),
                                      ),
                                    ),
                                  )
                                ],
                              ));
                        },
                      );
  }
}
