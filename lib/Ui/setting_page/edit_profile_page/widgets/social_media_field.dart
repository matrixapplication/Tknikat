
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/tap_effect.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';

import '../../../../core/app_localizations.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/inputs/custom_text_field_link.dart';

class SocialMediaFiled extends StatefulWidget {
  final SocialLinksItem _parameters;
  final Function(String) _onUpdate;
  final Widget? switchWidget;
  const SocialMediaFiled({
    required SocialLinksItem parameters,
    required Function(String) onUpdate, this.switchWidget,
  })  : _parameters = parameters,
        _onUpdate = onUpdate;

  @override
  State<SocialMediaFiled> createState() => _SocialMediaFiledState();
}

class _SocialMediaFiledState extends State<SocialMediaFiled> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget._parameters.link);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
     Padding(padding: 8.paddingVert,
     child:  CustomTextFieldLink(
         isRequired: false,

         controller: _controller,
         iconSVG: widget._parameters.icon,
         onChange: widget._onUpdate,
         defaultValue: widget._parameters.link,
         hint: AppLocalizations.of(context).translate("Url"),
         suffixData:
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

             widget.switchWidget??SizedBox(),
             2.height,
             CustomTapEffect(onTap: ()=>_getClipboardText(), child: BlackRegularText(label: AppLocalizations.of(context).translate("paste"),fontSize: 12,)),
           ],
         )
     ),
     );
  }

  void _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    _controller.text = clipboardData?.text??'';
    widget._onUpdate(clipboardData?.text??'');
  }
}
enum SocialLinksTypes { website ,facebook,tiktok,youtube,telegram,behance,dribbble,snapchat,linkedin,github,discord}

class SocialLinksItem {
  final SocialLinksTypes type;
  final String icon;
  String? link;


  SocialLinksItem({required this.type,required this.icon,required this.link});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type.name;
    if (link != null) data["link"] = link;

    return data;
  }
}