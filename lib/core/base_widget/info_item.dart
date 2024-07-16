import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final Widget icon;
  final String label;
  const InfoWidget({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.0),
        icon,
        SizedBox(height: 2.0),
        Text(
          label,
          style: TextStyle(fontSize: 12.0),
        )
      ],
    );
  }
}
