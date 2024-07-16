import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taknikat/Ui/report_page/bloc/report_bloc.dart';
import 'package:taknikat/Ui/report_page/bloc/report_event.dart';
import 'package:taknikat/Ui/report_page/report_class.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/report_model/report_model.dart';

import 'bloc/report_state.dart';

class ReportPage extends StatefulWidget {
  ReportPage({Key? key, required this.modelId, required this.modelType})
      : super(key: key);
  final ReportType modelType;
  final String modelId;

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _bloc = sl<ReportBloc>();

  ReportModel? selectedReport;

  @override
  void initState() {
    _bloc.add(GetReports());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<ReportBloc, ReportState>(
        listener: (context, state) {
          if (state.isAddingReport && state.success) {
            AwesomeDialog(
              context: context,
              btnOkText: AppLocalizations.of(context).translate("Ok"),
              btnOkColor: primaryColor,
              dialogType: DialogType.success,
              title: AppLocalizations.of(context)
                  .translate("Reported successfully!"),
              btnOkOnPress: () {
                Navigator.of(context).pop();
              },
            )..show();
          }
        },
        builder: (context, state) {
          showToast(state.error);
          print(widget.modelType.name);
          return Center(
            child: Card(
              margin: EdgeInsets.all(13),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 21, horizontal: 13),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: -16,
                        left: -8,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.grey,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        )),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text(
                            AppLocalizations.of(context)
                                    .translate("reporting") +
                                ' ' +
                                AppLocalizations.of(context)
                                    .translate(widget.modelType.name),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        if (state.success)
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 13,
                            ),
                            child: Column(
                              children: [
                                ...state.reports
                                    .map((post) => Column(children: [
                                          RadioListTile<ReportModel>(
                                            contentPadding: EdgeInsets.zero,
                                            value: post,
                                            groupValue: selectedReport,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedReport = value!;
                                              });
                                              print(selectedReport);
                                            },
                                            title: Text(post.content),
                                          ),
                                          Divider(height: 0),
                                        ])),
                              ],
                            ),
                          ),
                        if (state.isLoading)
                          Center(child: CircularProgressIndicator()),
                        SizedBox(height: 13),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: selectedReport == null
                                ? () {
                                    Fluttertoast.showToast(
                                        msg: AppLocalizations.of(context)
                                            .translate("report message"));
                                  }
                                : () {
                                    _bloc.add(AddReport((b) => b
                                      ..reportId = selectedReport!.id.toString()
                                      ..modelId = widget.modelId
                                      ..modelType =
                                          'App\\Models\\${widget.modelType.name}'));
                                  },
                            child: Text(AppLocalizations.of(context)
                                .translate("report")),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
