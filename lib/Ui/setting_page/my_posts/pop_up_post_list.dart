import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/report_page/report_class.dart';
import 'package:taknikat/Ui/report_page/widgets/reportButton.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_state.dart';
import 'package:taknikat/Ui/setting_page/my_posts/update_post_screen.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';

class PopUpPostMenu extends StatelessWidget {
  final bool popUpWhenRemove;
  final _bloc = sl<PostsBloc>();
  final PostModel post;

  PopUpPostMenu({Key? key, required this.post, this.popUpWhenRemove = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsBloc, PostsState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.removeSuccess) {
          showToast('تم حذف المنشور بنجاح');
        }
      },
      builder: (context, state) {
        return PopupMenuButton(
          icon: Container(
            height: 44,
            width: 44,
            padding: 8.paddingHorizontal+6.paddingVert,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 15,
                      offset: Offset(2,6)
                  )
                ],
                borderRadius: BorderRadius.circular(12)
            ),
            child:

            SvgPicture.asset(
                AppImages.pop
              // "assets/images/dots.svg",
            ),
          ),
          itemBuilder: (context) {
            return [
              if (post.isMyPost)
                PopupMenuItem(
                  onTap: () {
                    Future.delayed(
                      Duration(seconds: 0),
                      () => AwesomeDialog(
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
                            "are you sure you want to delete this post"),
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          _bloc.add(RemovePost(
                            (b) => b..post = post.toBuilder(),
                          ));
                        },
                      ).show(),
                    );
                  },
                  child:
                  Row(
                    children: [
                      Icon(Icons.delete_outline_rounded),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("حذف المنشور")
                    ],
                  ),
                ),
              if (post.isMyPost)
                PopupMenuItem(
                  onTap: () {
                    Future.delayed(
                      Duration(seconds: 0),
                      () {
                        Navigator.of(context).push(PageTransition(
                            duration: Duration(milliseconds: 400),
                            type: PageTransitionType.fade,
                            child: UpdatePostScreen(
                              postModel: post,
                            )));
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.pencil),
                      SizedBox(
                        width: 10,
                      ),
                      Text("تعديل المنشور")
                    ],
                  ),
                ),
              if (!post.isMyPost)
                PopupMenuItem(
                  onTap: () {
                    report(
                      context: context,
                      modelId: post.id!.toString(),
                      modelType: ReportType.Post,
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.report_problem_outlined),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("الإبلاغ عن المنشور")
                    ],
                  ),
                ),
            ];
          },
        );
      },
    );
  }
}
