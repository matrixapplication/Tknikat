library notification_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/notification/notification.dart';
import 'package:taknikat/model/paginator/paginator.dart';

part 'notification_state.g.dart';

abstract class NotificationState
    implements Built<NotificationState, NotificationStateBuilder> {
  String get error;

  bool get isLoading;

  bool get success;
  bool get initialized;

  BuiltList<Notification> get notifications;

  Paginator get paginator;
  int get unreadenNotificationCount;

  NotificationState._();

  factory NotificationState([updates(NotificationStateBuilder b)]) =
      _$NotificationState;

  factory NotificationState.init() {
    return NotificationState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..initialized = false
      ..unreadenNotificationCount = 0
      ..notifications.replace([]));
  }
}
