import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/core/app_localizations.dart';

import '../Ui/auth_screen/page/signin_page.dart';

Future<void> showLoginFirstDialog(BuildContext context) async {
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
