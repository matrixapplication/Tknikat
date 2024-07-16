import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/Ui/report_page/report_class.dart';
import 'package:taknikat/Ui/report_page/report_page.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/injectoin.dart';

Widget commentReportButton({
  required BuildContext context,
  required String modelId,
  required ReportType modelType,
}) {
  return TextButton(
    onPressed: () async {
      if (await sl<PrefsHelper>().getIsLogin()) {
        Navigator.of(context).push(PageTransition(
          duration: Duration(milliseconds: 700),
          type: PageTransitionType.fade,
          child: ReportPage(
            modelId: modelId,
            modelType: modelType,
          ),
        ));
      } else {
        AwesomeDialog(
            context: context,
            title: AppLocalizations.of(context).translate("Login"),
            desc: AppLocalizations.of(context).translate("login first"),
            dialogType: DialogType.warning,
            btnOk: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(PageTransition(
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.fade,
                    child: SignInPage()));
              },
              child: Text(
                AppLocalizations.of(context).translate("Login"),
              ),
            ),
            btnCancel: TextButton(
              child: Text(
                AppLocalizations.of(context).translate("Cancel"),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )).show();
      }
    },
    child: Text(
      AppLocalizations.of(context).translate("report"),
      style: TextStyle(
        fontSize: 12,
        color: Color(0xFF898E92),
      ),
    ),
  );
}
