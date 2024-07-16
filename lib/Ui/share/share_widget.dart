import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taknikat/core/constent.dart';

class ShareWidget extends StatelessWidget {
  final String path;

  const ShareWidget({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(url + path);
    return IconButton(
        onPressed: () {
          Share.share(url + path);
        },
        icon: Icon(Icons.share));
  }
}
