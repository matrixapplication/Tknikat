import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/core/widgets/screen_state_layout.dart';

import '../../../../core/base_widget/image_viewer.dart';
import '../../../../core/constent.dart';
import '../../../../core/image_place_holder.dart';
import '../../../../injectoin.dart';
import '../../service_order/data/model/orders_service_model.dart';
import '../logic/product_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyProductOrdersBody extends StatefulWidget {
  final bool isProvider;

  const MyProductOrdersBody({super.key,required this.isProvider});

  @override
  State<MyProductOrdersBody> createState() => _MyProductOrdersBodyState();
}

class _MyProductOrdersBodyState extends State<MyProductOrdersBody> {
  @override
  void initState() {
    super.initState();
   context.read<ProductCubit>().getMyProductOrders(isProvider: widget.isProvider);
  }
  @override
  Widget build(BuildContext context) {
     final  isLoading = context.watch<ProductCubit>().isServiceOrderLoading;
     final  isLoadingStatus = context.watch<ProductCubit>().isLoadingStatus;
     final  isAccepted = context.watch<ProductCubit>().isAccepted;
     final ServiceOrdersModel? serviceOrdersModel = context.watch<ProductCubit>().serviceOrdersModel;
    return CustomScreenStateLayout(
        isLoading: isLoading,

        isEmpty: (serviceOrdersModel?.content !=null && (serviceOrdersModel?.content?.isEmpty??true)  ),
        builder: (context){

          return
           RefreshIndicator(
               onRefresh: ()async{
                 await Future.delayed(Duration(seconds: 1)).then((e){
                   context.read<ProductCubit>().getMyProductOrders(isProvider: widget.isProvider);

                 });
               },
             child:  ListView.builder(
               physics: AlwaysScrollableScrollPhysics(),
               padding: EdgeInsets.only(top: 10),
               itemCount:serviceOrdersModel?.content?.length??0 ,
               itemBuilder: (context,index){
                 final data =serviceOrdersModel?.content?[index];

                 return Container(

                     decoration: BoxDecoration(
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                             color: Colors.black12,
                             blurRadius: 3,
                             spreadRadius: 2,
                             offset:Offset(3,6)
                         )
                       ],
                       borderRadius: BorderRadius.circular(20),
                       // border: Border.all(color: Colors.black45)
                     ),
                     padding: EdgeInsets.all(6)+EdgeInsets.symmetric(vertical: 2),
                     margin: EdgeInsets.symmetric(vertical: 7,horizontal: 7),
                     child: Column(
                       children: [
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             CachedNetworkImage(
                               height: 100,
                               width: MediaQuery.sizeOf(context).width*0.25,
                               placeholderFadeInDuration:
                               Duration(seconds: 1),
                               errorWidget: (context, url, error) =>
                                   Container(
                                       decoration: BoxDecoration(
                                           color: othercolor,
                                           borderRadius:
                                           BorderRadius.circular(8)),
                                       child: Icon(Icons.error)),
                               placeholder: (_, __) =>
                                   ImagePlaceholder.rectangular(
                                       borderRadius:
                                       BorderRadius.circular(26)),
                               imageUrl: getImagePath(
                                   data?.service?.featuredImage??''
                               ),
                               imageBuilder:
                                   (context, imageProvider) =>
                                   GestureDetector(
                                     onTap: () {
                                       openBottomSheet(
                                           context, imageProvider);
                                     },
                                     child: Container(
                                       decoration: BoxDecoration(
                                           image: DecorationImage(
                                               fit: BoxFit.cover,
                                               image: imageProvider),
                                           borderRadius:
                                           BorderRadius.circular(16)),
                                     ),
                                   ),
                             ),
                             SizedBox(
                               width: 8.w,
                             ),

                             Expanded(child:
                             Container(
                               padding: EdgeInsets.symmetric(vertical: 2),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisSize: MainAxisSize.max,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Expanded(child: Text(
                                         timeago.format(
                                             locale: Localizations.localeOf(context).languageCode,
                                             DateTime.parse(data?.createdAt??'')),
                                         style:
                                         TextStyle(
                                             fontSize: 13,
                                             color: Colors.grey,
                                             fontWeight: FontWeight.w400,
                                             fontFamily: 'Tajawal'
                                         ),
                                       ),),
                                       Container(
                                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4)+EdgeInsets.only(top: 4),
                                         decoration:BoxDecoration(
                                             color: primaryColor.withOpacity(0.1),
                                             borderRadius: BorderRadius.circular(10)
                                         ),
                                         child:  Text(
                                           (data?.status?.value==0)?
                                           getLangLocalization('pending'):
                                           (data?.status?.value==1)?
                                           getLangLocalization('completed'):
                                           (data?.status?.value==2)?
                                           getLangLocalization('rejected'):
                                           data?.status?.label??'',
                                           style: TextStyle(
                                               fontSize: 14,
                                               color: primaryColor,
                                               fontWeight: FontWeight.w500,
                                               fontFamily: 'Tajawal'
                                           ),
                                         ),
                                       ),
                                       SizedBox(width: 10,)
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Expanded(child:  Text(
                                         data?.service?.name??'',
                                         style:
                                         TextStyle(
                                             fontSize: 16,
                                             fontWeight: FontWeight.w700,
                                             fontFamily: 'Tajawal'
                                         ),
                                       ),),
                                       Text(
                                         '${data?.price?.toString()??''} ${appCurrency(context)}',
                                         style:
                                         TextStyle(
                                             fontSize: 13,
                                             color: Colors.red,
                                             fontWeight: FontWeight.w700,
                                             fontFamily: 'Tajawal'
                                         ),
                                       ),
                                       16.width,
                                     ],
                                   ),
                                   // if(widget.isProvider==false)
                                     Text(
                                     data?.service?.slug??'',
                                     style:
                                     TextStyle(
                                         fontSize: 13,
                                         fontWeight: FontWeight.w400,
                                         fontFamily: 'Tajawal',
                                         color:Colors.grey

                                     ),
                                   ),
                                   Text(
                                     data?.serviceUser?.name??'',
                                     style:
                                     TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.w400,
                                         fontFamily: 'Tajawal'

                                     ),
                                   ),



                                 ],
                               ),
                             ))

                           ],
                         ),
                         if(widget.isProvider==true &&(data?.status?.value== 0 )  )
                           ...[
                             8.height,
                             Row(
                               children: [
                                 Expanded(child: CustomButton(
                                   loading: (isLoadingStatus??false) &&(isAccepted==true),
                                   height: 37,
                                   onTap: (){
                                     context.read<ProductCubit>().changeStatusProductOrder(isAccepted: true,id: data?.id??0);
                                   },
                                   title: getLangLocalization('accept'),
                                 )),
                                 5.width,
                                 Expanded(child: CustomButton(
                                   loading: (isLoadingStatus??false) &&(isAccepted==false),

                                   isOutlined: true,
                                   height: 37,

                                   onTap: (){
                                     context.read<ProductCubit>().changeStatusProductOrder(isAccepted: false,id: data?.id??0);

                                   },
                                   title: getLangLocalization('reject'),
                                 )),
                               ],
                             ),
                           ]
                       ],
                     )
                 );

               }),);
        });
  }
}
