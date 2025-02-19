



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/Ui/auth_screen/widget/login_required.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_event.dart';
import 'package:taknikat/Ui/setting_page/my_events/my_event_list.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/my_posts_list.dart';
import 'package:taknikat/Ui/setting_page/my_posts/write_post.dart';
import 'package:taknikat/Ui/setting_page/my_products/bloc/my_products_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_products/bloc/my_products_event.dart';
import 'package:taknikat/Ui/setting_page/my_products/my_products_list.dart';
import 'package:taknikat/Ui/setting_page/my_projects/bloc/my_projects_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_projects/bloc/my_projects_event.dart';
import 'package:taknikat/Ui/setting_page/my_projects/my_projects_list.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_event.dart';
import 'package:taknikat/Ui/setting_page/my_services/my_services_list.dart';
import 'package:taknikat/Ui/setting_page/personal_info.dart';
import 'package:taknikat/Ui/setting_page/widget/my_category_album.dart';
import 'package:taknikat/Ui/setting_page/widget/my_events.dart';
import 'package:taknikat/Ui/setting_page/widget/my_products.dart';
import 'package:taknikat/Ui/setting_page/widget/my_videos.dart';
import 'package:taknikat/Ui/setting_page/widget/profile_item_widget.dart';
import 'package:taknikat/Ui/setting_page/widget/services.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/injectoin.dart';
import '../../core/app_localizations.dart';
import '../../core/base_widget/product_item.dart';
import '../../core/base_widget/service_item.dart';
import '../../core/constent.dart';
import '../../core/style/custom_loader.dart';
import '../../core/widgets/icon_widget.dart';
import '../setting/menu_screen.dart';
import '../setting/categories_screen.dart';
import '../setting/setting_screen.dart';
import 'bloc/settings_bloc.dart';
import 'bloc/settings_event.dart';
import 'bloc/settings_state.dart';
import 'my_products/bloc/my_products_state.dart';
import 'my_products/my_products_page.dart';
import 'my_projects/my_projects_page.dart';
import 'my_services/bloc/my_services_state.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _bloc = sl<SettingsBloc>();
  final _postsBloc = sl<PostsBloc>();
  final ScrollController _listController = ScrollController();

  initState() {
    super.initState();
    _bloc.add(InitSettings());
    _listController.addListener(() {
      if (_listController.position.atEdge) {
        if (_listController.position.pixels ==
            _listController.position.maxScrollExtent) {
          if (_postsBloc.state.initialized) {
            _postsBloc.add(GetNextMyPosts());
          }
        }
      }
    });
    _postsBloc.add(InitMyPosts());
    sl<MyEventsBloc>().add(GetMyEvents((b) => b..page = 1));
    // sl<MyEventsBloc>().add(InitMyEvents((b) => b..page = 1));

    // sl<SettingsBloc>().add(InitSettings());

  }
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder(
        bloc: _bloc,
        builder: (context, SettingsState state) {
          // showToast(state.error);
          // if ( !state.initialized) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          return Container(
            color:  Color(0xffFCFCFC),
              height: sizeAware.height,
              child: appAuthState
                  ? RefreshIndicator(
                      onRefresh: () async {
                        _bloc.add(GetUserData());
                        _postsBloc.add(InitMyPosts());
                        // sl<MyEventsBloc>().add(GetMyEvents((b) => b..page = 1));
                        sl<MyProductsBloc>().add(GetMyProducts());
                        sl<MyServicesBloc>().add(GetMyServices());
                        sl<MyProjectsBloc>().add(GetMyProjects());
                      },
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        controller: _listController,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  40.height,
                                  PersonalInfoPage(),
                                  12.height,
                                  IconWidget(
                                   widget:
                                   Row(
                                     children: [
                                       ProfileItemWidget(
                                         onTap: (){
                                           setState(() {
                                             currentIndex=0;
                                           });
                                         },
                                         image: AppImages.pro1,
                                         selected: currentIndex==0,
                                       ),
                                       ProfileItemWidget(
                                         onTap: (){
                                           setState(() {
                                             currentIndex=1;
                                           });
                                         },
                                         image: AppImages.pro2,
                                         selected: currentIndex==1,
                                       ),
                                       ProfileItemWidget(
                                         onTap: (){
                                           setState(() {
                                             currentIndex=2;
                                           });
                                         },
                                         image: AppImages.pro3,
                                         selected: currentIndex==2,
                                       ),
                                       ProfileItemWidget(
                                         onTap: (){
                                           setState(() {
                                             currentIndex=3;
                                           });
                                         },
                                         image: AppImages.pro4,
                                         selected: currentIndex==3,
                                       ),
                                       ProfileItemWidget(
                                         onTap: (){
                                           setState(() {
                                             currentIndex=4;
                                           });
                                         },
                                         image: AppImages.pro5,
                                         selected: currentIndex==4,
                                       ),
                                       ProfileItemWidget(
                                         onTap: (){
                                           setState(() {
                                             currentIndex=5;
                                           });
                                         },
                                         image: AppImages.pro6,
                                         selected: currentIndex==5,
                                       ),
                                     ],
                                   ),
                                 ),
                                  5.height,
                                  if(currentIndex ==0)
                                    MyPostsList(),
                                  if(currentIndex==1)
                                    MyProducts(),
                                  if(currentIndex==2)
                                    ServicesWidget(),
                                  if(currentIndex==3)
                                    MyVideoWidget(),
                                  if(currentIndex==4)
                                    MyEvents(),
                                  if(currentIndex==5)
                                    MyCategoryAlbumWidget(),
                                  SizedBox(height: 50)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : LogInRequiredWidget());
        });

  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }
}
