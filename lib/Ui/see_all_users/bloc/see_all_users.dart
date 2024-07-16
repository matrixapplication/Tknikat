import 'package:bloc/bloc.dart';
import 'package:taknikat/Ui/see_all_users/bloc/see_all_users_event.dart';
import 'package:taknikat/Ui/see_all_users/bloc/see_all_users_state.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

class SeeAllUsersBloc extends Bloc<SeeAllUsersEvent, SeeAllUsersState> {
  Repository _repository;

  SeeAllUsersBloc(this._repository) : super(SeeAllUsersState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<Getusers>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..paginator = null
          ..users.replace([])));

        final contractorData = await _repository.getAllUsers(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(contractorData.paginator!)
          ..users.replace(contractorData.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..users.replace([])));
      }
    });
    on((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        try {
          emit(state.rebuild((b) => b..isLoading = true));
          final vendorsData = await _repository
              .getAllUsers(this.state.paginator.currentPage! + 1);

          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error = ""
            ..paginator.replace(vendorsData.paginator!)));
        } on NetworkException catch (e) {
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error = e.error.toString()));
        }
      }
    });
  }
}
