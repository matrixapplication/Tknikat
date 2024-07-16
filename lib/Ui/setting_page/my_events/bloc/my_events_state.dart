library my_events_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/paginator/paginator.dart';

part 'my_events_state.g.dart';

abstract class MyEventsState
    implements Built<MyEventsState, MyEventsStateBuilder> {
  bool get isLoading;
  bool get addSuccess;
  bool get editSuccess;
  bool get removeSuccess;
  String? get error;

  BuiltList<EventModel> get myEvents;

  Paginator get paginator;

  bool get initialized;

  MyEventsState._();

  factory MyEventsState([updates(MyEventsStateBuilder b)]) =
      _$MyEventsState;

  factory MyEventsState.init() {
    return MyEventsState((b) => b
      ..isLoading = false
      ..initialized = false
      ..addSuccess = false
      ..editSuccess = false
      ..removeSuccess = false
      ..error = '');
  }
}
