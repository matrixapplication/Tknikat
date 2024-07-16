import 'package:flutter/material.dart';

class baseInfoText extends StatelessWidget {
  IconData icon;
  String title;
  String data;
  baseInfoText({
    required this.icon,
    required this.title,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        SizedBox(width: 8),
        Text(title),
        SizedBox(width: 8),
        Text(
          data,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
