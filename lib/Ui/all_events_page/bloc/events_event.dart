part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class EventsFetched extends EventsEvent {
  final int page;

  EventsFetched({this.page = 1});
}
class ReloadEvents extends EventsEvent {}

class FilterChanged extends EventsEvent {
  final EventsFilter eventsFilter;

  FilterChanged(this.eventsFilter);
}
