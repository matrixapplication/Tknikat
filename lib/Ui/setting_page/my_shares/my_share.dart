import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/create_share_page/create_share_page.dart';
import 'package:taknikat/Ui/share_content_page/share_content_page.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/model/share_model/share_model.dart';

class MyShareItem extends StatelessWidget {
  final ShareModel share;
  final VoidCallback? onDeleted;
  final ShareStatus status;

  MyShareItem(this.share, this.status, {this.onDeleted});

  String get name {
    switch (status) {
      case ShareStatus.approved:
        return 'موافقة';
      case ShareStatus.unapproved:
        return 'مرفوضة';
      case ShareStatus.pending:
        return 'انتظار موافقة';
      default:
        return '';
    }
  }

  MaterialColor? get color {
    switch (status) {
      case ShareStatus.approved:
        return Colors.green;
      case ShareStatus.unapproved:
        return Colors.red;
      case ShareStatus.pending:
        return Colors.amber;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final event = share.event!;
    return GestureDetector(
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
          Container(
            width: double.infinity,
            height: 230,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: CachedNetworkImage(
              placeholderFadeInDuration: Duration(seconds: 1),
              errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: othercolor, borderRadius: BorderRadius.circular(5)),
                child: FittedBox(
                  child: Icon(Icons.error),
                ),
              ),
              placeholder: (_, __) => ImagePlaceholder.rectangular(
                borderRadius: BorderRadius.circular(5.0),
              ),
              imageUrl: getImagePath(share.image),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: imageProvider),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.grey.withOpacity(0.6),
                Colors.grey.withOpacity(0.3),
                Colors.transparent
              ],
            )),
          )),
          Positioned.directional(
            start: 10,
            textDirection: Directionality.of(context),
            top: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      customHeader: Container(
                        child: Icon(
                          Icons.delete_forever_outlined,
                          size: 60,
                          color: primaryColor,
                        ),
                      ),
                      btnCancelText:
                          AppLocalizations.of(context).translate("Cancel"),
                      btnOkText: AppLocalizations.of(context).translate("Ok"),
                      btnOkColor: primaryColor,
                      dialogType: DialogType.warning,
                      animType: AnimType.bottomSlide,
                      title: AppLocalizations.of(context)
                          .translate("Delete Action"),
                      desc: AppLocalizations.of(context).translate(
                          "are you sure you want to delete this share"),
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        onDeleted?.call();
                      },
                    ).show();
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: FittedBox(
                        child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            )),
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageTransition(
                        duration: Duration(milliseconds: 700),
                        type: PageTransitionType.fade,
                        child: CreateEditSharePage(
                          shareModel: share,
                          event: null,
                        )));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.edit_outlined,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.directional(
            end: 10,
            textDirection: Directionality.of(context),
            top: 10,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: color),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 14.5),
              ),
            ),
          ),
          Positioned.directional(
              start: 10,
              textDirection: Directionality.of(context),
              bottom: 10,
              child: Container(
                width: 300,
                child: Text(
                  'فعالية ${event.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
