import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/htttp_overrides.dart';
import 'package:taknikat/injectoin.dart';

import 'Ui/gallery/gallery_category/gallery_category_cubit.dart';
import 'Ui/gallery/gallery_cubit.dart';
import 'Ui/gallery/vendor/vendor_cubit.dart';
import 'Ui/my_orders/product_order/logic/product_cubit.dart';
import 'Ui/my_orders/service_order/logic/service_order_cubit.dart';
import 'Ui/sheets/change_langauge/change_langauge_picker_cubit.dart';
import 'core/init_notifications_service.dart';
import 'firebase_options.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
///24/8/2025
void main() async {
  HttpOverrides.global = MyHttpOverrides();
  // FlavorConfig(name: "PRODUCTION", variables: {
  //   "baseUrl": BaseUrl,
  // });yehya  في الفا
  ///ios2 21/5/2025
  //
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await iniGetIt();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (_) {
    print(_.toString());
  }
  // if (await FlutterAppBadger.isAppBadgeSupported())
  //   FlutterAppBadger.removeBadge();
  // AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //       channelKey: 'high_importance_channel',
  //       channelName: 'Important Notifications',
  //       channelDescription: 'Notification channel for important notifications',
  //       defaultColor: Colors.deepPurple,
  //       ledColor: Colors.white,
  //       importance: NotificationImportance.Max,
  //       channelShowBadge: true,
  //     )
  //   ],
  // );
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<GalleryCubit>()),
        BlocProvider(create: (_) => sl<GalleryCategoryCubit>()),
        BlocProvider(create: (_) => sl<VendorCubit>()),
        BlocProvider(create: (_) => sl<ChangeLanguageCubit>()),
        BlocProvider(create: (_) => sl<ServiceOrderCubit>()),
        BlocProvider(create: (_) => sl<ProductCubit>()),
      ],
      child:  InitNotificationsServiceWidget(
        child:   DevicePreview(
          enabled: false,
          builder: (context) => App(),
        ),
      )
    )


  );
}
