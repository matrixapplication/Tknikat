import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_projects/add_project_screen.dart';
import 'package:taknikat/Ui/setting_page/my_projects/my_projects_page.dart';
import 'package:taknikat/Ui/setting_page/my_projects/my_project.dart';
import 'package:taknikat/Ui/setting_page/widget/show_all_button.dart';

import '../../../core/app_localizations.dart';
import '../../../injectoin.dart';
import 'bloc/my_projects_bloc.dart';
import 'bloc/my_projects_event.dart';
import 'bloc/my_projects_state.dart';

class MyProjectsList extends StatefulWidget {
  @override
  _MyProjectsListState createState() => _MyProjectsListState();
}

class _MyProjectsListState extends State<MyProjectsList> {
  @override
  void initState() {
    sl<MyProjectsBloc>().add(GetMyProjects());
  }

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder(
        bloc: sl<MyProjectsBloc>(),
        builder: (BuildContext context, MyProjectsState state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)
                        .translate("Business exhibition"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  ShowAllButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyProjectsPage(),
                    )),
                  )
                ],
              ),
              Container(
                height: 200,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 105,
                          height: 135,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(15, 52, 157, 216),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(PageTransition(
                                    duration: Duration(milliseconds: 700),
                                    type: PageTransitionType.fade,
                                    child: AddProjectScreen()));
                              },
                              icon: SvgPicture.asset(
                                  "assets/images/addButton.svg"),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          AppLocalizations.of(context)
                              .translate("Add_work"),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 13),
                    ...state.myProjects.map((project) => MyProjectItem(project))
                  ],
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          );
        });
  }
}
