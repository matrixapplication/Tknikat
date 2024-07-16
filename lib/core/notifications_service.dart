import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/AllNotification_page/allNotification_page.dart';
import 'package:taknikat/Ui/events_content_page/events_content_page.dart';
import 'package:taknikat/Ui/product_content_page/product_content_page.dart';
import 'package:taknikat/Ui/project_content_page/project_content_page.dart';
import 'package:taknikat/Ui/service_content_page/service_content_page.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/post_screen.dart';
import 'package:taknikat/Ui/share_content_page/share_content_page.dart';
import 'package:taknikat/app/bloc/app_bloc.dart';
import 'package:taknikat/app/bloc/app_event.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/injectoin.dart';

import '../Ui/AllNotification_page/bloc/notification_bloc.dart';
import '../Ui/AllNotification_page/bloc/notification_event.dart';
import '../data/repository/repository.dart';

String? deviceToken;

class NotificationsService {
  final instance = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'fire_base_local', // name
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  Future<void> init() async {
    if (!(await _requestInitialPermissions())) {
      return;
    }
    await _initLocalNotificationsService();
    await _initListeners();
    instance.onTokenRefresh.listen(_onTokenRefreshed);
    instance.getToken().then((token) {
      print("DeviceToken: $token");
      deviceToken = token;
      if (appAuthState)
        sl<AppBloc>().add(UpdateToken((b) => b..firebase_token = token));
    });
    await instance.subscribeToTopic('all');
  }

  void _onTokenRefreshed(String token) {
    sl<AppBloc>().add(UpdateToken((b) => b..firebase_token = token));
  }


  Future<bool> _requestInitialPermissions() async {
    if (Platform.isIOS) {
      final settings = await instance.requestPermission();
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        return false;
      }
    }
    try {
      await instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      print('Permission granted for notifications');
    } catch (e) {
      print('Error requesting permission: $e');
      // Handle permission request error
    }

    await instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    return true;
  }

  Future<void> _initLocalNotificationsService() async {
    if (Platform.isIOS) {
      return;
    }
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        if (notificationResponse.notificationResponseType ==
            NotificationResponseType.selectedNotification) {
          if (notificationResponse.payload != null) {
            final remote = RemoteMessage.fromMap(
                json.decode(notificationResponse.payload!));
            _onMessageOpenedApp(remote);
          }
        }
      },
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  _initListeners() async {
    final initMessage = await instance.getInitialMessage();
    if (initMessage != null) {
      _onMessageOpenedApp(initMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      FlutterAppBadger.isAppBadgeSupported().then((print));
      _getAllNotifications();
      _showAndroidNotification(message);
    });

    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  _onMessageOpenedApp(RemoteMessage message) async {
    final context = sl<GlobalKey<NavigatorState>>().currentState?.context;
    if (context != null && appAuthState) {
      Navigator.of(context).push(
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.fade,
          child: AllNotificationPage(),
        ),
      );
    }
    if (message.data.isNotEmpty && message.data['data'] != null) {
      open(jsonDecode(message.data['data']));
    }
  }

  void _showAndroidNotification(RemoteMessage message) {
    if (Platform.isAndroid) {
      final notification = message.notification;
      final android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body?.replaceAll("<br>", ' ').replaceAll("\n", " "),
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: android.smallIcon,
              channelDescription: channel.description,
              playSound: true,
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
      }
    }
  }

  _getAllNotifications() {
    sl<NotificationBloc>().add(TryGetNotification());
  }
}

void open(Map<String, dynamic> data, [BuildContext? ctx]) async {
  BotToast.showLoading();
  final type = data['model_type'];
  final id = int.parse(data['model_id'].toString());
  final context = sl<GlobalKey<NavigatorState>>().currentState?.context ?? ctx;
  Widget? route = null;
  if (context != null) {
    try {
      switch (type) {
        case 'share':
          final share = await sl<Repository>().getShareById(id);
          route = ShareContentPage(share: share, event: share.event!);
          break;
        case 'post':
          final post = await sl<Repository>().getPostById(id);
          route = PostScreen(
            postModel: post,
            fromMyPostsList: false,
          );
          break;
        case 'product':
          final product = await sl<Repository>().getProductById(id);
          route = ProductContentPage(product);
          break;
        case 'service':
          final service = await sl<Repository>().getServiceByIdOrSlug(id);
          route = ServiceContentPage(service);

          break;
        case 'project':
          final project = await sl<Repository>().getProjectByIdOrSlug(id);
          route = ProjectContentPage(project);
          break;

        case 'event':
          final event = await sl<Repository>().getEventByIdOrSlug(id);
          route = EventContentPage(event);
      }
    } on NetworkException catch (e) {
      BotToast.cleanAll();
      BotToast.showText(text: 'البيانات المراد عرضها غير متاحة');
      return;
    }
    if (route != null) {
      Navigator.of(context).push(
        PageTransition(
          duration: Duration(milliseconds: 500),
          type: PageTransitionType.fade,
          child: route,
        ),
      );
    }
  }
  BotToast.closeAllLoading();
}

Future<bool> _isAppBadgeSupported() async =>
    await FlutterAppBadger.isAppBadgeSupported();

Future<void> _onBackgroundMessage(message) async {
  final bool isSupported = await FlutterAppBadger.isAppBadgeSupported();
  if (isSupported) {
    FlutterAppBadger.updateBadgeCount(1);
  }
}

Future<void> removeBadge() async {
  if (await _isAppBadgeSupported()) FlutterAppBadger.removeBadge();
}
