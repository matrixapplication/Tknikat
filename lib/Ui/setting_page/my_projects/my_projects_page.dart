import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_projects/add_project_screen.dart';
import 'package:taknikat/Ui/setting_page/my_projects/bloc/my_projects_state.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/project_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../../core/app_localizations.dart';
import '../../../injectoin.dart';
import 'bloc/my_projects_bloc.dart';
import 'bloc/my_projects_event.dart';

class MyProjectsPage extends StatefulWidget {
  @override
  _MyProjectsPageState createState() => _MyProjectsPageState();
}

class _MyProjectsPageState extends State<MyProjectsPage> {
  @override
  void initState() {
    sl<MyProjectsBloc>().add(GetMyProjects());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: baseText(AppLocalizations.of(context)
            .translate("Business exhibition"), color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: AddProjectScreen()));
        },
        backgroundColor: primaryColor,
        mini: true,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              color: primaryColor,
              child: Column(
                children: [
                  Container(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder(
                bloc: sl<MyProjectsBloc>(),
                builder: (BuildContext context, MyProjectsState state) {
                  return Stack(
                    children: [
                      RefreshIndicator(
                        color: primaryColor,
                        onRefresh: () async {
                          sl<MyProjectsBloc>().add(GetMyProjects());
                        },
                        child: Container(
                          height: sizeAware.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                state.myProjects != null &&
                                        state.myProjects.isNotEmpty
                                    ?
                                Container(
                                        margin: EdgeInsets.all(5),
                                        child: GridView.count(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.630,
                                            crossAxisSpacing: 10.0,
                                            children: List.generate(
                                                state.myProjects.length,
                                                (index) {
                                              return ProjectItem(
                                                state.myProjects[index],
                                                isMine: true,
                                              );
                                            })))
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                      ),
                      state.isLoading
                          ? Center(child: loader(context: context))
                          : state.myProjects != null && state.myProjects.isEmpty
                              ?
                      Container(
                                  width: sizeAware.width,
                                  height: sizeAware.height * 0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: SvgPicture.asset(
                                          "assets/images/empty_content.svg",
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .translate("not_found_work"),
                                          style: TextStyle(),
                                        ),
                                      )
                                    ],
                                  ))
                              : Container()
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
