import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:taknikat/Ui/base_page/navigation_bar_provider.dart';
import 'package:taknikat/Ui/splash_screen/splash_screen.dart';
import 'package:taknikat/app/bloc/app_bloc.dart';
import 'package:taknikat/core/app_language.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/injectoin.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:upgrader/upgrader.dart';

import '../Ui/AllNotification_page/bloc/notification_bloc.dart';
import '../Ui/AllNotification_page/bloc/notification_event.dart';
import '../Ui/auth_screen/page/complete_profile_page.dart';
import '../Ui/cart/provider.dart';
import '../Ui/setting_page/bloc/settings_bloc.dart';
import '../Ui/setting_page/bloc/settings_event.dart';
import '../core/init_notifications_service.dart';
import 'bloc/app_event.dart';
import 'bloc/app_state.dart';

final navKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final _appBloc = sl<AppBloc>();
  final _notificationsBloc = sl<NotificationBloc>();

  @override
  void initState() {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    WidgetsBinding.instance.addObserver(this);
    sl.registerSingleton<GlobalKey<NavigatorState>>(navKey);
    _appBloc.add(InitEvent());
    // sl<SettingsBloc>().add(InitSettings());
    // _notificationsBloc.add(TryGetNotification());
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('didChangeAppLifecycleState');
    // _notificationsBloc.add(TryGetNotification());
  }

  @override
  Widget build(BuildContext context) {
    // appLanguage = AppLanguageKeys.AR;
    return  BlocBuilder(
        bloc: _appBloc,
        builder: (BuildContext context, AppState state) {
          print('AuthState App : ${state.loginState} & Language App : ${state.appLanguage} & Language App : $appCurrency');
          return ChangeNotifierProvider(
            create: (context) => BottomNavigationProvider(),
            child: MaterialApp(
                navigatorKey: navKey,

                title: "Teknikate",
                builder: BotToastInit(), //1. call BotToastInit
                navigatorObservers: [BotToastNavigatorObserver()],
                // showPerformanceOverlay: true,
                // showSemanticsDebugger: true,
                debugShowCheckedModeBanner: false,
                home:
                // CompleteProfilePage(),
                Scaffold(
                  body:
                  SplashScreen(),
                  // UpgradeAlert(
                  //   child: SplashScreen(),
                  // ),
                ),
                theme: ThemeData(
                    fontFamily: 'Tajawal',
                    checkboxTheme: CheckboxThemeData(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(12),
                      ),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        // foregroundColor: Color(0xFF898E92),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Tajawal',
                          )),
                    ),
                    outlinedButtonTheme: OutlinedButtonThemeData(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(12),
                      ),
                    )),

                locale: state.appLanguage == AppLanguageKeys.AR
                    ? Locale('ar', '')
                    : Locale('en', ''),
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('en', ''), // English
                  const Locale('ar', ''), // Arabic
                ]),
          );
        }
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
