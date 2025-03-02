import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:taknikat/Ui/report_page/widgets/reportButton.dart';
import 'package:taknikat/Ui/setting_page/my_events/widgets/event_user_info.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../../Ui/report_page/report_class.dart';
import '../../Ui/setting_page/my_posts/pop_up_post_list.dart';
import '../../Ui/setting_page/my_posts/post_user_info.dart';
import '../app_localizations.dart';
import '../assets_image/app_images.dart';
import '../constent.dart';
import '../image_place_holder.dart';
import 'image_viewer.dart';

class ShareContentCard extends StatelessWidget {
  final bool? withIconComment;
  const ShareContentCard({
    Key? key,
    required this.share,
    this.event,
    this.withIconComment=true,

    this.onTap,
  }) : super(key: key);

  final ShareModel share;
  final EventModel? event;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    print('asdasdd ${share.createdAt??'nnn'}');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: 6.paddingVert+16.paddingHorizontal,
        padding: 12.paddingAll,
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow:  [
              BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: Offset(2,5)
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (share.user.id != null)
                    Expanded(
                      child: PostUserInfo(context, share.user,
                          postCreatedDated: share.createdAt??''),
                    ),

                    IconWidget(
                      onTap: (){},
                      widget: PopupMenuButton(
                        icon: SvgPicture.asset(AppImages.pop),
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
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: ReadMoreText(share.description??'',
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
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: imageProvider),
                    ),
                  ),
                ),
              ),
            ),
            8.height,
            if(withIconComment!=false)
            Row(
              children: [
                SvgPicture.asset(AppImages.comment),
                5.width,
                BlackRegularText(label: share.reviewsCount?.toString()??'0')
              ],
            ),

          ],
        ),
      ),
    );
  }
}
