part of 'events_bloc.dart';

@immutable
class EventsState {
  EventsState({
    required this.filter,
  });

  factory EventsState.init() => EventsState(
        filter: EventsFilter(),
      );
  final EventsFilter filter;

  EventsState copyWith({
    EventsFilter? filter,
  }) {
    return EventsState(
      filter: filter ?? this.filter,
    );
  }
}
