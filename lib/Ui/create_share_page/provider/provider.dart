import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/all_events_page/bloc/events_bloc.dart';
import 'package:taknikat/Ui/base_page/base_page.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_bloc.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../../all_events_page/all_events_page.dart';
import '../../setting_page/my_events/bloc/my_events_event.dart';

class ShareProvider extends ChangeNotifier {
  ShareProvider(this._repository);

  final Repository _repository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //state
  bool _isLoading = false;
  bool isEdit = false;
  ShareData _shareData = ShareData();
  List<ShareData> shareDataList = [];

  init(ShareModel? shareModel) {
    if (shareModel != null) {
      isEdit = true;
      _shareData = ShareData(
        description: shareModel.description ?? '',
        shareId: shareModel.id,
      );
    }
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  onDescriptionChanged(String text) {
    _shareData = _shareData.copyWith(
      description: text,
    );

  }
  int counter =1;
  onDescriptionLst(String text,int index) {
    if(shareDataList.where((element) => element.index==index).isNotEmpty){
      shareDataList.where((element) => element.index==index).first.description=text;
    }else{
      shareDataList.add(ShareData(
        index: index,
        description: text,
      ));
    }

    print('indexx: ${shareDataList.map((e) => e.index)}  description ${shareDataList.map((e) => e.description)}');
    print('indessxx: ${shareDataList.map((e) => e.index)}  image ${shareDataList.map((e) => e.image)}');

  }
  onImageLst(File? image,int id,int index) {
    if(shareDataList.where((element) => element.index==index).isNotEmpty){
      shareDataList.where((element) => element.index==index).first.image=image;
    }else{
      shareDataList.add(ShareData(
        index: index,
        id: id,
        image: image,
      ));
    }
    print('indexx: ${shareDataList.map((e) => e.index)}  image ${shareDataList.map((e) => e.image)}');

  }
  onDescriptionAndImage(String text,File? image,int id) {
    shareDataList.add(ShareData(
        description: text,
        image: image,
        id: id
    ));
  }
  deleteItem(int id) {
    shareDataList.removeWhere((element) => element.id==id);
  }

  onImageChanged(File? image) {
    _shareData = _shareData.copyWith(
      image: image,
    );

  }

  onSubmitted(int? eventId, BuildContext context) async {
    isLoading = true;
    if (
    _shareData.description.isNotEmpty    // formKey.currentState!.validate()
    ) {
      // formKey.currentState!.save();
      try {
        if (isEdit) {
          await _repository.updateShare(_shareData, _shareData.shareId!);
          AwesomeDialog(
            context: context,
            btnOkText: AppLocalizations.of(context).translate("Ok"),
            btnOkColor: primaryColor,
            dialogType: DialogType.success,
            title: 'شكرا لك',
            desc: 'سيتم مراجعة المشاركة والتاكد انه مطابقة للشروط قبل الموافقة',
            btnOkOnPress: () {

              // Navigator.of(context).pop();
              // Navigator.of(context).pop();
              // Navigator.of(context).pop();


              // Navigator.of(context).pushAndRemoveUntil(
              //   PageTransition(
              //     duration: Duration(milliseconds: 700),
              //     type: PageTransitionType.fade,
              //     child: BasePage(),
              //   ),
              //       (Route<dynamic> route) => false,
              // );

            },
          )..show();
        } else {
       print('shareDataList ${shareDataList.length}');
          await _repository.createShare(
            shareDataList,
            eventId!,
          ).then((value) {
            AwesomeDialog(
              context: context,
              // dismissOnTouchOutside:true,
              btnOkText: AppLocalizations.of(context).translate("Ok"),
              btnOkColor: primaryColor,
              dialogType: DialogType.success,
              title: 'شكرا لك',
              desc: 'سيتم مراجعة المشاركة والتأكد من أنها مطابقة للشروط قبل الموافقة',
              onDismissCallback:(DismissType type){
                if(type ==DismissType.modalBarrier){
                  Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                      duration: Duration(milliseconds: 700),
                      type: PageTransitionType.fade,
                      child: BasePage(),
                    ),
                        (Route<dynamic> route) => false,
                  );
                }
              },
              btnOkOnPress: () {
                Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.fade,
                    child: BasePage(),
                  ),
                      (Route<dynamic> route) => false,
                );
              },
            )..show();

          });

        }

        sl<MyEventsBloc>().add(GetMyEvents());
        sl<EventsBloc>().add(EventsFetched());

        // Fluttertoast.showToast(
        //     msg: AppLocalizations.of(context).translate('add share success'));
        // Navigator.pop(context);
      } on NetworkException catch (e) {
        Fluttertoast.showToast(msg: e.error);
      }
    }
    else{
      Fluttertoast.showToast(
          msg: 'Data is Empty');
    }
    isLoading = false;
  }

  onDeleted(int shareId, BuildContext context) async {
    isLoading = true;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        await _repository.deleteShare(shareId);
        Navigator.pop(context);
      } on NetworkException catch (e) {
        Fluttertoast.showToast(msg: e.error);
      }
    }
    isLoading = false;
  }
}

class ShareData {
   String description;
   int? shareId;
   File? image;
   int? id;
   int? index;


  ShareData({
    this.description = '',
    this.image,
    this.shareId,
    this.id,
    this.index,

  });

  ShareData copyWith({
    String? description,
    File? image,
    int? shareId,
    int? index,
  }) {
    return ShareData(
      description: description ?? this.description,
      image: image ?? this.image,
      shareId: shareId ?? this.shareId,
      index: index ?? this.index,
    );
  }

  Future<Map<String, dynamic>> toMap() async {
    return {
      'description[]': description.replaceAll('\n', '<br>'),
      if (image != null) 'image[]': await MultipartFile.fromFile(image!.path),
      if (shareId != null) 'shareId': shareId,
    };
  }
}
