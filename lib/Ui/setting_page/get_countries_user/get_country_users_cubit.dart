import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/repository.dart';
import '../../../model/user_country/user_country_model.dart';

part 'get_country_users_state.dart';

class GetCountryUsersCubit extends Cubit<GetCountryUsersState> {
  final Repository _repository;
  GetCountryUsersCubit(this._repository) : super(GetCountryUsersState());
  UserCountryModel? userCountryModel;
  Future getCountryUser(String id,String type)async{
     emit(state.copyWith(getUserCountryState: RequestState.loading));
    final res= await _repository.getCountryUsers(id,type);
     userCountryModel=res;
     emit(state.copyWith(getUserCountryState: RequestState.loaded,userCountryModel: res));
  }
}
