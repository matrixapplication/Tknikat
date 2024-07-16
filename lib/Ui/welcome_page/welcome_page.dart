import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/constent.dart';

import 'package:taknikat/injectoin.dart';
import 'package:page_transition/page_transition.dart';
import '../../core/app_localizations.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var controller = PageController(initialPage: 0);
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: sizeAware.height * 0.071090047393365,
            ),
            Container(
                height: sizeAware.height * 0.464285714285714,
                child: indexPage == 0
                    ? Image.asset(
                        "assets/images/payment.png",
                      )
                    : indexPage == 1
                        ? Image.asset(
                            "assets/images/products.png",
                          )
                        : Image.asset(
                            "assets/images/discount.png",
                          )),
            SizedBox(height: 20),
            indexPage == 0
                ? baseText(
                    AppLocalizations.of(context).translate("Many Products"),
                    color: Colors.black,
                    size: 18.0,
                    fontWeight: FontWeight.bold)
                : indexPage == 1
                    ? baseText(
                        AppLocalizations.of(context).translate("Easy Payment"),
                        color: Colors.black,
                        size: 18.0,
                        fontWeight: FontWeight.bold)
                    : baseText(
                        AppLocalizations.of(context)
                            .translate("Many Discounts"),
                        color: Colors.black,
                        size: 18.0,
                        fontWeight: FontWeight.bold),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: indexPage == 0
                    ? baseText("",
                        // 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك',
                        color: primaryColor,
                        size: 12.0,
                        textAlign: TextAlign.center)
                    : indexPage == 1
                        ? baseText("",

                            // 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك',
                            color: primaryColor,
                            size: 12.0,
                            textAlign: TextAlign.center)
                        : baseText("",

                            // 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك',
                            color: primaryColor,
                            size: 12.0,
                            textAlign: TextAlign.center)),
            SizedBox(height: 20),
            Container(
              child: new DotsIndicator(
                dotsCount: 3,
                position: indexPage.toInt(),
                decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(40.0, 9.0),
                    color: Colors.transparent,
                    activeColor: othercolor,
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(
                          color: othercolor,
                        ))),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: baseClick(
                  indexPage == 0 || indexPage == 1
                      ? AppLocalizations.of(context).translate("Continue")
                      : AppLocalizations.of(context).translate("Get Started"),
                  onTap: () {
                if (indexPage == 0) {
                  setState(() {
                    indexPage = 1;
                  });
                } else if (indexPage == 1) {
                  setState(() {
                    indexPage = 2;
                  });
                } else {
                  /////push to login page/////
                  Navigator.of(context).push(PageTransition(
                      duration: Duration(milliseconds: 700),
                      type: PageTransitionType.fade,
                      child: SignInPage()));
                }
              },
                  color: othercolor,
                  colorTitle: Colors.white,
                  height: 50.0,
                  radius: 6.0,
                  sizeTitle: 14.0,
                  FontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageTransition(
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.fade,
                    child: SignInPage()));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /////push to home page ////

                      baseText(
                        AppLocalizations.of(context).translate("Skip"),
                        color: primaryColor,
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      AppLocalizations.of(context).locale.toLanguageTag() ==
                              "ar"
                          ? Icon(
                              Icons.arrow_back_outlined,
                              color: primaryColor,
                            )
                          : RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.arrow_back_outlined,
                                color: primaryColor,
                              ),

                              //  onPressed: null,
                            )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
