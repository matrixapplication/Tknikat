import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/show_profile.dart';
import 'package:taknikat/model/user_model/user_model.dart';
// import 'package:timeago/timeago.dart' as timeago;

Widget eventUserInfo(
  context,
  UserModel user, {
  // required String eventCreatedDated,
  Widget? subtitle,
  EdgeInsets? padding,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            // Navigator.of(context).push(PageTransition(
            //     duration: Duration(milliseconds: 700),
            //     type: PageTransitionType.fade,
            //     child: VendorProfilePage(user)));
            showProfile(user.id, context);
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 0.3, color: primaryColor)),
            child: Center(
              child: CircleAvatar(
                  radius: 60,
                  backgroundImage: (user.avatar == null || user.avatar == ""
                      ? AssetImage("assets/images/profile.png")
                      : CachedNetworkImageProvider(getImagePath(user.avatar!))
                          as ImageProvider)),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.firstName! + " " + user.lastName!,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(user.city?.name ?? ""),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Color(0xFF898E92),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  // Text(
                  //     timeago.format(
                  //       DateTime.parse(
                  //         eventCreatedDated,
                  //       ),
                  //       locale:
                  //           AppLocalizations.of(context).locale.languageCode,
                  //     ),
                  //     style: TextStyle(fontSize: 14, color: Color(0xFF898E92))),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
