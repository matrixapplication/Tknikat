import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/show_profile.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/model/user_model/user_model.dart';

Widget buildUserInfo(
  context,
  UserModel user, {
  Widget? subtitle,
  EdgeInsets? padding,
}) {
  String skills = "";
  user.skills?.map((s) => s.name).toList().forEach((element) {
    skills = skills + " " + element.toString();
  });
  if (user.isAdmin) return SizedBox();
  return InkWell(
    onTap: () {
      // Navigator.of(context).push(PageTransition(
      //     duration: Duration(milliseconds: 700),
      //     type: PageTransitionType.fade,
      //     child: VendorProfilePage(user)));
      showProfile(user.id, context);
    },
    child: Container(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 21,
            vertical: 0,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            // height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 0.3, color: primaryColor)),
            child: Center(
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: (user.avatar == null || user.avatar == ""
                      ? AssetImage("assets/images/profile.png")
                      : CachedNetworkImageProvider(getImagePath(user.avatar!))
                          as ImageProvider)),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Container(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    (user.firstName??'') + " " + (user.lastName??''),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  if(subtitle!=null || skills.isNotEmpty )
                  Container(
                    child: subtitle ??
                        BlackRegularText(label: skills)

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
