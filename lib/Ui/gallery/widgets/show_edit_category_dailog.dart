import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/model/category_edit_param.dart';

import '../../../app/App.dart';
import '../../../core/base_widget/base_toast.dart';
import '../../../core/constent.dart';
import '../../../core/image.dart';
import '../../../injectoin.dart';
import '../../../model/gallery_params.dart';
import '../../../model/gallery_response.dart';
import '../../AllNotification_page/widget/text_card.dart';
import '../gallery_category/gallery_category_cubit.dart';
File? cover;

showEditeDataDialog(BuildContext context,Content category) async {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      final _bloc = context.read<GalleryCategoryCubit>();
      cover=null;

      // _bloc.imageCover=null;
      _nameController.text =category.title??'';

      return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child:
          StatefulBuilder(builder: (context,setState){
            return BlocConsumer<GalleryCategoryCubit,GalleryCategoryState>(
              listener: (context,state){
                if(state is PickUpImageState){

                }
              },
              builder: (context,state){
                print('asdasd $state');

                return  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(16),
                  child:
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'تعديل الألبوم',
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
                                    return ' ادخل إسم الالبوم';
                                  }
                                  return null;
                                },
                                color: Colors.red,
                                hintText: 'إسم الالبوم',
                                name: 'إسم الالبوم',
                                isPassword: false,
                                keyboardType: TextInputType.name,
                                controller: _nameController,
                              ),
                              SizedBox(height: 20),
                              cover !=null?
                              InkWell(
                                onTap: ()async{
                                  final data = await getImageFromGallery();
                                  setState((){
                                    cover=data;
                                  });
                                },
                                child:
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.file(cover!,
                                    width: 230,
                                    fit: BoxFit.contain,
                                    height: 150,
                                  ) ,
                                ),
                              ):
                              InkWell(
                                onTap: ()async{
                                  final data = await getImageFromGallery();
                                  setState((){
                                    cover=data;
                                  });
                                },
                                // height: 40,
                                // width: MediaQuery.sizeOf(context).width*0.63,
                                child:
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(getImagePath(category.cover??''),
                                    width: 230,

                                    errorBuilder: (e,r,t){
                                      return Center(child: Icon(Icons.warning),);
                                    },
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ) ,
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
                                    if (_formKey.currentState!.validate()) {
                                      CategoryEditParam params =CategoryEditParam(id: category.id??0, title: _nameController.text,image: cover);
                                      _bloc.editGallery(params,category.id??0);
                                    }
                                  },
                                  color: primaryColor,
                                  textColor: Colors.white,
                                  child:Padding(
                                      padding: EdgeInsets.only(top: 7),
                                      child: Text('ارسال')),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                );
              },
            );
          },)
      );
    },
  );


}

showEditGalleryDialog() async {
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
            SizedBox(
              height: 30,
            ),
            Text(
              'غلاف الالبوم',
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
                    _actionEditCamera(context).then((value) => Navigator.pop(context));
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
                    _actionEditGallery(context).then((value) => Navigator.pop(context));
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

Future<void> _actionEditCamera(context) async {
  final data = await getImageFromCamera();
  final _bloc = sl<GalleryCategoryCubit>();
  _bloc.pickUpEditImage(data);

}

Future<void> _actionEditGallery(context) async {
  final data = await getImageFromGallery();
  final _bloc = sl<GalleryCategoryCubit>();

  _bloc.pickUpEditImage(data);

}