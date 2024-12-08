import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_localizations.dart';
import '../../../core/constent.dart';

class ChangeStatusWidget extends StatefulWidget {
  void Function(bool)? onChanged;
  final bool value;
   ChangeStatusWidget({Key? key, this.onChanged, required this.value}) : super(key: key);
  @override
  State<ChangeStatusWidget> createState() => _ChangeStatusWidgetState();
}

class _ChangeStatusWidgetState extends State<ChangeStatusWidget> {
  bool isSelected = false;
  @override
  void initState() {
     isSelected = widget.value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Switch(
          activeColor: primaryColor,
          value: isSelected,
          onChanged: (value) {
            setState(() {
              isSelected = value;
            });
            widget.onChanged!(value);
          });
  }
}
