import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';


class ConfirmCodeForm extends StatefulWidget {

  @override
  _ConfirmCodeFormState createState() => _ConfirmCodeFormState();
}

class _ConfirmCodeFormState extends State<ConfirmCodeForm> {
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  initState()   {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 16),
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              obscuringCharacter: '*',

              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length <= 3) {
                  return "Please Enter code correctly";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(16),
                fieldHeight: 40.h,
                fieldWidth: 40.w,
                inactiveColor: Theme.of(context).primaryColorDark,
                inactiveFillColor: Colors.white,
                borderWidth: 1.w,
                activeColor: Colors.white,
                selectedFillColor: Colors.white,
                activeFillColor: Colors.white,

                selectedColor:Theme.of(context).primaryColor,
                // activeColor: primaryColor
              ),
              cursorColor: Theme.of(context).primaryColorDark,
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: false,
              errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {},
              onChanged: (value) {
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
            ),
          ),
          // const  ResendConfirmCode(phone:"+96650000000"),
          // CustomButton(
          //   onTap: () => NavigationService.push(Routes.registerScreen),
          //   isRounded: true,
          //   color: Theme.of(context).primaryColor,
          //   title:    tr(LocaleKeys.confirm),
          // ),

        ],
      ),
    );




  }
}
