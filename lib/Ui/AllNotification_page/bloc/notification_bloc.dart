import 'package:bloc/bloc.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  Repository _repository;

  NotificationBloc(this._repository) : super(NotificationState.init()) {
    on<ClearError>((event, emit) {
      emit(state.rebuild((b) => b..error = ""));
    });
    on<TryGetNotification>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false));
        if (await _repository.getIsLogin()) {
          final notifications = await _repository.getNotfication(1);
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error = ""
            ..success = true
            ..initialized = true
            ..unreadenNotificationCount =
                notifications.content!.where((x) => x.read == 0).length
            ..paginator.replace(notifications.paginator!)
            ..notifications.replace(notifications.content!)));
        } else
          emit(state.rebuild((b) => b..initialized = true));
      } catch (e) {
        print('Error: ${e.toString()}\n');
        emit(
          state.rebuild((b) => b
            ..isLoading = true
            ..success = false
            ..initialized = true),
        );
      }
    });
    on<GetNext>((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        emit(state.rebuild((b) => b..isLoading = true));
        final data = await _repository
            .getNotfication(this.state.paginator.currentPage! + 1);
        // totalPage = data.meta.last_page;
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(data.paginator!)
          ..notifications.addAll(data.content!)));
      } else {
        emit(state.rebuild((b) => b..isLoading = false));
      }
    });
    on<ChangeNotificationStatus>((event, emit) async {
      // final data = await _repository.changeNotificationStatus();
      emit(state.rebuild((b) => b..unreadenNotificationCount = 0));
    });
  }
}
