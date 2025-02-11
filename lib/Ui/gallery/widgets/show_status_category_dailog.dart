import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/core/custom_text_field.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../../core/app_localizations.dart';
import '../../../core/constent.dart';
import '../../../model/change_status_category_param.dart';
import '../../../model/gallery_response.dart';
import '../gallery_category/gallery_category_cubit.dart';

showStatusDialog(context,Content category,GalleryCategoryCubit cubit) async {
  int? valueIndex=0;
   if(category.status=='public'){
     valueIndex=0;
   }else if(category.status=='custom'){
     valueIndex=1;
     cubit.searchUsersList(userIds: category.users??[]);

   }else{
     valueIndex=2;
   }
  TextEditingController controller =TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      cubit.addSearchUserList=[];
      cubit.searchUserResponse=null;
      return
       StatefulBuilder(builder: (context,setState){
         return Dialog(
           backgroundColor: Colors.white,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16),
           ),
           child:
           BlocConsumer<GalleryCategoryCubit,GalleryCategoryState>(
             listener: (context,state){
               if(state is HideCategoryGalleryLoading){
                 showDialog(context: context, builder: (context)=>Center(child: loader(),));
               }
               if(state is HideCategoryGallerySuccess || state is HideCategoryGalleryError){
                 Navigator.pop(context);
                 cubit.getCategoryGallery(isReload: true);
               }

             },
             builder: (context,state){
               return Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                   color: Colors.white,
                 ),
                 padding: EdgeInsets.all(16),
                 child:
               SingleChildScrollView(
                 child:   Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Text(
                       '${AppLocalizations.of(context).translate("Status")}',
                       style: TextStyle(
                         fontSize: 20,
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Row(
                       children: [
                         Row(
                           children: [
                             Radio(value: 0, groupValue: valueIndex, onChanged: (int? val){

                               setState((){
                                 valueIndex=val;
                               });
                             }),
                             Text(
                               '${AppLocalizations.of(context).translate("Public")}',
                               style: TextStyle(
                                 fontSize: 12,
                                 color: Colors.grey,
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ],
                         ),
                         Row(
                           children: [
                             Radio(value: 1, groupValue: valueIndex, onChanged: (int? val){
                               setState((){
                                 valueIndex=val;
                               });
                             }),
                             Text(
                               '${AppLocalizations.of(context).translate("Custom")}',

                               style: TextStyle(
                                 fontSize: 12,
                                 color: Colors.grey,
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ],
                         ),
                         Row(
                           children: [
                             Radio(value: 2, groupValue: valueIndex, onChanged: (int? val){
                               setState((){
                                 valueIndex=val;
                               });
                             }),
                             Text(
                               '${AppLocalizations.of(context).translate("Only Me")}',

                               style: TextStyle(
                                 fontSize: 12,
                                 color: Colors.grey,
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                           ],
                         ),

                       ],
                     ),
                     SizedBox(height: 16),
                     Text(
                       '${AppLocalizations.of(context).translate("seeCategory")}',
                       style: TextStyle(
                         fontSize: 12,
                         color: Colors.grey,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                     SizedBox(height: 5),
                     Center(
                       child:   Text(
                         '${valueIndex==0?
                         'الكل سيشاهد هذا الالبوم':
                         (valueIndex==1?'بعض المستخدمين مسموح لهم بمشاهده هذا الالبوم':' انت واحدك فقط من تستطيع رؤية هذا الالبوم' )
                         }',
                         style: TextStyle(
                           fontSize: 12,
                           color: Colors.grey,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ),
                     if(valueIndex==1)
                       Column(
                         children: [
                           SizedBox(height: 10,),
                           CustomTextField(
                             onChanged: (value){
                               cubit.searchUser(searchText: value);
                             },
                             hintText: 'Search', controller: controller,
                           ),

                           SizedBox(height: 8,),
                           ...cubit.addSearchUserList?.map((e) =>
                               InkWell(
                                 onTap: (){
                                   cubit.removeUser(e);
                                 },
                                 child:  Container(
                                   width: double.infinity,
                                   // height: 30,
                                   margin: EdgeInsets.symmetric(vertical: 5,horizontal: 6),
                                   padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                                   decoration: BoxDecoration(
                                       color: primaryColor,
                                       borderRadius: BorderRadius.circular(8),
                                       boxShadow: [
                                         BoxShadow(
                                             color: Colors.black38.withOpacity(0.05),
                                             blurRadius: 10,
                                             offset: Offset(
                                                 2,5
                                             )
                                         )
                                       ]
                                   ),
                                   child:
                                  Row(
                                    children: [
                                      Expanded(child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 2,),
                                          Text(e.title??'',style: TextStyle(color: Colors.white),)
                                        ],
                                      ),),
                                      Icon(Icons.clear,color: Colors.white,)
                                    ],
                                  )
                                 ),
                               )).toList()??[],
                           SizedBox(height: 8,),
                           ...cubit.searchUserResponse?.content?.map((e) =>
                              InkWell(
                                onTap: (){
                                  cubit.addUser(e);
                                },
                                child:  Container(
                                  width: double.infinity,
                                  // height: 30,
                                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 6),
                                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38.withOpacity(0.05),
                                            blurRadius: 10,
                                            offset: Offset(
                                                2,5
                                            )
                                        )
                                      ]
                                  ),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 2,),
                                      Text(e.title??'',)
                                    ],
                                  ),
                                ),
                              )).toList()??[],

                         ],
                       ),

                     SizedBox(height: 16),
                     Row(
                       children: [
                         Expanded(
                           child: MaterialButton(
                             shape:RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10),
                             ),
                             onPressed: () {
                               ChangeStatusCategoryParam params =ChangeStatusCategoryParam(categoryId: category.id??0, status:
                               valueIndex==0?'public':
                               (valueIndex==1?'custom':'only_me'),
                                 userIds: valueIndex==1?cubit.addSearchUserList.map((e) => e.id??0).toList():null
                               );
                               cubit.changeHideCategoryGallery(params);
                             },
                             color: primaryColor,
                             textColor: Colors.white,
                             child:Padding(
                                 padding: EdgeInsets.only(top: 7),
                                 child: Text(
                                   '${AppLocalizations.of(context).translate("Save")}',)),
                           ),
                         ),
                         SizedBox(width: 10,),
                         Expanded(
                           child: MaterialButton(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 side: BorderSide(color:primaryColor)
                             ),
                             onPressed: () {
                               Navigator.pop(context);
                             },
                             color: Colors.white,
                             textColor:primaryColor ,
                             child:Padding(
                                 padding: EdgeInsets.only(top: 7),
                                 child: Text( '${AppLocalizations.of(context).translate("Cancel")}',)),
                           ),
                         )
                       ],
                     )
                   ],
                 ),
               )
               );
             },
           )
         );
       });
    },
  );

}
