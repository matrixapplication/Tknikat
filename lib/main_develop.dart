import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';

import 'firebase_options.dart';

void main() async {
  FlavorConfig(name: "DEVELOP", variables: {
    "baseUrl": DevBaseUrl,
  });
  WidgetsFlutterBinding.ensureInitialized();
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
    DevicePreview(
      enabled: false,
      builder: (context) => App(),
    ),
  );
}
