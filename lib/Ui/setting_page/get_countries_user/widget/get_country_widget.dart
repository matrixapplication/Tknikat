import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_localizations.dart';
import '../../../../core/base_widget/base_toast.dart';
import '../../../../core/constent.dart';
import '../../../../model/user_country/user_country_model.dart';
import '../../../../model/user_model/user_model.dart';
import '../../../vendor_page/widget/textInfo.dart';

class CustomUserCountry extends StatelessWidget {
  final UserCountryModelData userModel;
  const CustomUserCountry({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 2),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.blue.shade300,blurRadius: 3)]
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: CircleAvatar(
                          radius: 60,
                          backgroundImage: (userModel.avatar == null
                              ? AssetImage("assets/images/profile.png")
                              : CachedNetworkImageProvider(getImagePath(
                              userModel.avatar!))) as ImageProvider),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${userModel.firstName??''} ${userModel.lastName??''}',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 7),
                      // userModel.skills!=null ?
                      // Row(
                      //   children: [
                      //     SvgPicture.asset(
                      //       "assets/images/skills.svg",
                      //     ),
                      //     SizedBox(width: 8),
                      //     Text(AppLocalizations.of(context)
                      //         .translate("Skills")),
                      //     SizedBox(width: 8),
                      //     Expanded(
                      //       child: Wrap(
                      //         children: [
                      //           ...userModel.skills!.map((skill) => Text(
                      //             '${skill.name!}، ',
                      //             style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           )),
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // ):SizedBox.shrink(),
                      baseInfoText(
                        icon: Icons.email_outlined,
                        title:'',
                        data:userModel.email?? '',
                      ),
                      SizedBox(height: 7),
                      baseInfoText(
                        icon: Icons.language,
                        title: '',
                        data: userModel.city?.country?.name?? '',
                      ),
                      SizedBox(height: 7),
                      if (userModel.city != null)
                        baseInfoText(
                            icon: Icons.location_on_outlined,
                            title: '',
                            data: userModel.city?.name ?? ''),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          userModel.whatsapp != null&&userModel.whatsapp!.isNotEmpty
                              ? IconButton(
                            icon: SvgPicture.asset(
                                "assets/images/whatsapp.svg",
                                color:
                                Theme.of(context).primaryColor),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                  userModel.whatsapp.toString()));
                              showToast(AppLocalizations.of(context)
                                  .translate(
                                  "Whatsapp Link copied") +
                                  "\n" +
                                  userModel.whatsapp.toString());
                            },
                          )
                              : Container(),
                          userModel.facebook != null &&userModel.facebook!.isNotEmpty
                              ? IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/facebook.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                  userModel.facebook.toString()));
                              showToast(AppLocalizations.of(context)
                                  .translate(
                                  "Facebook Link copied") +
                                  "\n" +
                                  userModel.facebook.toString());
                            },
                          )
                              : Container(),
                          userModel.instagram != null&&userModel.instagram!.isNotEmpty
                              ? IconButton(
                            icon: SvgPicture.asset(
                                "assets/images/instagram.svg",
                                color:
                                Theme.of(context).primaryColor),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                  userModel.instagram.toString()));
                              showToast(AppLocalizations.of(context)
                                  .translate(
                                  "Instagram Link copied") +
                                  "\n" +
                                  userModel.instagram.toString());
                            },
                          )
                              : Container(),
                          userModel.twitter != null&&userModel.twitter!.isNotEmpty
                              ? IconButton(
                            icon: SvgPicture.asset(
                                "assets/images/twitter.svg",
                                color:
                                Theme.of(context).primaryColor),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text: userModel.twitter.toString()));
                              showToast(AppLocalizations.of(context)
                                  .translate(
                                  "Twitter Link copied") +
                                  "\n" +
                                  userModel.twitter.toString());
                            },
                          )
                              : Container(),
                          userModel.linkedin != null&&userModel.linkedin!.isNotEmpty
                              ? IconButton(
                            icon: SvgPicture.asset(
                                "assets/images/linkedin.svg",
                                color:
                                Theme.of(context).primaryColor),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                  userModel.linkedin.toString()));
                              showToast(AppLocalizations.of(context)
                                  .translate(
                                  "LinkedIn Link copied") +
                                  "\n" +
                                  userModel.linkedin.toString());
                            },
                          )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
