import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_localizations.dart';
import '../../core/base_widget/base_text.dart';
import '../../core/base_widget/image_viewer.dart';
import '../../core/constent.dart';
import '../../core/style/custom_loader.dart';
import '../../injectoin.dart';
import 'gallery_cubit.dart';

class VendorGalleryScreen extends StatelessWidget {
  final int vendorId;
  const VendorGalleryScreen({required this.vendorId});
  @override
  Widget build(BuildContext context) {
    final cubit =context.read<GalleryCubit>();
    cubit.getVendorGallery(vendorId: vendorId);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: baseText(
            '${AppLocalizations.of(context).translate("Gallery2")}',
            color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocConsumer<GalleryCubit, GalleryState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetVendorGallerySuccess) {
              if (state.vendorGalleryResponse?.data?.gallery?.isNotEmpty??false) {
                return
                  RefreshIndicator(
                    onRefresh: () async{
                      await  Future.delayed(Duration(seconds: 1), () {
                        cubit.getVendorGallery(vendorId: vendorId);
                      });
                    },
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                      physics: BouncingScrollPhysics(),
                      child
                          : StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        children: state.vendorGalleryResponse?.data?.gallery?.map((item) {
                          return StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: state.vendorGalleryResponse?.data?.gallery?.indexOf(item) == 0 ? 2 : 3,
                              child:
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: InkWell(
                                      onTap: (){
                                        openBottomSheet(
                                            context, CachedNetworkImageProvider(getImagePath(item.image??'') ));
                                      },
                                      child:
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          getImagePath(item.image??'') ?? '',
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Center(
                                            child: Icon(
                                              Icons.error,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Positioned(
                                  //     top: 0,
                                  //     left: 0,
                                  //     child:
                                  //     InkWell(
                                  //       onTap: (){
                                  //         cubit.deleteImage(item.id??0);
                                  //       },
                                  //       child: Container(
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.white.withOpacity(0.7),
                                  //           borderRadius: BorderRadius.only(
                                  //               topLeft: Radius.circular(8),
                                  //               bottomRight: Radius.circular(8)),
                                  //         ),
                                  //         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                  //         child:Icon(Icons.delete_forever,color: Colors.red,),
                                  //       ),
                                  //     )),
                                  // Positioned(
                                  //     top: 0,
                                  //     right: 0,
                                  //     child:
                                  //     InkWell(
                                  //       onTap: (){
                                  //         cubit.changeHideImage(item.id??0);
                                  //       },
                                  //       child: Container(
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.white.withOpacity(0.7),
                                  //           borderRadius: BorderRadius.only(
                                  //               topRight: Radius.circular(8),
                                  //               bottomLeft: Radius.circular(8)),
                                  //         ),
                                  //         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                  //         child:
                                  //         item.isHide==1?
                                  //         Icon(Icons.visibility_off,color: Colors.grey,):
                                  //         Icon(Icons.visibility,color: Colors.blue,),
                                  //       ),
                                  //     ))
                                ],
                              )
                          );
                        }).toList()??[],
                      ),
                    ),
                  );
              }
              else {
                return Container(
                    width: sizeAware.width,
                    height: sizeAware.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            "assets/images/empty_content.svg",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            'لا توجد صور مضافة',
                            style: TextStyle(),
                          ),
                        )
                      ],
                    ));
              }
            } else if (state is GetGalleryError) {
              return  Container(
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
                          'لا توجد صور مضافة',
                          style: TextStyle(),
                        ),
                      )
                    ],
                  ));
            }
            else {
              return Center(child: loader(context: context));
            }
          }),
    );
  }

}
