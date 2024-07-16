part of 'create_event_bloc.dart';

abstract class CreateEventEvent {}

class SubmitEvent implements CreateEventEvent {
  final SubmitEventParam param;

  SubmitEvent({
    required this.param,
  });
}

class ClearState implements CreateEventEvent {
  const ClearState();
}

class SubmitEventParam {
  final String desc;
  final String number;
  final DateTime startDate;
  final DateTime endDate;
  final File image;
  final String name;

  SubmitEventParam({
    required this.desc,
    required this.number,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.name,
  });
}
