import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import '../../../app/App.dart';
import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_text.dart';
import '../../../core/base_widget/dialogcustom.dart';
import '../../../core/constent.dart';
import '../../../core/image.dart';
import '../../../core/style/custom_loader.dart';
import '../../../injectoin.dart';
import '../../../model/gallery_params.dart';
import '../../AllNotification_page/widget/text_card.dart';
import '../widgets/category_item.dart';
import 'gallery_category_cubit.dart';

class GalleryCategoryScreen extends StatefulWidget {
  GalleryCategoryScreen();

  @override
  State<GalleryCategoryScreen> createState() => _GalleryCategoryScreenState();

}

class _GalleryCategoryScreenState extends State<GalleryCategoryScreen> {
  bool isHide = false;
  final _bloc = sl<GalleryCategoryCubit>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  ScrollController _scrollController = ScrollController();

   @override
  void initState() {
     final cubit =context.read<GalleryCategoryCubit>();

     cubit.getCategoryGallery(isReload: true);
     super.initState();
     _scrollController.addListener(() async{
       if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && cubit.isLoading==false) {
         await      cubit.getCategoryGallery();

       }
     });
     super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final cubit =context.read<GalleryCategoryCubit>();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: baseText(
            '${AppLocalizations.of(context).translate("Gallery2")}',
            color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body:
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
              if (cubit.galleryResponse !=null) {
                if (cubit.galleryResponse?.content?.isNotEmpty??false) {
                  return
                    RefreshIndicator(
                        onRefresh: () async{
                          await  Future.delayed(Duration(seconds: 1), () {
                            cubit.getCategoryGallery(isReload: true);
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                            child:
                            GridView.count(
                              controller: _scrollController,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                children:
                                List.generate(cubit.galleryResponse?.content?.length??0, (index) {
                                  return CategoryItem(category: cubit.galleryResponse!.content![index]!,);
                                })
                            ))
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
      ),
      floatingActionButton: FloatingActionButton(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          if (appAuthState){
            cubit.categoryCover=null;
            showDataDialog(context);

          }else{
            showLogin(context);
          }

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
  showDataDialog(context) async {
     bool isLoading =false;
    _nameController.text='';
   return showDialog(
      context: context,
      builder: (context) {
        GalleryCategoryCubit cubit = context.read<GalleryCategoryCubit>();
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child:

          StatefulBuilder(builder: (context,setState){
            return BlocConsumer<GalleryCategoryCubit,GalleryCategoryState>(
              listener: (context,state){

              },
              builder: (context,state){
                return  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${AppLocalizations.of(context).translate("addAlbum")}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            textCard(
                              borderRadius:16,
                              validator: (value){
                                if(value!.isEmpty){
                                  return
                                    '${AppLocalizations.of(context).translate("addAlbumName")}';

                                }
                                return null;
                              },
                              color: Colors.red,
                              hintText:
                              '${AppLocalizations.of(context).translate("albumName")}',
                              name:
                              '${AppLocalizations.of(context).translate("albumName")}',

                              isPassword: false,
                              keyboardType: TextInputType.name,
                              controller: _nameController,
                            ),
                            SizedBox(height: 20),
                            cubit.categoryCover!=null?
                            InkWell(
                              onTap: (){
                                showAddGalleryDialog();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(cubit.categoryCover!,
                                  width: 230,
                                  fit: BoxFit.contain,
                                  height: 150,
                                ) ,
                              ),
                            ):
                            Container(
                              height: 40,
                              width: MediaQuery.sizeOf(context).width*0.63,
                              child:
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                onPressed: () {
                                  showAddGalleryDialog();
                                },
                                color: Colors.white,
                                textColor: primaryColor,
                                child:Padding(
                                    padding: EdgeInsets.only(top: 7),
                                    child:

                                    Text(
                                      '${AppLocalizations.of(context).translate("addImage")}',

                                    )),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: 150,
                              child:
                              MaterialButton(

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  if( state is AddCategoryGalleryLoading){return null;}

                                  if (_formKey.currentState!.validate()) {

                                    if(cubit.categoryCover!=null){
                                      setState((){
                                        isLoading=true;
                                      });
                                      _bloc.addGallery(CategoryGalleryParams(isHide: isHide,
                                          title: _nameController.text,
                                          cover: cubit.categoryCover),context);
                                    }else{
                                      showToast(
                                        '${AppLocalizations.of(context).translate("Select Cover")}',
                                      );
                                    }

                                  }
                                },
                                color: primaryColor,
                                textColor: Colors.white,
                                child:
                                isLoading==true? Container(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(color: Colors.white,strokeWidth: 3,),):
                                Padding(
                                    padding: EdgeInsets.only(top: 7),
                                    child:

                                    Text(
                                      '${AppLocalizations.of(context).translate("send")}',
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },)


        );
      },
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
              // StatefulBuilder(builder: (context, setState) {
              //   return Row(
              //     children: [
              //       Switch(
              //         activeColor: primaryColor,
              //         value: isHide,
              //         onChanged: (value) {
              //           setState(() {
              //             isHide = value;
              //             print(isHide);
              //           });
              //         },
              //       ),
              //       SizedBox(
              //         width: 15,
              //       ),
              //       Text(
              //         'اخفاء الالبوم',
              //         style: TextStyle(
              //             fontSize: 20,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       Spacer(),
              //       IconButton(
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //         icon: Icon(
              //           Icons.close,
              //           color: Colors.black,
              //         ),
              //       )
              //     ],
              //   );
              // }),
              // Divider(
              //   height: 1,
              // ),
              SizedBox(
                height: 30,
              ),
              Text(
                '${AppLocalizations.of(context).translate("coverAlbume")}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
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
    GalleryCategoryCubit cubit = context.read<GalleryCategoryCubit>();
    cubit.pickUpImage(data);
    // _bloc.addGallery(CategoryGalleryParams(isHide: isHide,
    //     title: _nameController.text,
    //     cover: data));
  }

  Future<void> _actionGallery() async {
    GalleryCategoryCubit cubit = context.read<GalleryCategoryCubit>();

    final data = await getImageFromGallery();
    cubit.pickUpImage(data);
    // _bloc.addGallery(CategoryGalleryParams(isHide: isHide,
    //     title: _nameController.text,
    //     cover: data));

  }
}



