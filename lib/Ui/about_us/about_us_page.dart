import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:taknikat/Ui/home_page/bloc/home_bloc.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';

import '../../core/app_localizations.dart';

class AboutUsPage extends StatefulWidget {
   final String? title;

   AboutUsPage({this.title});

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}
//الفعاليات
class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            title:
            widget.title != null
                ?
            baseText(
                widget.title!,

            )
                :
            baseText(

              AppLocalizations.of(context).translate("About Us"),
            )),
        body: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: primaryColor,
                height: 30,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: baseText(
                      parser
                          .parseFragment(
                            sl<HomeBloc>().state.aboutus.toString(),
                          )
                          .text!,
                      //textAlign: TextAlign.right,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),
            ),
          ],
        ));
  }
}
