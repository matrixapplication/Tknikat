import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/core/constent.dart';

class LogInRequiredWidget extends StatelessWidget {
  const LogInRequiredWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.directional(
                top: -40,
                start: 76,
                textDirection: Directionality.of(context),
                child: CircleAvatar(
                  radius: 37,
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.login,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'يرجى تسجيل الدخول اولا',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(PageTransition(
                              duration: Duration(milliseconds: 700),
                              type: PageTransitionType.fade,
                              child: SignInPage()));
                        },
                        child: Text('تسجيل الدخول'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showDialogLogIn(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0.0,
              content: Container(
                  height: MediaQuery.sizeOf(context).height / 3,
                  child: Center(child: LogInRequiredWidget())));
        });
      });
}
