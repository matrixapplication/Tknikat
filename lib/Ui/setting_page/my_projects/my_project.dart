import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/project_content_page/project_content_page.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/model/project_model/project_model.dart';

class MyProjectItem extends StatelessWidget {
  final ProjectModel project;

  MyProjectItem(this.project);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 13),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: ProjectContentPage(project)));
        },
        child: Column(
          children: [
            Container(
              width: 105,
              height: 135,
              child: CachedNetworkImage(
                placeholderFadeInDuration: Duration(seconds: 1),
                errorWidget: (context, url, error) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: othercolor,
                      borderRadius: BorderRadius.circular(5)),
                  child: FittedBox(
                    child: Icon(Icons.error),
                  ),
                ),
                placeholder: (_, __) => ImagePlaceholder.rectangular(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                imageUrl: getImagePath(project.featuredImage.toString()),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: imageProvider),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Container(
              width: 105,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              alignment: Alignment.center,
              child: Text(
                project.name!,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
