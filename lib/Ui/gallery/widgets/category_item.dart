import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taknikat/Ui/gallery/widgets/show_delete_category_dailog.dart';
import 'package:taknikat/Ui/gallery/widgets/show_edit_category_dailog.dart';
import 'package:taknikat/Ui/gallery/widgets/show_status_category_dailog.dart';

import '../../../core/base_widget/image_viewer.dart';
import '../../../core/constent.dart';
import 'custom_popup_menu.dart';
import '../../../injectoin.dart';
import '../../../model/gallery_response.dart';
import '../gallery_category/gallery_category_cubit.dart';
import '../gallery_screen.dart';

class CategoryItem extends StatelessWidget {
  final Content category;
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit =context.read<GalleryCategoryCubit>();

    return   InkWell(
      onLongPress: (){
        openBottomSheet(
            context, CachedNetworkImageProvider(getImagePath(category.cover??'') ));
      },
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryScreen(categoryId:category.id.toString()??'0')));
      },
      child:
      Container(
          width: sizeAware.width*0.5,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.black45, blurRadius: 2,
                  offset: Offset(0, 2)
              )
            ],
          ),
          child:
          Stack(
            children: [
              Column(
                children: [
                  Expanded(child:   ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(

                      getImagePath(category.cover??'') ?? '',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),),
                  // SizedBox(height: 10,),
                  // Row(
                  //   children: [
                  //     SizedBox(width: 16,),
                  //     Expanded(child:   Text(category.title??"",style: TextStyle(fontSize: 15,color: Colors.black),),),
                  //     InkWell(
                  //       onTap: (){
                  //         cubit.changeHideCategoryGallery(category.id??0);
                  //       },
                  //       child: category.isHide==1?
                  //       Icon(Icons.visibility_off,color: Colors.grey,):
                  //       Icon(Icons.visibility,color: Colors.blue,),
                  //     ),
                  //     SizedBox(width: 12,),
                  //     InkWell(
                  //         onTap: (){
                  //           cubit.deleteCategoryGallery(category.id??0);
                  //         },
                  //         child:
                  //         Icon(Icons.delete_forever,color: Colors.red,)
                  //     ),
                  //     SizedBox(width: 10,),
                  //
                  //   ],
                  // ),
                  // SizedBox(height: 10,),

                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                    ]
                  )
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
              child:Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(width: 30,),
                Expanded(child: Center(
                   child: Text(category.title??"",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                ),),
                CustomPopupMenu(onSelected: (int index) {
                   if(index==1){
                     showEditeDataDialog(context,category);
                   }
                   else if(index ==2){
                     showDeleteDialog(context,category.title??"",category.id??0,cubit );
                   } else if(index ==3){
                     showStatusDialog(context,category,cubit );
                   }
                   else if(index ==4){
                     final String path ='gallery-view/${category.id}';
                     Share.share(url + path);
                   }
                   else if(index ==5){
                     final String path ='taknikat/${category.slug}';
                     http://taknikat.dev02.matrix-clouds.com/taknikat/<Slug>
                     Share.share(url + path);
                   }
                },),
              ],),
              )

            ],
          )
      ),
    );
  }
}

