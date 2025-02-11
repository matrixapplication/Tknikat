import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html/parser.dart' as parser;
import 'package:taknikat/Ui/auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'package:taknikat/Ui/home_page/bloc/home_bloc.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/injectoin.dart';

import '../../core/app_localizations.dart';
import '../../core/assets_image/app_images.dart';
import '../../core/widgets/icon_widget.dart';
import '../../core/widgets/texts/black_texts.dart';

class AboutUsPage extends StatefulWidget {
   final String? title;
   final String image;

   AboutUsPage({this.title, required this.image});

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}
//الفعاليات
class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //     backgroundColor: primaryColor,
        //     elevation: 0,
        //     title:
        //     widget.title != null
        //         ?
        //     baseText(
        //         widget.title!,
        //
        //     )
        //         :
        //     baseText(
        //
        //       AppLocalizations.of(context).translate("About Us"),
        //     )),
        body: Stack(
          children: [
            SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),

          Column(
            children: [
              40.height,
              AuthHeaderWidget(
                title:widget.title?? getLangLocalization('About Us'),
                hasLogo: false,
              ),
              SvgPicture.asset(widget.image),
              20.height,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: baseText(

                        widget.title!=null?

                        parser
                            .parseFragment(
                          sl<HomeBloc>().state.terms.toString(),
                        )
                            .text??'':
                        parser
                            .parseFragment(
                          sl<HomeBloc>().state.aboutus.toString(),
                        )
                            .text??'',
                        //textAlign: TextAlign.right,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                ),
              ),
            ],
          )
          ],
        ));
  }
}
