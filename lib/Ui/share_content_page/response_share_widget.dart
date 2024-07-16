import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_event.dart';
import 'package:taknikat/Ui/setting_page/my_shares/bloc/my_shares_bloc.dart';
import 'package:taknikat/Ui/share_content_page/bloc/share_bloc.dart';
import 'package:taknikat/Ui/share_content_page/reject_page.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../../core/constent.dart';

class ResponseToShareWidget extends StatelessWidget {
  final ShareModel share;

  const ResponseToShareWidget({Key? key, required this.share})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShareBloc, ShareState>(
      listener: (context, state) {
        if (state.status == BlocStatus.success) {
          AwesomeDialog(
            context: context,
            btnOkText: AppLocalizations.of(context).translate("Ok"),
            btnOkColor: primaryColor,
            dialogType: DialogType.success,
            title: (state.approved ?? false)
                ? 'تم قبول المشاركة'
                : "تم رفض المشاركة",
            btnOkOnPress: () {
              sl<MySharesBloc>().add(MySharesFetched(0, ShareStatus.pending));
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          )..show();
          if (state.approved ?? false) sl<MyEventsBloc>().add(GetMyEvents());
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
          color: Colors.blue.withOpacity(0.1),
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                        AppLocalizations.of(context).translate('agree_or_not_agree_description'),
                        textAlign: TextAlign.center),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ShareBloc>()
                                  .add(ApproveShare(id: share.id));
                            },
                            child: Text(
                                AppLocalizations.of(context).translate('Ok'),
                            )),
                      ),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(PageTransition(
                                duration: Duration(milliseconds: 700),
                                type: PageTransitionType.fade,
                                child: RejectPage(
                                  modelId: share.id.toString(),
                                ),
                              ));
                            },
                            child: Text(
                              AppLocalizations.of(context).translate('No'),
                              style: TextStyle(color: Colors.grey),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              if (state.status == BlocStatus.loading)
                Center(
                  child: loader(context: context),
                )
            ],
          ),
        );
      },
    );
  }
}
