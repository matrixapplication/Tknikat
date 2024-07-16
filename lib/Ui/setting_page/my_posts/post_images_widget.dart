import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_images_screen.dart';
import 'package:taknikat/core/base_widget/image_viewer.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/model/post_model/post_model.dart';

const int imagesInMainScreen = 4;

class PostImagesWidget extends StatelessWidget {
  final PostModel post;
  final bool canShowImage;

  const PostImagesWidget(
      {Key? key, required this.post, this.canShowImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasMoreImagesToShow = post.images!.length > imagesInMainScreen;
    final imagesToShowCount = min(post.images!.length, imagesInMainScreen);
    return SizedBox(
      height: MediaQuery.of(context).size.width+10,
      child:

      ImageWidgets(image: post.images!.map((p0) => getImagePath(p0.toString())).toList()),
      // GridView.builder(
      //     itemCount: imagesToShowCount,
      //     physics: NeverScrollableScrollPhysics(),
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: imagesToShowCount < 2 ? 1 : 2,
      //       childAspectRatio: imagesToShowCount != 2 ? 1 : 0.5,
      //       mainAxisSpacing: 4.0,
      //       crossAxisSpacing: 4.0,
      //     ),
      //     itemBuilder: (context, index) {
      //       return Stack(
      //         children: [
      //           CachedNetworkImage(
      //             placeholderFadeInDuration: Duration(seconds: 1),
      //             errorWidget: (context, url, error) => Container(
      //               alignment: Alignment.center,
      //               color: othercolor,
      //               child: FittedBox(
      //                 child: Icon(Icons.error),
      //               ),
      //             ),
      //             placeholder: (_, __) => ImagePlaceholder.rectangular(),
      //             imageUrl: getImagePath(post.images![index]),
      //             imageBuilder: (context, imageProvider) => InkWell(
      //               onTap: canShowImage
      //                   ? () => canShowImage(context, imageProvider)
      //                   : null,
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   image: DecorationImage(
      //                       fit: BoxFit.cover, image: imageProvider),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           if (hasMoreImagesToShow && index == imagesToShowCount - 1)
      //             Positioned.fill(
      //               child: InkWell(
      //                 child: Container(
      //                   color: Colors.grey.withOpacity(0.6),
      //                   child: Center(
      //                     child: Text(
      //                       '+ ${post.images!.length - imagesInMainScreen}',
      //                       style: TextStyle(
      //                         fontSize: 50.0,
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                       textAlign: TextAlign.center,
      //                     ),
      //                   ),
      //                 ),
      //                 onTap: () {
      //                   Navigator.of(context).push(PageTransition(
      //                       duration: Duration(milliseconds: 1000),
      //                       type: PageTransitionType.fade,
      //                       child: PostImagesScreen(post: post)));
      //                 },
      //               ),
      //             ),
      //         ],
      //       );
      //     }),
    );
  }
}
class ImageWidgets extends StatefulWidget {
  final List<String> image;


  const ImageWidgets({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ImageWidgets> createState() =>
      _SearchItemDetailsAppBarWidgetState();
}

class _SearchItemDetailsAppBarWidgetState
    extends State<ImageWidgets> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    PageController secondPageController = PageController();
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width-10,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 0),
              child: PageView.builder(
                itemCount: widget.image.length,
                controller: secondPageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          PageController thiredPageController =
                          PageController();
                          return Stack(
                            children: [
                              PhotoViewGallery.builder(
                                pageController: thiredPageController,
                                scrollPhysics: const BouncingScrollPhysics(),
                                builder: (context, int index) {
                                  return PhotoViewGalleryPageOptions(
                                    imageProvider: CachedNetworkImageProvider(
                                        widget.image[index]),
                                    initialScale:
                                    PhotoViewComputedScale.covered,
                                    heroAttributes: PhotoViewHeroAttributes(
                                        tag: widget.image[index]),
                                    minScale:
                                    PhotoViewComputedScale.contained *
                                        0.8,
                                    maxScale: PhotoViewComputedScale.covered,
                                  );
                                },
                                itemCount: widget.image.length,
                                loadingBuilder: (context, event) => Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: CircularProgressIndicator(
                                      value: event == null
                                          ? 0
                                          : event.cumulativeBytesLoaded /
                                          event.expectedTotalBytes!,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SmoothPageIndicator(
                                  controller: thiredPageController,
                                  count: widget.image.length,
                                  effect: SlideEffect(
                                      dotHeight: 10,
                                      dotWidth: 10,
                                      activeDotColor: Colors.white,
                                      dotColor:
                                      Colors.white.withOpacity(0.3)),
                                  onDotClicked: (index) =>
                                      thiredPageController.animateToPage(
                                          index,
                                          duration:
                                          Duration(milliseconds: 250),
                                          curve: Curves.ease),
                                ),
                              ),
                              SizedBox(height: 10,),
                              // Positioned(
                              //   top: 50,
                              //   right: 16,
                              //   child: AppBarIconWidget(
                              //     isFav: false,
                              //     icon: "assets/images/arrowIcon.svg",
                              //   ).onTap(() => AppNavigation.goBack()),
                              // )
                            ],
                          );
                        }));
                  },
                    child:
                              CachedNetworkImage(
                                placeholderFadeInDuration: Duration(seconds: 1),
                                errorWidget: (context, url, error) => Container(
                                  alignment: Alignment.center,
                                  color: othercolor,
                                  child: FittedBox(
                                    child: Icon(Icons.error),
                                  ),
                                ),
                                placeholder: (_, __) => ImagePlaceholder.rectangular(),
                                imageUrl:  widget.image[index],
                                imageBuilder: (context, imageProvider) => InkWell(
                                  onTap:  (){
                                    openBottomSheet(context, imageProvider);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover, image: imageProvider),
                                    ),
                                  ),
                                ),
                              ),
                  //   ClipRRect(
                  //       borderRadius: BorderRadius.circular(0.0),
                  //       child: PhotoView(
                  //         initialScale: PhotoViewComputedScale.covered,
                  //         imageProvider: CachedNetworkImageProvider(
                  //           widget.image[index],
                  //         ),
                  //       ),
                  // )
                  );
                },
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 8),
                child: SmoothPageIndicator(
                  controller: secondPageController,
                  count: widget.image.length,
                  effect: SlideEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: Theme.of(context).primaryColorLight,
                      dotColor: Colors.grey.withOpacity(0.3)),
                  onDotClicked: (index) => secondPageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.ease),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}