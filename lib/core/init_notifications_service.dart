import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notifications_service.dart';

class InitNotificationsServiceWidget extends StatefulWidget {
  final Widget child;

  InitNotificationsServiceWidget({Key? key, required this.child})
      : super(key: key);

  @override
  _InitNotificationsServiceWidgetState createState() =>
      _InitNotificationsServiceWidgetState();
}

class _InitNotificationsServiceWidgetState
    extends State<InitNotificationsServiceWidget> {
  final NotificationsService _notificationsService = NotificationsService();

  @override
  void initState() => {init(), super.initState()};

  @override
  Widget build(BuildContext context) => widget.child;

  Future<void> init() async {
    await _notificationsService.init();
  }
}
