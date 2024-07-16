import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taknikat/core/constent.dart';

final TextEditingController _pinPutController = TextEditingController();
final FocusNode _pinPutFocusNode = FocusNode();
late BuildContext _context;
Widget animatingBorders(controller) {
  BoxDecoration pinPutDecoration = BoxDecoration(
    border: Border.all(color: primaryColor),
    borderRadius: BorderRadius.circular(75),
  );
  return PinCodeTextField(
    appContext: _context,
    length: 4,
    onChanged: (value) {},
    // fieldsCount: 4,
    // eachFieldHeight: 75,
    // eachFieldWidth: 75,
    //onSubmit: (String pin) => _showSnackBar(pin),
    focusNode: _pinPutFocusNode,
    controller: controller,
    // submittedFieldDecoration:
    //     pinPutDecoration.copyWith(borderRadius: BorderRadius.circular(75)),
    // pinAnimationType: PinAnimationType.slide,
    // selectedFieldDecoration: pinPutDecoration,
    // followingFieldDecoration:
    //     pinPutDecoration.copyWith(borderRadius: BorderRadius.circular(75)),
  );
}
