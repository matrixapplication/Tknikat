import 'package:flutter/material.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';



class ModalSheet {
  static Future<dynamic>  showModalSheet({required BuildContext context, required Widget screen}) async {
   return  showModalBottomSheet(
     isScrollControlled: true,
      context: context,
      // barrierColor: Theme.of(context).primaryColor.withOpacity(0.3),
      // expand: false,
        backgroundColor: Colors.transparent,
      // duration: const Duration(milliseconds: 700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      builder: (context) =>
          FractionallySizedBox(
            heightFactor: 0.75,
            child:  SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 40.h, 0,  MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  decoration:

                  const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
                  child: screen,
                ),
              ),
            ),
          )
    );
  }
}
