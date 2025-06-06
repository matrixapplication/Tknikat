import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taknikat/Ui/report_page/report_class.dart';
import 'package:taknikat/Ui/report_page/widgets/commentReportButton.dart';
import 'package:taknikat/Ui/setting_page/widget/personal_avatar.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/dialogcustom.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/show_profile.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/product_model/comment_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'comment.dart';
import 'comment.dart';

typedef OnReply = void Function([
  String? comment,
  int? repliedUserId,
]);
typedef OnEditComment = Future<bool> Function(CommentModel comment);
typedef OnReplyTap = Future Function(CommentModel comment);
class CommentWidget extends StatelessWidget {
   CommentWidget(
      this.comment, {
        Key? key,
        required this.onReply,
        this.repliedUserId,
        required this.onReplyTap,
         required this.onEdit, this.margin,
      }) : super(key: key);
   final double? margin;
  final CommentModel comment;
  final OnReply onReply;
  final int? repliedUserId;
  final OnReplyTap onReplyTap; // Added onReplyTap
  final OnEditComment onEdit; // Added onReplyTap
  bool isShow=false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context,setState){
      return  Column(
        children: [
          Container(
            margin:3.paddingAll+(margin?.paddingStart??0.paddingAll),
            padding: 10.paddingVert+10.paddingHorizontal,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      spreadRadius: 4,
                      offset: Offset(2,5)
                  )
                ]
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showProfile(comment.user!.id, context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: CachedNetworkImage(
                          placeholderFadeInDuration: Duration(seconds: 1),
                          errorWidget: (context, url, error) => CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/images/profile.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          placeholder: (_, __) => ImagePlaceholder.circular(),
                          imageUrl: getImagePath(comment.user?.avatar??''),
                          imageBuilder: (context, imageProvider) => CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        5.height,
                        BlackMediumText(label: comment.user?.firstName??'' + " " + comment.user!.lastName!,fontSize: 16,),
                        BlackRegularText(label:timeago.format(
                          DateTime.parse(comment.dateCreated!),
                          locale: AppLocalizations.of(context).locale.languageCode,
                        ) ,fontSize: 13,)

                      ],
                    ))
                  ],
                ),
                5.height,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: comment.reviewContent ?? "",
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          color: Colors.black,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                      if (comment.repliedUser != null)
                        TextSpan(
                          text: getNameWithTag(comment.repliedUser!),
                          style: DefaultTextStyle.of(context).style.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await showProfile(
                                  comment.repliedUser!.id!, context);
                            },
                        ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()async{
                        await onReplyTap(comment);
                      }, // Notify parent on reply tap
                      child: Text(
                        AppLocalizations.of(context).translate('reply'),
                        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 12.0, color: Color(0xFF898E92)),
                      ),
                    ),
                    if(appUser!=null&&comment.user!.id == appUser!.id)
                      Row(
                        children: [
                          8.width,
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Color(0xFF898E92),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          8.width,
                          InkWell(
                            onTap: ()async{
                              bool result = await onEdit(comment);
                              if (result) {
                                // Handle true result
                                print('Edit successful');
                              } else {
                                // Handle false result
                                print('Edit failed');
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context).translate('edit'),
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontSize: 12.0, color: Color(0xFF898E92)),
                            ),
                          ),

                        ],
                      ),
                    if(comment.replies !=null && comment.replies!.length!=0)
                      Row(
                        children: [
                          8.width,
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Color(0xFF898E92),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          8.width,
                          InkWell(
                            onTap: (){

                              if(isShow==true){
                                setState((){
                                  isShow=false;
                                });
                              }else{
                                setState((){
                                  isShow=true;
                                });
                              }
                            },
                            child:  Text(
                              '${isShow==true? AppLocalizations.of(context).translate('hide'):AppLocalizations.of(context).translate('show')} ${comment.replies?.length} ${AppLocalizations.of(context).translate('reply')}',
                              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 12.0, color: Color(0xFF898E92)),
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ],
            ),
          ),

          if (isShow==true &&comment.replies != null)
            ...List.generate(
              comment.replies!.length,
                  (index) => CommentWidget(
                  comment.replies![index],
                  onReply: onReply,
                  margin:20,
                  repliedUserId: comment.replies![index].user!.id,
                  onReplyTap: onReplyTap, onEdit:onEdit
              ),
            ),

        ],
      );
    });
  }
}

getNameWithTag(UserModel user) => ' ' + user.firstName! + ' ' + user.lastName!;
