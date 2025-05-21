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
import '../../gallery/gallery_category/gallary_category_screen.dart';
import '../../gallery/gallery_category/gallery_category_cubit.dart';
import '../../gallery/gallery_screen.dart';
import '../../gallery/widgets/category_item.dart';
import '../../vendor_page/widget/show_all_button.dart';
import '../my_projects/bloc/my_projects_bloc.dart';
import '../my_projects/bloc/my_projects_event.dart';
import '../my_projects/bloc/my_projects_state.dart';
import '../my_projects/my_projects_page.dart';
class MyCategoryAlbumWidget extends StatefulWidget {
  const MyCategoryAlbumWidget();

  @override
  State<MyCategoryAlbumWidget> createState() => _MyCategoryAlbumWidgetState();
}

class _MyCategoryAlbumWidgetState extends State<MyCategoryAlbumWidget> {
  @override
  void initState() {
    context.read<GalleryCategoryCubit>().getCategoryGallery(isReload: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cubit =context.read<GalleryCategoryCubit>();
    return BlocBuilder<GalleryCategoryCubit,GalleryCategoryState>(
        builder: (BuildContext context,  state) {
          return
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: BlocConsumer<GalleryCategoryCubit, GalleryCategoryState>(
                  listener: (context, state) {
                    if(state is DeleteCategoryGalleryLoading || state is EditCategoryGalleryLoading){
                      showDialog(context: context, builder: (context)=>Center(child: loader(),));
                    }
                    if(state is DeleteCategoryGallerySuccess || state is DeleteCategoryGalleryError || state is EditCategoryGallerySuccess || state is EditCategoryGalleryError){
                      cubit.getCategoryGallery(isReload: true);
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    print('asdasdsd cubit.galleryResponse ${cubit.galleryResponse?.content?.length}');
                    if (cubit.galleryResponse !=null) {
                      if (cubit.galleryResponse?.content?.isNotEmpty??false) {
                        return
                          SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate("albums"),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                      if((cubit.galleryResponse?.content?.length??0)>=4)
                                      ShowAllButton(
                                        onPressed: () =>
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => GalleryCategoryScreen(),
                                            )),
                                      )
                                  ],
                                ),
                            Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                              child: GridView.count(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics:
                                  NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  children: List.generate(
                                      ((cubit.galleryResponse?.content?.length??0) >= 10)?10:cubit.galleryResponse?.content?.length??0,
                                          (index) {
                                        return CategoryItem(category: cubit.galleryResponse!.content![index]);
                                      })))
                              ],
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
                                    AppImages.noFoundData,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(20),
                                  child: Text(
                                    '${AppLocalizations.of(context).translate("notFoundAlbums")}',
                                    style: TextStyle(),
                                  ),
                                )
                              ],
                            ));
                      }

                    }
                    else {
                      return Center(child: loader(context: context));
                    }
                  }),
            );
        });
  }
}
