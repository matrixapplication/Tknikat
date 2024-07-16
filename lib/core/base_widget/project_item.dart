import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/project_content_page/project_content_page.dart';
import 'package:taknikat/Ui/setting_page/my_projects/bloc/my_projects_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_projects/bloc/my_projects_event.dart';
import 'package:taknikat/Ui/setting_page/my_projects/edit_project_screen.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/project_model/project_model.dart';

import '../image_place_holder.dart';

class ProjectItem extends StatelessWidget {
  ProjectModel project;
  bool isMine;
  ProjectItem(this.project, {this.isMine = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: ProjectContentPage(project)));
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    placeholderFadeInDuration: Duration(seconds: 1),
                    errorWidget: (context, url, error) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: othercolor,
                          borderRadius: BorderRadius.circular(15)),
                      child: FittedBox(
                        child: Icon(Icons.error),
                      ),
                    ),
                    placeholder: (_, __) => ImagePlaceholder.rectangular(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    imageUrl: getImagePath(project.featuredImage.toString()),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: imageProvider),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  alignment: Alignment.centerRight,
                  child: Text(
                    project.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  project.description ?? 'no desc',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            isMine
                ? Positioned.directional(
                    end: 10,
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
                              btnCancelText: AppLocalizations.of(context)
                                  .translate("Cancel"),
                              btnOkText:
                                  AppLocalizations.of(context).translate("Ok"),
                              btnOkColor: primaryColor,
                              dialogType: DialogType.warning,
                              animType: AnimType.bottomSlide,
                              title: AppLocalizations.of(context)
                                  .translate("Delete Action"),
                              desc: AppLocalizations.of(context).translate(
                                  "are you sure you want to delete this project"),
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                sl<MyProjectsBloc>().add(RemoveProject(
                                    (p) => p..project.replace(project)));
                              },
                            )..show();
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
                                child: EditProjectScreen(project)));
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
                                    )),
                              )),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
