import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/model/gallery_params.dart';
import '../../app/App.dart';
import '../../core/app_localizations.dart';
import '../../core/base_widget/base_text.dart';
import '../../core/base_widget/dialogcustom.dart';
import '../../core/base_widget/image_viewer.dart';
import '../../core/constent.dart';
import '../../core/image.dart';
import '../../core/multi_image_picker.dart';
import '../../core/style/custom_loader.dart';
import '../../injectoin.dart';
import '../setting_page/my_projects/add_project_screen.dart';
import 'gallery_cubit.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool isHide = false;
  final _bloc = sl<GalleryCubit>();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cubit =context.read<GalleryCubit>();
    cubit.getGallery();
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
            if (state is GetGallerySuccess) {
              if (state.galleryResponse?.content?.isNotEmpty??false) {
                return
                  RefreshIndicator(
                    onRefresh: () async{
                    await  Future.delayed(Duration(seconds: 1), () {
                      cubit.getGallery();
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
                        children: state.galleryResponse!.content!.map((item) {
                          return StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: state.galleryResponse!.content!.indexOf(item) == 0 ? 2 : 3,
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
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child:
                                   InkWell(
                                     onTap: (){
                                       cubit.deleteImage(item.id??0);
                                     },
                                     child: Container(
                                       decoration: BoxDecoration(
                                         color: Colors.white.withOpacity(0.7),
                                         borderRadius: BorderRadius.only(
                                             topLeft: Radius.circular(8),
                                             bottomRight: Radius.circular(8)),
                                       ),
                                       padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                       child:Icon(Icons.delete_forever,color: Colors.red,),
                                     ),
                                   )),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child:
                                      InkWell(
                                        onTap: (){
                                          cubit.changeHideImage(item.id??0);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.7),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomLeft: Radius.circular(8)),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                          child:
                                          item.isHide==1?
                                          Icon(Icons.visibility_off,color: Colors.grey,):
                                          Icon(Icons.visibility,color: Colors.blue,),
                                        ),
                                      ))
                                ],
                              )
                          );
                        }).toList(),
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
          floatingActionButton: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              if (appAuthState)
                showAddGalleryDialog();
              else
                showLogin(context);
            },
            backgroundColor: primaryColor,
            // mini: true,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
        );
  }
  showAddGalleryDialog() async {
    showModalBottomSheet(
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
              )
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[
              StatefulBuilder(builder: (context, setState) {
                return Row(
                  children: [
                    Switch(
                      activeColor: primaryColor,
                      value: isHide,
                      onChanged: (value) {
                        setState(() {
                          isHide = value;
                          print(isHide);
                        });
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'اخفاء الصور',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )
                  ],
                );
              }),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _actionCamera().then((value) => Navigator.pop(context));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: primaryColor, width: 2),
                          boxShadow: const [
                            BoxShadow(color: Colors.black45, blurRadius: 7)
                          ]),
                      height: 100,
                      width: 120,
                      child: Icon(
                        Icons.camera_alt,
                        color: primaryColor,
                        size: 60,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _actionGallery().then((value) => Navigator.pop(context));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: primaryColor, width: 2),
                          boxShadow: const [
                            BoxShadow(color: Colors.black45, blurRadius: 7)
                          ]),
                      height: 100,
                      width: 120,
                      child: Icon(
                        Icons.image,
                        color: primaryColor,
                        size: 60,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _actionCamera() async {
    final data = await getImageFromCamera();
    _bloc.addGallery(GalleryParams(isHide: isHide, files: [data]));
  }

  Future<void> _actionGallery() async {
    final data = await getImagesFromGallery();

    _bloc.addGallery(GalleryParams(isHide: isHide, files: data)).then((value) async{

    });
  }
}
