import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:taknikat/Ui/sheets/change_langauge/change_langauge_picker_state.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/core/widgets/texts/primary_texts.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../../app/bloc/app_event.dart';
import '../../../core/base_widget/base_toast.dart';
import '../../../core/utils/contact_helper.dart';
import '../../../core/utils/globle.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_sheet_header.dart';
import '../../../core/widgets/screen_state_layout.dart';
import '../../../injectoin.dart';
import '../dropdown_entity.dart';

class _ContactProfileSheet extends StatefulWidget {
  final String _phone;
  final String _email;
  const _ContactProfileSheet({required String phone, required String email,
  })  : _phone = phone,
        _email = email;

  @override
  State<_ContactProfileSheet> createState() => __SubServicesPickerSheetState();


}

class __SubServicesPickerSheetState extends State<_ContactProfileSheet> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.only(top: 40),
        padding: MediaQuery.of(context).viewInsets.bottom.paddingBottom+20.paddingAll,
        decoration:  BoxDecoration(borderRadius:const BorderRadius.vertical(top: Radius.circular(20)), color: Theme.of(context).scaffoldBackgroundColor),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomSheetHeader(onCancelPress: ()=>context.pop(), title:getLangLocalization('Contact')),
              12.height,
              Divider(),
              12.height,
              InkWell(
                onTap: (){
                  ContactHelper.launchCall(widget._phone??'');

                },
                child: Row(
                  children: [
                    Icon(Icons.phone_enabled_rounded,color: primaryColor,),
                    5.width,
                    PrimaryRegularText(label: getLangLocalization('Call'))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffEEEEF0))
                ),
                margin: 10.paddingVert,
                padding: 5.paddingVert+10.paddingStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    BlackMediumText(label:widget._phone,fontSize: 16,),
                    IconWidget(
                      onTap: (){
                        Clipboard.setData(  ClipboardData(text:widget._phone??'')).then((_)async {
                          if (Platform.isAndroid) {
                            final res = await getAndroidVersion();
                            if (res.isNotEmpty) {
                              final androidVersion = int.parse(res);
                              if (androidVersion <= 10) {
                                showToast('Copied ${widget._phone??''}',);
                              }
                            }
                            else {
                              showToast('Copied ${widget._phone??''}',);

                            }
                          } else {
                            showToast('Copied ${widget._phone??''}',);

                          }
                          Future.delayed(const Duration(microseconds: 0)).then((value) =>context.pop());
                        });
                      },
                      padding: 5.5,
                      widget: Icon(Icons.copy,color: primaryColor,size: 26,),
                    )
                  ],
                ),
              ),

              10.height,
             InkWell(
               onTap: (){
                 ContactHelper.launchMailURL(widget._email??'');

               },
               child:  Row(

                 children: [
                   Icon(Icons.email_outlined,color: primaryColor,),
                   5.width,
                   PrimaryRegularText(label: getLangLocalization('Email Address'))
                 ],
               ),
             ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xffEEEEF0))
                ),
                margin: 10.paddingVert,
                padding: 5.paddingVert+10.paddingStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    BlackMediumText(label:widget._email,fontSize: 16,),
                    IconWidget(
                      onTap: (){
                        Clipboard.setData(  ClipboardData(text:widget._email??'')).then((_)async {
                          if (Platform.isAndroid) {
                            final res = await getAndroidVersion();
                            if (res.isNotEmpty) {
                              final androidVersion = int.parse(res);
                              if (androidVersion <= 10) {
                                showToast('Copied ${widget._email??''}',);
                              }
                            }
                            else {
                              showToast('Copied ${widget._email??''}',);

                            }
                          } else {
                            showToast('Copied ${widget._email??''}',);

                          }
                          Future.delayed(const Duration(microseconds: 0)).then((value) =>context.pop());
                        });
                        },
                      padding: 5.5,
                      widget: Icon(Icons.copy,color: primaryColor,size: 26,),
                    )
                  ],
                ),
              ),
              12.height,

            ]),
      );
  }





}

Future<dynamic> showContactProfile(BuildContext context,
    {required String phone, required String email,}) async {
  return showMaterialModalBottomSheet(
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SafeArea(
        child: _ContactProfileSheet(
      email: email,
      phone: phone,
    )),
  );
}
