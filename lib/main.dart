import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/htttp_overrides.dart';
import 'package:taknikat/injectoin.dart';

import 'Ui/gallery/gallery_cubit.dart';
import 'firebase_options.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  // FlavorConfig(name: "PRODUCTION", variables: {
  //   "baseUrl": BaseUrl,
  // });yehya  في الفا
  //ios 29/8
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
  if (await FlutterAppBadger.isAppBadgeSupported())
    FlutterAppBadger.removeBadge();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<GalleryCubit>()),
      ],
      child:  DevicePreview(
        enabled: false,
        builder: (context) => App(),
      ),
    )


  );
}
