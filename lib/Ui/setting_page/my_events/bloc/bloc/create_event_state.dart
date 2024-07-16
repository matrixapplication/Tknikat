part of 'create_event_bloc.dart';



class CreateEventState {
  late EventModel event;
  final bool isLoading;
  final bool isSuccess;
  final String error;

  CreateEventState({
    EventModel? event,
    this.isLoading = false,
    this.isSuccess = false,
    this.error = '',
  }) {
    this.event = event ?? EventModel();
  }

  CreateEventState copyWith({
    EventModel? event,
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return CreateEventState(
      event: event ?? this.event,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
