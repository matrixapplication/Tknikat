import 'package:flutter/material.dart';

import '../../../core/app_localizations.dart';

class ShowAllButton extends StatelessWidget {
  var onPressed;
  ShowAllButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            // foregroundColor: primaryColor,
            textStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                fontFamily: 'Tajawal')),
        onPressed: onPressed,
        child: Text(
            AppLocalizations.of(context)
                .translate("display all"),));
  }
}
