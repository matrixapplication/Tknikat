import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/core/extensions/extensions.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../core/base_widget/project_item.dart';
import '../../../core/constent.dart';
import '../../../core/style/custom_loader.dart';
import '../../../injectoin.dart';
import '../../vendor_page/widget/show_all_button.dart';
import '../my_projects/bloc/my_projects_bloc.dart';
import '../my_projects/bloc/my_projects_event.dart';
import '../my_projects/bloc/my_projects_state.dart';
import '../my_projects/my_projects_page.dart';

class MyVideoWidget extends StatelessWidget {
  const MyVideoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder(
        bloc: sl<MyProjectsBloc>(),
        builder: (BuildContext context, MyProjectsState state) {
          return Stack(
            children: [
              RefreshIndicator(
                color: primaryColor,
                onRefresh: () async {
                  sl<MyProjectsBloc>().add(GetMyProjects());
                },
                child:
                Container(
                  height: sizeAware.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .translate("Business exhibition"),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            if(!state.isLoading && (state.myProjects.isNotEmpty))
                              ShowAllButton(
                              onPressed: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyProjectsPage(),
                                  )),
                            )
                          ],
                        ),
                        state.myProjects != null &&
                            state.myProjects.isNotEmpty
                            ?
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: GridView.count(
                                padding: EdgeInsets.zero,
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
                  // height: sizeAware.height * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      40.height,
                      Center(
                        child: SvgPicture.asset(
                          AppImages.noFoundData,

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
        });
  }
}
