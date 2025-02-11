import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_events/add_event_screen.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_state.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/post_item.dart';
import 'package:taknikat/Ui/setting_page/my_posts/write_post.dart';
import 'package:taknikat/Ui/setting_page/my_products/add_product_screen.dart';
import 'package:taknikat/Ui/setting_page/my_projects/add_project_screen.dart';
import 'package:taknikat/Ui/setting_page/my_services/add_service_screen.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/login_dialog.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/custom_logo.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/app_localizations.dart';
import '../../../core/base_widget/dialogcustom.dart';
import '../../../core/utils/globle.dart';
import '../../AllNotification_page/allNotification_page.dart';
import '../../AllNotification_page/bloc/notification_bloc.dart';
import '../../AllNotification_page/bloc/notification_state.dart';
import '../bloc/settings_bloc.dart';

class WallPage extends StatefulWidget {
  WallPage({Key? key,}) : super(key: key);

  @override
  State<WallPage> createState() => _WallPageState();
}

class _WallPageState extends State<WallPage> {
  final _bloc = sl<PostsBloc>();
  final ScrollController _listController = ScrollController();
  double currentPosition = 0.0;

  @override
  void initState() {
    super.initState();

    _listController.addListener(() {
      if (_listController.position.atEdge) {
        if (_listController.position.pixels == _listController.position.maxScrollExtent) {
           currentPosition = _listController.position.pixels;
          _bloc.add(GetNextPosts());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsBloc, PostsState>(
      bloc: _bloc,
      listener: (context, state) {
        if (!state.isLoading) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   _listController.jumpTo(currentPosition);
          // });عرض المشاركات
        }
      },
      builder: (BuildContext context, PostsState state) {
        return
         SingleChildScrollView(
           controller: _listController,
           child:  Column(
             children: [
               Stack(
                 children: [
                   SvgPicture.asset(AppImages.header,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
                   Positioned(
                     bottom: 30.h,
                     right: 10.w,
                     left: 10.w,
                     child: Row(
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         CustomLogo(height: 48.h,width:84.w ,),
                       Row(
                         children: [
                           if (appAuthState)
                           InkWell(
                               onTap: () {
                                 if (appAuthState)
                                   Navigator.of(context).push(PageTransition(
                                       duration: Duration(milliseconds: 500),
                                       type: PageTransitionType.fade,
                                       child: AllNotificationPage()));
                                 else
                                   showLogin(context);
                               },
                               child:  FittedBox(
                                 child: Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     Container(
                                       padding: EdgeInsets.all(18),
                                       child: SvgPicture.asset(AppImages.notification
                                         // "assets/images/notification.svg",
                                       ),
                                     ),
                                     BlocBuilder(
                                         bloc: sl<NotificationBloc>(),
                                         builder: (BuildContext context,
                                             NotificationState state) {
                                           return state.unreadenNotificationCount !=
                                               0
                                               ? Positioned(
                                             top: 10,
                                             right: 6,
                                             child: new Center(
                                               child: CircleAvatar(
                                                 radius:
                                                 sizeAware.width * 0.01,
                                                 backgroundColor: Colors.red,
                                               ),
                                             ),
                                           )
                                               : Container();
                                         }),
                                   ],
                                 ),
                               ),),
                           InkWell(
                               onTap: () {
                                 kScaffoldKey.currentState!.openDrawer();
                               },
                               child: SvgPicture.asset(
                                 AppImages.drawer,
                               )),
                         ],
                       ),

                       ],
                     ),),

                 ],
               ),
               Container(
                 child: RefreshIndicator(
                 onRefresh: () async {
                   _bloc.add(InitPosts());
                 },
                 child: Padding(
                   padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.w),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 0.0),
                         child: WritePostWidget(),
                       ),
                       // Container(
                       //   height: 55,
                       //   padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                       //   color: Color(0xFFC9CCD1),
                       //   child:
                       //   ListView(
                       //     physics: ClampingScrollPhysics(),
                       //     scrollDirection: Axis.horizontal,
                       //     children: [
                       //       AddNewButton(
                       //         onTap: () {
                       //           Navigator.of(context).push(PageTransition(
                       //             duration: Duration(milliseconds: 700),
                       //             type: PageTransitionType.fade,
                       //             child: AddEventScreen(),
                       //           ));
                       //         },
                       //         title: AppLocalizations.of(context)
                       //             .translate("Add_event"),
                       //       ),
                       //       AddNewButton(
                       //         onTap: () => Navigator.of(context).push(
                       //           PageTransition(
                       //             duration: Duration(milliseconds: 700),
                       //             type: PageTransitionType.fade,
                       //             child: AddProductScreen(),
                       //           ),
                       //         ),
                       //         title: AppLocalizations.of(context)
                       //             .translate("Add_product"),
                       //       ),
                       //       AddNewButton(
                       //         onTap: () => Navigator.of(context).push(
                       //           PageTransition(
                       //             duration: Duration(milliseconds: 700),
                       //             type: PageTransitionType.fade,
                       //             child: AddServiceScreen(),
                       //           ),
                       //         ),
                       //         title: AppLocalizations.of(context)
                       //             .translate("Add_service"),
                       //       ),
                       //       AddNewButton(
                       //         onTap: () => Navigator.of(context).push(
                       //           PageTransition(
                       //             duration: Duration(milliseconds: 700),
                       //             type: PageTransitionType.fade,
                       //             child: AddProjectScreen(),
                       //           ),
                       //         ),
                       //         title: AppLocalizations.of(context)
                       //             .translate("Add_work"),
                       //       ),
                       //     ],
                       //   ),
                       // ),
                       Container(
                         child: ListView.builder(
                           padding: 10.paddingTop,
                           physics: ClampingScrollPhysics(),
                           shrinkWrap: true,
                           // controller: _listController,
                           itemCount: state.posts.length + (state.isLoading ? 1 : 0),
                           itemBuilder: (context, index) {
                             if (index == state.posts.length) {
                               return Center(
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: loader(context: context),
                                 ),
                               );
                             }
                             return PostItem(
                               index: index,
                               fromMyPostsList: false,
                             );
                           },
                         ),
                       ),
                     ],
                   ),
                 ),
               ),)
             ],
           ),
         );
      },
    );
  }
}

class AddNewButton extends StatelessWidget {
  const AddNewButton({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await sl<PrefsHelper>().getIsLogin()) {
          onTap();
        } else {
          showLoginFirstDialog(context);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/images/addButton.svg",
              width: 24,
              height: 24,
              color: primaryColor,
            ),
            SizedBox(width: 5),
            Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
