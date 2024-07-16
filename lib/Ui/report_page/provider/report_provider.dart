// import 'dart:async';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:taknikat/core/app_localizations.dart';
// import 'package:taknikat/core/constent.dart';
// import 'package:taknikat/core/error.dart';
// import 'package:taknikat/data/repository/repository.dart';

// class ReportProvider extends ChangeNotifier {
//   ReportProvider(this._repository);

//   final Repository _repository;

//   //state
//   bool _isLoading = false;

//   bool get isLoading => _isLoading;

//   set isLoading(bool isLoading) {
//     _isLoading = isLoading;
//     notifyListeners();
//   }

//   getReports() async {
//     isLoading = true;
//     try {
//       final response =
//           await _repository.getReports();
//       return response;
//     } on NetworkException catch (e) {
//       Fluttertoast.showToast(msg: e.error);
//     }

//     isLoading = false;
//   }

//   onSubmitted(BuildContext context, ReportData _reportData) async {
//     isLoading = true;

//     try {
//       await _repository.addReport(_reportData);

//       AwesomeDialog(
//         context: context,
//         btnOkText: AppLocalizations.of(context).translate("Ok"),
//         btnOkColor: primaryColor,
//         dialogType: DialogType.SUCCES,
//         title: AppLocalizations.of(context).translate("Reported successfully!"),
//         btnOkOnPress: () {
//           Navigator.of(context).pop();
//         },
//       )..show();
//     } on NetworkException catch (e) {
//       Fluttertoast.showToast(msg: e.error);
//     }

//     isLoading = false;
//   }
// }

// class ReportData {
//   ReportData({this.reportId, this.modelId, this.modelType});

//   final String? reportId;
//   final String? modelId;
//   final String? modelType;

//   ReportData copyWith({
//     String? reportId,
//     String? modelId,
//     String? modelType,
//   }) {
//     return ReportData(
//       reportId: reportId ?? this.reportId,
//       modelId: modelId ?? this.modelId,
//       modelType: modelType ?? this.modelType,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> map = {
//       if (reportId != null) 'reportId': reportId,
//       if (modelId != null) 'modelId': modelId,
//       if (modelType != null) 'modelType': modelType,
//     };
//     return map;
//   }
// }
