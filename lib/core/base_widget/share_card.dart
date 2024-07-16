import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/events_content_page/events_content_page.dart';
import 'package:taknikat/Ui/share_content_page/share_content_page.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../image_place_holder.dart';

class ShareItem extends StatelessWidget {
  final ShareModel share;
  // final bool isMine;
  // final VoidCallback? onDeleted;

  ShareItem(this.share);

  @override
  Widget build(BuildContext context) {
    final event = share.event!;
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: ShareContentPage(
                share: share,
                event: event,
              )));
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: CachedNetworkImage(
                          placeholderFadeInDuration: Duration(seconds: 1),
                          errorWidget: (context, url, error) => Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: othercolor,
                                borderRadius: BorderRadius.circular(15)),
                            child: FittedBox(
                              child: Icon(Icons.error),
                            ),
                          ),
                          placeholder: (_, __) => ImagePlaceholder.rectangular(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          imageUrl: getImagePath(share.image),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill, image: imageProvider),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageTransition(
                              duration: Duration(milliseconds: 700),
                              type: PageTransitionType.fade,
                              child: EventContentPage(event)));
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black12,
                                      Colors.black38,
                                      Colors.black45,
                                      Colors.black54,
                                      Colors.black87,
                                    ],
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topCenter),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                )),
                            padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundImage: CachedNetworkImageProvider(
                                    getImagePath(event.image!),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    event.name!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Icon(
                        Icons.add_location_outlined,
                        size: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Container(
                      child: Text(
                        share.user.city?.name ?? "",
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        softWrap: false,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: Row(
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            size: 12,
                            color: primaryColor,
                          ),
                          SizedBox(width: 4),
                          Text(
                            share.views.toString(),
                            style: TextStyle(color: primaryColor, fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  alignment: Alignment.centerRight,
                  child: Text(
                    share.description ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
