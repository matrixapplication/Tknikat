library my_events_event;

import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:taknikat/model/event_model/event_model.dart';

part 'my_events_event.g.dart';

abstract class MyEventsEvent {}

abstract class InitMyEvents extends MyEventsEvent
    implements Built<InitMyEvents, InitMyEventsBuilder> {
  InitMyEvents._();
  factory InitMyEvents([updates(InitMyEventsBuilder b)]) = _$InitMyEvents;
}

abstract class RemoveEvent extends MyEventsEvent
    implements Built<RemoveEvent, RemoveEventBuilder> {
  EventModel get event;

  RemoveEvent._();

  factory RemoveEvent([updates(RemoveEventBuilder b)]) = _$RemoveEvent;
}

abstract class EditEvent extends MyEventsEvent
    implements Built<EditEvent, EditEventBuilder> {
  EditEventParam get param;

  EditEvent._();

  factory EditEvent([updates(EditEventBuilder b)]) = _$EditEvent;
}

abstract class ClearState extends MyEventsEvent
    implements Built<ClearState, ClearStateBuilder> {
  ClearState._();

  factory ClearState([updates(ClearStateBuilder b)]) = _$ClearState;
}

abstract class GetMyEvents extends MyEventsEvent
    implements Built<GetMyEvents, GetMyEventsBuilder> {
  GetMyEvents._();

  factory GetMyEvents([updates(GetMyEventsBuilder b)]) = _$GetMyEvents;
}

abstract class GetNextMyEvents extends MyEventsEvent
    implements Built<GetNextMyEvents, GetNextMyEventsBuilder> {
  GetNextMyEvents._();

  factory GetNextMyEvents([updates(GetNextMyEventsBuilder b)]) =
      _$GetNextMyEvents;
}

class EditEventParam {
  final int? id;
  final String desc;
  final DateTime startDate;
  final DateTime endDate;
  final File image;
  final String name;

  EditEventParam({
    this.id,
    required this.desc,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.name,
  });
}
