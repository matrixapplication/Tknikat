import 'package:flutter/material.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/project_item.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/project_model/project_model.dart';
import 'package:built_collection/built_collection.dart';

Widget gridProjects(
  BuildContext context,
  BuiltList<ProjectModel> projects,
) {
  return Padding(
    padding: EdgeInsets.only(
      left: sizeAware.width * 0.02,
      right: sizeAware.width * 0.02,
    ),
    child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.680,
        //100/148,//widthButton/heightButton,

        children: List.generate(projects.length, (index) {
          // return productListItem(projects, index, context);
          return Container(
            margin: EdgeInsets.all(5),
            child: ProjectItem(
              projects[index],
            ),
          );
        })),
  );
}

Widget gridProjectsSeeAll(BuildContext context, projects) {
  return Column(
    children: [
      // Navigator.of(context).push(
      //     PageTransition(
      //         duration: Duration(
      //             milliseconds: 700),
      //         type: PageTransitionType.fade,
      //         child: AllprojectsList(
      //           0,
      //           neww: 1,
      //           search: '',
      //         )));
      Padding(
          padding: EdgeInsets.only(
            left: sizeAware.width * 0.02,
            right: sizeAware.width * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              baseText(AppLocalizations.of(context).translate("New Arrival"),
                  size: sizeAware.width * 0.04,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),

              // InkWell(
              //   onTap: () {
              //     // Navigator.of(context).push(
              //     //     PageTransition(
              //     //         duration: Duration(
              //     //             milliseconds: 700),
              //     //         type: PageTransitionType.fade,
              //     //         child: AllprojectsList(
              //     //           0,
              //     //           neww: 1,
              //     //           search: '',
              //     //         )));
              //   },
              //   child: baseText(
              //     title: AppLocalizations.of(context).translate("see all"),
              //     size: sizeAware.width * 0.03,
              //     color: primaryColor,
              //   ),
              // )
            ],
          )),
      GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          //100/148,//widthButton/heightButton,

          children: List.generate(projects.length, (index) {
            // return productListItem(projects, index, type, context);
            return ProjectItem(projects[index]);
          })),
    ],
  );
}

Widget listProjects(BuildContext context, projects) {
  return Container(
    width: sizeAware.width,
    height: sizeAware.height * 0.28437732,
    child: Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(
              left: sizeAware.width * 0.02,
              right: sizeAware.width * 0.02,
            ),
            width: double.infinity,
            child: baseText("Projects",
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: projects.length,
            itemBuilder: (BuildContext context, int index) => Container(
                width: sizeAware.width * 0.442238,
                child: ProjectItem(
                  projects[index],
                )),
          ),
        )
      ],
    ),
  );
}
