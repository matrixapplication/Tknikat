import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/injectoin.dart';

import '../../core/app_localizations.dart';
import 'bloc/settings_bloc.dart';
import 'bloc/settings_event.dart';
import 'bloc/settings_state.dart';

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
    sl<SettingsBloc>().add(InitSettings());

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, SettingsState state) {
          showToast(state.error);
          if (!state.initialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
              height: sizeAware.height,
              child: appAuthState
                  ? RefreshIndicator(
                      onRefresh: () async {
                        _postsBloc.add(InitMyPosts());
                        sl<MyEventsBloc>().add(GetMyEvents());
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
                                  PersonalInfoPage(),
                                  MyProductList(),
                                  MyServiceList(),
                                  MyProjectsList(),
                                  MyEventList(),
                                  Text(
                                    AppLocalizations.of(context)
                                        .translate("Publications"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  WritePostWidget(),
                                ],
                              ),
                            ),
                            MyPostsList(),
                            SizedBox(height: 20)
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
