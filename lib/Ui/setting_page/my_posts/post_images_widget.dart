import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';
import 'package:taknikat/core/widgets/tap_effect.dart';
import 'package:taknikat/model/post_model/post_model.dart';
import 'package:carousel_slider/carousel_slider.dart';


import '../../../core/assets_image/app_images.dart';
import '../../../core/constent.dart';

const int imagesInMainScreen = 4;

class PostImagesWidget extends StatelessWidget {
  final PostModel post;
  final bool canShowImage;

  const PostImagesWidget({
    Key? key,
    required this.post,
    this.canShowImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasMoreImagesToShow = post.images!.length > imagesInMainScreen;
    final imagesToShowCount = min(post.images!.length, imagesInMainScreen);
    return SizedBox(
      height: MediaQuery.sizeOf(context).width + 10,
      child: ImageWidgets(
        image: post.images!.map((p0) => getImagePath(p0.toString())).toList(),
      ),
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
  State<ImageWidgets> createState() => _ImageWidgetsState();
}

class _ImageWidgetsState extends State<ImageWidgets> {
  final PageController pageController = PageController(); // PageController for SmoothPageIndicator
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).width - 10,
          width: double.infinity,
          child:
          CarouselSlider(
            carouselController: carouselController,
            items: widget.image
                .map(( e) =>
               CustomTapEffect(onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return Stack(
                             children: [
                               PhotoViewGallery.builder(
                                 scrollPhysics: const BouncingScrollPhysics(),
                                 builder: (context, int index) {
                                   return PhotoViewGalleryPageOptions(
                                     imageProvider: CachedNetworkImageProvider(
                                       widget.image[index],
                                     ),
                                     initialScale: PhotoViewComputedScale.covered,
                                     heroAttributes: PhotoViewHeroAttributes(
                                         tag: widget.image[index]),
                                     minScale: PhotoViewComputedScale.contained * 0.8,
                                     maxScale: PhotoViewComputedScale.covered,
                                   );
                                 },
                                 itemCount: widget.image.length,
                               ),
                               Positioned(
                                 top: 40.h,
                                 right: 20.w,
                                 child: IconWidget(

                                   onTap: (){
                                     Navigator.pop(context);
                                   },
                                   widget: Padding(
                                     padding: EdgeInsets.all(4.w),
                                     child: SvgPicture.asset(AppImages.close),
                                   ),
                                   height: 40.h,
                                   width: 40.w,
                                 ),
                               )
                             ],
                           );
                         }));

               },
                 child:  Stack(
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(16),
                     child: CachedNetworkImage(
                       height: MediaQuery.sizeOf(context).width - 10,
                       width: double.infinity,
                       placeholderFadeInDuration: Duration(seconds: 1),
                       errorWidget: (context, url, error) => Container(
                         alignment: Alignment.center,
                         color: Colors.grey,
                         child: Icon(Icons.error),
                       ),
                       placeholder: (_, __) => ImagePlaceholder.rectangular(),
                       imageUrl: e,
                       fit: BoxFit.cover,
                     ),
                   ),

                 ],
               ),)).toList(),
            options:
            CarouselOptions(
              height: MediaQuery.sizeOf(context).width - 10,
              aspectRatio: 16/9,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay:false,
              // widget.image.length>1? true:false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInCirc,
              enlargeCenterPage: false,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason){
                setState(() {
                  currentIndex =index;
                });
              },
              scrollPhysics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
            ),
          ),

          // PageView.builder(
          //   itemCount: widget.image.length,
          //   controller: secondPageController,
          //   physics: const ClampingScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return InkWell(
          //       onTap: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context) {
          //           return Stack(
          //             children: [
          //               PhotoViewGallery.builder(
          //                 scrollPhysics: const BouncingScrollPhysics(),
          //                 builder: (context, int index) {
          //                   return PhotoViewGalleryPageOptions(
          //                     imageProvider: CachedNetworkImageProvider(
          //                       widget.image[index],
          //                     ),
          //                     initialScale: PhotoViewComputedScale.covered,
          //                     heroAttributes: PhotoViewHeroAttributes(
          //                         tag: widget.image[index]),
          //                     minScale: PhotoViewComputedScale.contained * 0.8,
          //                     maxScale: PhotoViewComputedScale.covered,
          //                   );
          //                 },
          //                 itemCount: widget.image.length,
          //               ),
          //             ],
          //           );
          //         }));
          //       },
          //       child:
          //       ClipRRect(
          //         borderRadius: BorderRadius.circular(16),
          //         child: CachedNetworkImage(
          //           placeholderFadeInDuration: Duration(seconds: 1),
          //           errorWidget: (context, url, error) => Container(
          //             alignment: Alignment.center,
          //             color: Colors.grey,
          //             child: Icon(Icons.error),
          //           ),
          //           placeholder: (_, __) => ImagePlaceholder.rectangular(),
          //           imageUrl: widget.image[index],
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ),
        if(widget.image.length!=1)
          Positioned(
            bottom: 35.0, // Adjusted to fit the new custom indicator
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Makes the container fit its content
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.image.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: index == currentIndex ? 8 : 8,
                      width: index == currentIndex ? 20 : 8, // Active dot is larger
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),
              ),
            ),
          )


      ],
    );
  }
}


