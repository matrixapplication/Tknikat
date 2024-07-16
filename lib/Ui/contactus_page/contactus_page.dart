import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/contactus_page/bloc/contactus_state.dart';
import 'package:taknikat/Ui/contactus_page/widget/text_card.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../core/app_localizations.dart';
import '../../injectoin.dart';
import 'bloc/contactus_bloc.dart';
import 'bloc/contactus_event.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool isSwitched = true;
  bool stateAnimation = false;
  bool stateAnimationLanguage = false;
  String? dropdownLanguage, dropdownMony;
  var _name = TextEditingController();
  var _title = TextEditingController();
  var _email = TextEditingController();
  var _message = TextEditingController();

  bool isPassword = false;
  File? _image;
  double star = 0;
  final _bloc = sl<ContactusBloc>();

  @override
  void initState() {
    if(appAuthState){
      _name =TextEditingController(text: '${appUser?.firstName??''} ${appUser?.lastName??''}');
      _email =TextEditingController(text: appUser?.email??'');
    }else{
      _name.text='';
      _email.text='';
      _message.text='';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, ContactUsState state) {
          showToast(state.error);
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: primaryColor,
                title: baseText(
                  AppLocalizations.of(context).translate("Contact Us"),
                  size: sizeAware.width * 0.04,
                ),
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ClipPath(
                          clipper: CustomClipPath(),
                          child: Container(
                            color: primaryColor,
                            height: 30,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              alignment: AlignmentDirectional.topStart,
                              child: baseText(
                                  AppLocalizations.of(context)
                                      .translate("Contact Us Note"),
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('Full Name'),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      color: Colors.grey[50],
                                      child: textCard(
                                        enabled: appAuthState?false:true,
                                        name: AppLocalizations.of(context)
                                            .translate("name"),
                                        isPassword: false,
                                        height: 50.0,
                                        controller: _name,
                                      ),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.02,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('Email'),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      color: Colors.grey[50],
                                      child: textCard(
                                        enabled: appAuthState?false:true,
                                        name: AppLocalizations.of(context)
                                            .translate("email"),
                                        isPassword: false,
                                        controller: _email,
                                        height: 50.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.04,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .translate('Message'),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      color: Colors.grey[50],
                                      child: textCard(
                                        name: AppLocalizations.of(context)
                                            .translate("Message"),
                                        isPassword: false,
                                        maxLines: 5,
                                        controller: _message,
                                      ),
                                    ),
                                    SizedBox(
                                      height: sizeAware.height * 0.06,
                                    ),
                                    baseClick(
                                        AppLocalizations.of(context)
                                            .translate("Send"),
                                        radius: 100,
                                        colorTitle: Colors.white,
                                        FontWeight: FontWeight.bold,
                                        color: primaryColor,
                                        sizeTitle: sizeAware.width * 0.04,
                                        //borderColor: HexColor("#707070"),
                                        height: 50, //sizeAware.height*0.13,
                                        onTap: () {
                                      if (_name.text.isEmpty) {
                                        showToast("name required");
                                      }
                                      else if (_email.text.isEmpty) {
                                        showToast("email required");
                                      }
                                      // else if (_title.text.isEmpty) {
                                      //   showToast("title required");
                                      // }
                                      else if (_message.text.isEmpty) {
                                        showToast("message required");
                                      } else
                                        _bloc.add(ContactUs((b) => b
                                          ..title = _title.text
                                          ..name = _name.text
                                          ..message = _message.text
                                          ..mail = _email.text));
                                    }),
                                  ],
                                )),
                            SizedBox(
                              height: sizeAware.height * 0.05,
                            )
                          ],
                        )
                      ],
                    ),
                    state.isLoading
                        ? Center(
                            child: loader(context: context),
                          )
                        : Container()
                  ],
                ),
              ));
        });
  }
}
