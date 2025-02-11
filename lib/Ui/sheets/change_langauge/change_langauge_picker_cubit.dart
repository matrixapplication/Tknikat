import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../../app/bloc/app_event.dart';
import '../../../injectoin.dart';
import '../dropdown_entity.dart';
import '../response_model.dart';
import 'change_langauge_picker_state.dart';


class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit()
      : super(ChangeLanguageState(

  ));

  ///variables
  ResponseModel<List<DropDownEntity>>? _responseModel;
  DropDownEntity? _selected;
  List<DropDownEntity>? _selectedList = [];
  bool? _addAll;

  ///getters
  ResponseModel<List<DropDownEntity>>? get responseModel => _responseModel;

  DropDownEntity? get selected => _selected;

  List<DropDownEntity>? get selectedList => _selectedList;

  void init({DropDownEntity? defaultValue, List<
      DropDownEntity>? defaultList, required bool addAll}) {
    _selected = defaultValue;
    _selectedList = defaultList;
    // responseModel?.data=defaultList;
    _addAll = addAll;
    print('asdasd _addAll ${_selectedList.toString()}');
    // getList(reload:false);

    emit(ChangeCurrentLangugeState());
  }

  // Future<void> getList({required bool reload}) async {
  //   if (reload) {
  //     emit(ChangeCurrentLangugeState());
  //   }
  //   responseModel?.data = _selectedList;
  //   print('asdasdasd ${responseModel?.data?.length??'0'}');
  //   if ((state.responseModel?.isSuccess ?? false) && state.addAll) {
  //
  //     // selected = selected ?? responseModel!.data![0];
  //   }
  //   emit(ChangeCurrentLangugeState());
  // }

  void onItemChecked(
      {required bool isChecked, required DropDownEntity selectedItem}) {
    if (isChecked) {
      _selectedList!.add(selectedItem);
    } else {
      _selectedList!.removeWhere((item) => item.id == selectedItem.id);
    }
    emit(ChangeCurrentLangugeState());
  }

  void onSelected(DropDownEntity value) {
    _selected = value;

    emit(ChangeCurrentLangugeState());
  }

}
