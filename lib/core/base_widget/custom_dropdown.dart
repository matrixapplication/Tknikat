import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';

class CustomDropDown extends StatefulWidget {
  final String? icon;
  final String? hint;
  final List<String>? values;
  final List<int> valuesId;
  final Function(int)? callback;

  CustomDropDown(
      {this.values,
      this.valuesId = const [],
      this.callback,
      this.icon,
      this.hint});

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: sizeAware.height * 0.056992,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: selected,
        items: widget.values == null
            ? []
            : widget.values!
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8.0),
                      child: Text(
                        e,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                )
                .toList(),
        onChanged: (v) {
          print(widget.values);
          setState(() {
            selected = v!;
          });
          widget.callback?.call(widget.valuesId[widget.values!.indexOf(v!)]);
        },
        isExpanded: true,
        underline: Container(),
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: primaryColor,
        ),
        hint: Row(
          children: [
            SizedBox(width: 4),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(widget.hint!, style: TextStyle()),
            )
          ],
        ),
      ),
    );
  }
}

// Widget CustomDropDown({String icon, String hint}) {
//   return Container(
//     alignment: Alignment.center,
//     margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical),
//     height: SizeConfig.screenHeight * 0.07,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: greyColor, width: 1)),
//     child: DropdownButton(
//       items: [],
//       onChanged: (v) {},
//       isExpanded: true,
//       underline: Container(),
//       icon: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: SizeConfig.blockSizeHorizontal * 1.5),
//         child: Icon(
//           Icons.keyboard_arrow_down_rounded,
//           color: greyColor,
//           size: SizeConfig.blockSizeVertical * 2.5,
//         ),
//       ),
//       hint: Row(
//         children: [
//           icon == null
//               ? Container()
//               : Padding(
//                   padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
//                   child: buildLocalImage(icon, color: greyColor),
//                 ),
//           SizedBox(width: 4),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               hint,
//               style: mediumStyle.copyWith(
//                   color: greyColor, fontSize: SizeConfig.blockSizeVertical * 2),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
