library notification_event;

import 'dart:io';
import 'package:built_value/built_value.dart';

part 'notification_event.g.dart';

abstract class NotificationEvent {}

abstract class TryGetNotification extends NotificationEvent
    implements Built<TryGetNotification, TryGetNotificationBuilder> {
  // fields go here

  TryGetNotification._();

  factory TryGetNotification([updates(TryGetNotificationBuilder b)]) =
      _$TryGetNotification;
}

abstract class ChangeNotificationStatus extends NotificationEvent
    implements
        Built<ChangeNotificationStatus, ChangeNotificationStatusBuilder> {
  // fields go here

  ChangeNotificationStatus._();

  factory ChangeNotificationStatus(
          [updates(ChangeNotificationStatusBuilder b)]) =
      _$ChangeNotificationStatus;
}

abstract class ClearError extends NotificationEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetNext extends NotificationEvent
    implements Built<GetNext, GetNextBuilder> {
  // fields go here

  GetNext._();

  factory GetNext([updates(GetNextBuilder b)]) = _$GetNext;
}
