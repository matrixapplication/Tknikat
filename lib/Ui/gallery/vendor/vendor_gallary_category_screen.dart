import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:taknikat/Ui/gallery/vendor/vendor_cubit.dart';
import 'package:taknikat/Ui/gallery/vendor/vendor_gallary_screen.dart';
import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_text.dart';
import '../../../core/base_widget/dialogcustom.dart';
import '../../../core/constent.dart';
import '../../../core/style/custom_loader.dart';
import '../../../injectoin.dart';
import '../gallery_screen.dart';

class VendorGalleryCategoryScreen extends StatelessWidget {
  final int vendorId;
  VendorGalleryCategoryScreen({Key? key, required this.vendorId}) : super(key: key);
  bool isHide = false;
  final _bloc = sl<VendorCubit>();
  final _formKey = GlobalKey<FormState>();
   final _nameController = TextEditingController();

   @override
  Widget build(BuildContext context) {
     final cubit =context.read<VendorCubit>();
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
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: BlocConsumer<VendorCubit, VendorState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (cubit.vendorGalleryResponse !=null) {
                if (cubit.vendorGalleryResponse?.data?.gallery?.isNotEmpty??false) {
                  return
                    RefreshIndicator(
                        onRefresh: () async{
                          await  Future.delayed(Duration(seconds: 1), () {
                            cubit.getVendorGallery(vendorId: vendorId);
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                            child:
                            GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                children:
                                List.generate(cubit.vendorGalleryResponse?.data?.gallery?.length??0, (index) {
                                  return
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => VendorGalleryScreen(categoryId: cubit.vendorGalleryResponse?.data?.gallery?[index].id??0)));

                                      },
                                      child:
                                    Stack(
                                      children: [
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
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Image.network(
                                              getImagePath(cubit.vendorGalleryResponse?.data?.gallery?[index].cover??'') ?? '',
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
                                        Container(
                                          width: sizeAware.width*0.5,
                                          height: 450,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black.withOpacity(0.7),
                                                Colors.black.withOpacity(0.4),
                                                Colors.black.withOpacity(0.2),
                                                Colors.transparent,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          right: 10,
                                          child: Center(
                                           child:  Text(
                                             cubit.vendorGalleryResponse?.data?.gallery?[index].title??'',
                                             style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 16,
                                               fontWeight: FontWeight.bold,
                                             ),
                                           ),
                                         )
                                        )
                                      ],
                                    )
                                    );
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
                              'لا توجد البومات حاليا',
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

    );
  }

}
