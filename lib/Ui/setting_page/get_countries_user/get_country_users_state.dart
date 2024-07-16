part of 'get_country_users_cubit.dart';

@immutable
class GetCountryUsersState {
  final RequestState? getUserCountryState;
  final UserCountryModel? userCountryModel;
  GetCountryUsersState({this.getUserCountryState, this.userCountryModel});

  GetCountryUsersState copyWith({
    RequestState? getUserCountryState,
    UserCountryModel? userCountryModel,
   }){
    return GetCountryUsersState(
      getUserCountryState: getUserCountryState?? this.getUserCountryState,
      userCountryModel: userCountryModel?? this.userCountryModel,
    );
  }
}
enum RequestState{
  loading,
  loaded,
  error,
}