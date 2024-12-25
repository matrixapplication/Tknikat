import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_localizations.dart';

class CustomPopupMenu extends StatelessWidget {
  final void Function(int) onSelected;
  CustomPopupMenu({required this.onSelected});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.more_vert, color: Colors.white),
      color: Colors.lightBlue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onSelected:onSelected,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.edit_note_rounded, color: Colors.blue),
              SizedBox(width: 10),
              Text('${AppLocalizations.of(context).translate("edit")}',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Tajawal'))

            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.delete_forever_outlined, color: Colors.red),
              SizedBox(width: 10),
              Text('${AppLocalizations.of(context).translate("Delete")}',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Tajawal'))
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              Icon(Icons.public, color: Colors.green),
              SizedBox(width: 10),
              Text('${AppLocalizations.of(context).translate("Status")}',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Tajawal'))

            ],
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: Row(
            children: [
              Icon(Icons.share, color: Colors.black87),
              SizedBox(width: 10),
              Text('${AppLocalizations.of(context).translate("Share")}',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: 'Tajawal'))
            ],
          ),
        ),
      ],
    );
  }
}