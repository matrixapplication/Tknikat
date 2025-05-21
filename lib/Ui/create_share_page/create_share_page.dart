import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:taknikat/Ui/create_share_page/provider/provider.dart';
import 'package:taknikat/Ui/create_share_page/widget/share_item.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/core/image.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../../injectoin.dart';

class CreateEditSharePage extends StatefulWidget {
  final EventModel? event;
  final ShareModel? shareModel;
  final VoidCallback? onDeleted;

  CreateEditSharePage({
    Key? key,
    this.event,
    this.shareModel,
    this.onDeleted,
  }) : assert(event?.id != null || shareModel?.event?.id != null);

  @override
  State<CreateEditSharePage> createState() => _CreateEditSharePageState();
}

class _CreateEditSharePageState extends State<CreateEditSharePage> {
  File? image;

  String? initialImage;
  @override
  void initState() {

    final eventId = widget.event?.id ?? widget.shareModel?.event?.id;
    initialImage = widget.shareModel?.image;
    list.add(
        ShareItemWidget(
          index: 1,
          event: widget.event!,eventId: eventId!, id: 1,
      onTap: (int id){
        setState(() {
          if(list.length==1){
            Navigator.pop(context);
          }else{
            list.removeWhere((element) => element.id==id);
          }
        });
      },
    ));
    super.initState();
  }
  List<ShareItemWidget> list =[];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final eventId = widget.event?.id ?? widget.shareModel?.event?.id;


    return ChangeNotifierProvider<ShareProvider>(
      create: (context) => sl()..init(widget.shareModel),
      builder: (context, _) {
        final provider = context.read<ShareProvider>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
                provider.isEdit ? 'تعديل المشاركة' : 'المشاركة في الفعالية'),
            actions: [
              if (widget.shareModel != null)
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    //delete dialog
                    _onDeletePressed(context);
                  },
                ),
            ],
            centerTitle: true,
            backgroundColor: primaryColor,
            elevation: 0,
          ),
          body: Column(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  color: primaryColor,
                  child: Column(
                    children: [
                      Container(height: 20),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    // final image = shareModel?.image;
                    // final initImage =
                    //     image != null ? [getImagePath(image)] : [];
                    
                    final number =(widget.event!.activationsCount!-widget.event!.userShare!);
                    return Form(
                      key: provider.formKey,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.event!=null?
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //(widget.event!.activationsCount!<=6?widget.event!.activationsCount!:6)
                                     ...list.map((e) => e),
                                      SizedBox(height: 20,),
                                      if(list.length<number)
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            provider.counter++;
                                            if(list.length<number){
                                              list.add(
                                                  ShareItemWidget(
                                                    index: list.length+1,
                                                    event: widget.event!,eventId: eventId!,
                                                  onTap: (int id){
                                                   setState(() {
                                                     if(list.length==1){
                                                       Navigator.pop(context);
                                                     }else{
                                                       list.removeWhere((element) => element.id==id);
                                                     }
                                                   });
                                                  },
                                                    id: provider.counter,
                                                  ));
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 170,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: primaryColor)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/images/addButton.svg"),
                                                SizedBox(width: 10,),
                                                Text(
                                                  'اضافة مشاركة اخري',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                      primaryColor),)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // for(int i=1 ;i<=(number<=6?number:6);i++)
                                      //   ShareItemWidget(event: widget.event!,eventId: eventId!,)
                                      // Padding(
                                      //   padding: EdgeInsets.symmetric(vertical: 10),
                                      //   child: Column(
                                      //     crossAxisAlignment: CrossAxisAlignment.start,
                                      //     children: [
                                      //       Text(
                                      //         AppLocalizations.of(context)
                                      //             .translate('description'),
                                      //         style: theme.textTheme.subtitle1,
                                      //       ),
                                      //       const SizedBox(height: 10),
                                      //       TextFormField(
                                      //         minLines: 7,
                                      //         maxLines: null,
                                      //         initialValue: widget.shareModel?.description,
                                      //         validator: (value) {
                                      //           if (value?.isEmpty ?? false) {
                                      //             return AppLocalizations.of(context)
                                      //                 .translate('description required');
                                      //           } else {
                                      //             return null;
                                      //           }
                                      //         },
                                      //         onChanged: (value) {
                                      //           provider.onDescriptionChanged(value);
                                      //         },
                                      //         decoration: InputDecoration(
                                      //             filled: true,
                                      //             fillColor: Color(0xFFF1F1F1),
                                      //             border: OutlineInputBorder(
                                      //                 borderSide: BorderSide.none,
                                      //                 borderRadius:
                                      //                 BorderRadius.circular(5))),
                                      //       ),
                                      //       SizedBox(height: 20),
                                      //       !provider.isEdit
                                      //           ? InkWell(
                                      //           onTap: () async {
                                      //             try {
                                      //               image = await pickImage();
                                      //               setState(() {});
                                      //               provider.onImageChanged(image);
                                      //             } catch (e) {}
                                      //           },
                                      //           child: Stack(
                                      //             children: [
                                      //               Container(
                                      //                 height: 235,
                                      //                 width: double.infinity,
                                      //                 decoration: BoxDecoration(
                                      //                   color: Color.fromARGB(
                                      //                       15, 52, 157, 216),
                                      //                   borderRadius:
                                      //                   BorderRadius.circular(5),
                                      //                 ),
                                      //                 child: image != null
                                      //                     ? Container(
                                      //                   decoration: BoxDecoration(
                                      //                       image: DecorationImage(
                                      //                           image: FileImage(
                                      //                               image!))),
                                      //                 )
                                      //                     : Column(
                                      //                   mainAxisAlignment:
                                      //                   MainAxisAlignment
                                      //                       .center,
                                      //                   crossAxisAlignment:
                                      //                   CrossAxisAlignment
                                      //                       .center,
                                      //                   children: [
                                      //                     SvgPicture.asset(
                                      //                         "assets/images/addButton.svg"),
                                      //                     SizedBox(height: 15),
                                      //                     Text(
                                      //                       'اضافة صورة',
                                      //                       style: TextStyle(
                                      //                           fontSize: 12,
                                      //                           color:
                                      //                           primaryColor),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //               if (image != null)
                                      //                 Positioned.directional(
                                      //                   end: 10,
                                      //                   textDirection:
                                      //                   Directionality.of(context),
                                      //                   top: 10,
                                      //                   child: IconButton(
                                      //                       onPressed: () {
                                      //                         image = null;
                                      //                         setState(() {});
                                      //                       },
                                      //                       icon: Icon(
                                      //                         Icons.close,
                                      //                         color: Colors.white,
                                      //                       )),
                                      //                 )
                                      //             ],
                                      //           ))
                                      //           : Stack(
                                      //         children: [
                                      //           Container(
                                      //               height: 235,
                                      //               width: double.infinity,
                                      //               decoration: BoxDecoration(
                                      //                 color: Color.fromARGB(
                                      //                     15, 52, 157, 216),
                                      //                 borderRadius:
                                      //                 BorderRadius.circular(5),
                                      //               ),
                                      //               child: Builder(
                                      //                 builder: (context) {
                                      //                   if (initialImage == null) {
                                      //                     return _pickImageWidget();
                                      //                   }
                                      //
                                      //                   if (initialImage!
                                      //                       .startsWith('http')) {
                                      //                     return _networkImageWidget(
                                      //                         initialImage!);
                                      //                   }
                                      //                   return Container(
                                      //                     decoration: BoxDecoration(
                                      //                       image: DecorationImage(
                                      //                         image: FileImage(
                                      //                           File(initialImage!),
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   );
                                      //                 },
                                      //               )),
                                      //           Container(
                                      //             height: 235,
                                      //             width: double.infinity,
                                      //             decoration: BoxDecoration(
                                      //               color: Color.fromARGB(
                                      //                   100, 51, 51, 51),
                                      //               borderRadius:
                                      //               BorderRadius.circular(5),
                                      //             ),
                                      //             child: Column(
                                      //               mainAxisAlignment:
                                      //               MainAxisAlignment.center,
                                      //               crossAxisAlignment:
                                      //               CrossAxisAlignment.center,
                                      //               children: [
                                      //                 SvgPicture.asset(
                                      //                     "assets/images/cameraIcon.svg"),
                                      //                 SizedBox(height: 15),
                                      //                 Text(
                                      //                   'لا يمكن تعديل الصورة',
                                      //                   style: TextStyle(
                                      //                       fontSize: 12,
                                      //                       color: Colors.white),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                    //view-cart
                                  )
                                    : Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('description'),
                                      // style: theme.textTheme.subtitle1,
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      minLines: 7,
                                      maxLines: null,
                                      initialValue: widget.shareModel?.description,
                                      validator: (value) {
                                        if (value?.isEmpty ?? false) {
                                          return AppLocalizations.of(context)
                                              .translate('description required');
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (value) {
                                        provider.onDescriptionChanged(value);
                                      },
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFF1F1F1),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                              BorderRadius.circular(5))),
                                    ),
                                    SizedBox(height: 20),
                                    !provider.isEdit
                                        ? InkWell(
                                        onTap: () async {
                                          try {
                                            image = await pickImage();

                                            setState(() {});
                                            provider.onImageChanged(image);
                                          } catch (e) {}
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 235,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    15, 52, 157, 216),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              child: image != null
                                                  ? Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                            image!))),
                                              )
                                                  : Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/images/addButton.svg"),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    'اضافة صورة',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                        primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (image != null)
                                              Positioned.directional(
                                                end: 10,
                                                textDirection:
                                                Directionality.of(context),
                                                top: 10,
                                                child: IconButton(
                                                    onPressed: () {
                                                      image = null;
                                                      setState(() {});
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    )),
                                              )
                                          ],
                                        ))
                                        : Stack(
                                      children: [
                                        Container(
                                            height: 235,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  15, 52, 157, 216),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                if (initialImage == null) {
                                                  return _pickImageWidget();
                                                }

                                                if (initialImage!
                                                    .startsWith('http')) {
                                                  return _networkImageWidget(
                                                      initialImage!);
                                                }
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: FileImage(
                                                        File(initialImage!),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )),
                                        Container(
                                          height: 235,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                100, 51, 51, 51),
                                            borderRadius:
                                            BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/images/cameraIcon.svg"),
                                              SizedBox(height: 15),
                                              Text(
                                                'لا يمكن تعديل الصورة',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Builder(
                                        builder: (context) {
                                          final provider =
                                              context.watch<ShareProvider>();
                                          if (provider.isLoading) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          return SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                final eventId =
                                                    widget.event?.id ??
                                                        widget.shareModel?.event
                                                            ?.id;
                                                if(provider.formKey.currentState!.validate()){
                                                  provider.onSubmitted(
                                                    eventId,
                                                    context,
                                                  );
                                                }

                                              },
                                              child: Text(provider.isEdit
                                                  ? 'حفظ'
                                                  : 'إضافة المشاركة'),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _pickImageWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/addButton.svg"),
          SizedBox(height: 15),
          Text(
            'اضافة صورة',
            style: TextStyle(fontSize: 12, color: primaryColor),
          ),
        ],
      );

  _networkImageWidget(String image) => CachedNetworkImage(
        placeholderFadeInDuration: Duration(seconds: 1),
        errorWidget: (context, url, error) => Container(
          alignment: Alignment.center,
          color: othercolor,
          child: FittedBox(
            child: Icon(Icons.error),
          ),
        ),
        placeholder: (_, __) => ImagePlaceholder.rectangular(),
        imageUrl: image,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: 28,
        ),
      );

  void _onDeletePressed(BuildContext context) {
    AwesomeDialog(
      context: context,
      customHeader: Container(
        child: Icon(
          Icons.delete_forever_outlined,
          size: 60,
          color: primaryColor,
        ),
      ),
      btnCancelText: AppLocalizations.of(context).translate("Cancel"),
      btnOkText: AppLocalizations.of(context).translate("Ok"),
      btnOkColor: primaryColor,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: AppLocalizations.of(context).translate("Delete Action"),
      desc: AppLocalizations.of(context)
          .translate("are you sure you want to delete this share"),
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        try {
          Provider.of<ShareProvider>(context, listen: false)
              .onDeleted(widget.shareModel!.id, context);
          widget.onDeleted?.call();
        } on NetworkException catch (e) {
          Fluttertoast.showToast(msg: e.error);
        }
        Navigator.pop(context);
      },
    ).show();
  }
}
