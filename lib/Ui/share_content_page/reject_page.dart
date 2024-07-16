import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taknikat/Ui/share_content_page/bloc/share_bloc.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/reject_model/reject_model.dart';

import '../../core/app_localizations.dart';
import '../auth_screen/widget/text_card.dart';

class RejectPage extends StatefulWidget {
  RejectPage({Key? key, required this.modelId}) : super(key: key);
  final String modelId;

  @override
  State<RejectPage> createState() => _RejectPageState();
}

class _RejectPageState extends State<RejectPage> {
  final _bloc = sl<ShareBloc>();

  RejectModel? selectedReason;

  @override
  void initState() {
    _bloc.add(GetRejectReasons());
    super.initState();
  }
  int val =0;
  TextEditingController _reasonController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<ShareBloc, ShareState>(
        listener: (context, state) {
          // if (state.status == BlocStatus.success) {
          //   Navigator.of(context).pop();
          // }
        },
        builder: (context, state) {
          RejectModel otherReason = RejectModel((b) => b
            ..content = '${AppLocalizations.of(context).translate('other')}'
            ..id = 500);
          return SingleChildScrollView(
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
                            'سبب رفض المشاركة',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        if (state.rejectReasonsStatus == BlocStatus.success)
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 13,
                            ),
                            child:
                            // state.rejectReasons.add(RejectModel((b) => b
                            //             ..content = 'اخري'
                            //             ..id = 6));

                            SingleChildScrollView(
                              child: Column(
                                children: [
                               Column(
                              children: [
                              ...state.rejectReasons
                                  .map((reason) => Column(children: [
                                      RadioListTile<RejectModel>(
                                        contentPadding: EdgeInsets.zero,
                                        value: reason,
                                        groupValue: selectedReason,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedReason = value!;
                                          });
                                          print(selectedReason);
                                        },
                                        title: Text(reason.content),
                                      ),
                                    Divider(height: 0),
                                  ])).toList(),
                                    Column(
                                      children: [
                                        RadioListTile<RejectModel>(
                                          contentPadding: EdgeInsets.zero,
                                          value: otherReason,
                                          groupValue: selectedReason,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedReason = value!;
                                            });
                                            print(selectedReason);
                                          },
                                          title: Text("${AppLocalizations.of(context).translate('other')}"),
                                        ),
                                        Divider(height: 0),
                                      ],
                                    ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        // borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),),
                                    validator:(value){
                                      if (value == null || value.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                      return null;
                                    },
                                    controller: _reasonController,
                                    maxLines: 4,
                                    keyboardType: TextInputType.text,
                                    onTap: () {
                                      setState(() {
                                        selectedReason=otherReason;
                                      });
                                    },
                                  ),

                                ],
                              ),
                            ),
                          ),
                        if (state.status == BlocStatus.loading)
                          Center(child: CircularProgressIndicator()),
                        SizedBox(height: 13),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: selectedReason == null
                                ? () {
                                    Fluttertoast.showToast(
                                        msg: 'عليك اختيار سبب الرفض');
                                  }
                                : () {
                                    _bloc.add(RejectShare(
                                        rejectId:selectedReason!.id==500?'other': selectedReason!.id.toString(),
                                        modelId: widget.modelId, text:_reasonController.text));
                                  },
                            child: Text('ارسال'),
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
