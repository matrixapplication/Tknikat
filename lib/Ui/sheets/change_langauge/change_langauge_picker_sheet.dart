import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:taknikat/Ui/sheets/change_langauge/change_langauge_picker_state.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../../app/bloc/app_event.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_sheet_header.dart';
import '../../../core/widgets/screen_state_layout.dart';
import '../../../injectoin.dart';
import '../dropdown_entity.dart';
import 'change_langauge_picker_cubit.dart';

class _ChangeLanguagePickerSheet extends StatefulWidget {
  final List<DropDownEntity> _defaultList;
  final DropDownEntity? _defaultValue;
  final bool _isMultiChoice;
  final bool _addAll;
  const _ChangeLanguagePickerSheet({required List<DropDownEntity> defaultList,
    required DropDownEntity? defaultValue,
    required bool addAll,
    required bool isMultiChoice,
  })  : _defaultList = defaultList,
        _defaultValue = defaultValue,
        _addAll = addAll,
        _isMultiChoice = isMultiChoice;

  @override
  State<_ChangeLanguagePickerSheet> createState() => __SubServicesPickerSheetState();


}

class __SubServicesPickerSheetState extends State<_ChangeLanguagePickerSheet> {
  late ChangeLanguageCubit _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel =sl<ChangeLanguageCubit>();
    _viewModel.init(defaultValue: widget._defaultValue,defaultList: widget._defaultList,addAll: widget._addAll) ;
  }

  @override
  Widget build(BuildContext context) {
    var responseModel = _viewModel.selectedList;
    var selectedList =_viewModel.selectedList;
    var selected = _viewModel.selected;
    return
      BlocBuilder<ChangeLanguageCubit,ChangeLanguageState>(builder: (context,state){
        return Container(
          margin: const EdgeInsets.only(top: 40),
          padding: MediaQuery.of(context).viewInsets.bottom.paddingBottom+20.paddingAll,
          decoration:  BoxDecoration(borderRadius:const BorderRadius.vertical(top: Radius.circular(20)), color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomSheetHeader(onCancelPress: ()=>context.pop(), title:getLangLocalization('Change Language')),
                12.height,
                Divider(),
                12.height,
                CustomScreenStateLayout(
                  isLoading: responseModel == null,
                  isEmpty: (responseModel?.length??0)==0,
                  // onRetry: () => _viewModel.getList(reload: true),
                  builder: (context) =>
                      _buildBody(
                          context,
                          selectedItemIds: selectedList!.map((e) => e.id).toList(),
                          list: responseModel??[],
                          selectedItem: selected
                      ),
                ),
                12.height,
                CustomButton(title: getLangLocalization('Confirm'),onTap: () {
                  final _bloc = sl<AppBloc>();
                  if (selected?.id == 1) {
                   _bloc.add(SetNewLanguage('ar'));
                   appLanguage='ar';
                  } else {
                   _bloc.add(SetNewLanguage('en'));
                   appLanguage='en';

                  }
                  Navigator.pop(context, widget._isMultiChoice ? selectedList : selected);
                  } )
              ]),
        );
      });
  }

  Widget _buildBody(BuildContext context, {List<int?>? selectedItemIds, required List<DropDownEntity> list, DropDownEntity? selectedItem}) {
    return list.isEmpty
        ? const SizedBox.shrink()
        : Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height / 2),
            child: ListView(
                shrinkWrap: true,
                children: list
                    .map((e) => widget._isMultiChoice
                        ? _buildMultiChoiceItem(context, selectedItemIds, e)
                        : _buildSingleChoiceItem(context, selectedItem, e))
                    .toList()),
          );
  }

  Widget _buildMultiChoiceItem(BuildContext context, List<int?>? selectedStateIds, DropDownEntity model) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      value: selectedStateIds!.contains(model.id),
      onChanged: (b) => _viewModel.onItemChecked(isChecked: b!, selectedItem: model),
      title:
      BlackMediumText(label: model.title,fontSize: 14,)
    );
  }


  Widget _buildSingleChoiceItem(BuildContext context, DropDownEntity? selectedItem, DropDownEntity model) {
    return

      RadioListTile<int>(
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      groupValue: selectedItem?.id,
      title: BlackMediumText(label: model.title,fontSize: 14,),
      value: model.id,
      onChanged: (value) {
        _viewModel.onSelected(model);
        setState(() {});
      },
    );
  }
}

Future<dynamic> showChangeLanguagePicker(BuildContext context,
    {required List<DropDownEntity> defaultList,
    required DropDownEntity? defaultValue,
     bool addAll=false,
    required bool isMultiChoice}) async {
  return showMaterialModalBottomSheet(
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SafeArea(
        child: _ChangeLanguagePickerSheet(
      defaultList: defaultList,
      defaultValue: defaultValue,
      addAll: addAll,
      isMultiChoice: isMultiChoice,
    )),
  );
}
