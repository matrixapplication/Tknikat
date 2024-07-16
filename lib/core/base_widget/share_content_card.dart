import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:taknikat/Ui/report_page/widgets/reportButton.dart';
import 'package:taknikat/Ui/setting_page/my_events/widgets/event_user_info.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../../Ui/report_page/report_class.dart';
import '../app_localizations.dart';
import '../constent.dart';
import '../image_place_holder.dart';
import 'image_viewer.dart';

class ShareContentCard extends StatelessWidget {
  const ShareContentCard({
    Key? key,
    required this.share,
    this.event,
    this.onTap,
  }) : super(key: key);

  final ShareModel share;
  final EventModel? event;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // buildUserInfo(context, share.user,
            //     subtitle: Row(
            //       children: [
            //         Icon(
            //           Icons.location_on_outlined,
            //           size: 16,
            //         ),
            //         Text(share.user.city?.name ?? ""),
            //         Spacer(),
            //         Container(
            //           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.grey.withOpacity(0.2)),
            //           child: Row(
            //             children: [
            //               Icon(
            //                 Icons.visibility_outlined,
            //                 size: 16,
            //                 color: primaryColor,
            //               ),
            //               SizedBox(width: 4),
            //               Text(
            //                 share.views.toString(),
            //                 style: TextStyle(color: primaryColor),
            //               )
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     padding: EdgeInsets.zero),
            // Text(
            //   share.description ?? '',
            //   maxLines: 4,
            //   textAlign: TextAlign.start,
            //   overflow: TextOverflow.ellipsis,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    if (share.user.id != null)
                      Expanded(
                        child: eventUserInfo(
                          context,
                          share.user,
                        ),
                      ),
                    PopupMenuButton(
                      icon: SvgPicture.asset(
                        "assets/images/dots.svg",
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              report(
                                context: context,
                                modelId: share.id.toString(),
                                modelType: ReportType.ShareUser,
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.report_problem_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    AppLocalizations.of(context).translate("Report post")
                                    )
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: ReadMoreText(
                    share.description!,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14, height: 1.4),
                    colorClickableText: Colors.blue,
                    trimCollapsedText: AppLocalizations.of(context).translate("see more"),
                    trimExpandedText:AppLocalizations.of(context).translate("see less2"),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 225,
              child: CachedNetworkImage(
                placeholderFadeInDuration: Duration(seconds: 1),
                errorWidget: (context, url, error) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: othercolor,
                  ),
                  child: FittedBox(
                    child: Icon(Icons.error),
                  ),
                ),
                placeholder: (_, __) => ImagePlaceholder.rectangular(),
                imageUrl: getImagePath(share.image),
                imageBuilder: (context, imageProvider) => GestureDetector(
                  onTap: onTap == null
                      ? () {
                          openBottomSheet(context, imageProvider);
                        }
                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: imageProvider),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
