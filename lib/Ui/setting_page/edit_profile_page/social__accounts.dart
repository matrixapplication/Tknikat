import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/Ui/setting_page/edit_profile_page/widgets/social_media_field.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../core/base_widget/base_click.dart';
import '../../../core/constent.dart';
import '../../../core/style/custom_loader.dart';
import '../../../core/widgets/dialog/base/show_premetion_account_dialog.dart';
import '../../../injectoin.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'bloc/edit_profile_bloc.dart';
import 'bloc/edit_profile_event.dart';
import 'bloc/edit_profile_state.dart';
class SocialAccountsScreen extends StatefulWidget {

  @override
  State<SocialAccountsScreen> createState() => _SocialAccountsScreenState();
}

class _SocialAccountsScreenState extends State<SocialAccountsScreen> {
  final _bloc = sl<EditProfileBloc>();
  var _facebookController = TextEditingController();
  var _youtubeController = TextEditingController();
  var _instagramController = TextEditingController();
  var _linkedinController = TextEditingController();
  var _twitterController = TextEditingController();
  var _snapchatController = TextEditingController();
  @override
  void initState() {
    final user = appUser!;

    _facebookController.text = user.facebook ?? '';
    _twitterController.text = user.twitter ?? '';
    _instagramController.text = user.instagram ?? '';
    _snapchatController.text = user.snapchat ?? '';
    _linkedinController.text = user.linkedin ?? '';
    _youtubeController.text = user.youtube ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: primaryColor,
        body:
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child:
              SvgPicture.asset(AppImages.back,height: double.infinity,fit: BoxFit.cover,),
            ),
            SingleChildScrollView(
                child: Column(
                  children: [
                    40.height,
                    AuthHeaderWidget(title: AppLocalizations.of(context).translate("addSocialAccounts")),
                    BlocConsumer(
                        bloc: _bloc,
                        listener: (BuildContext context, EditProfileState state) {},
                        builder: (BuildContext context, EditProfileState state) {
                          return Stack(
                            children: [
                              SingleChildScrollView(
                                padding: 16.paddingHorizontal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    10.height,
                                    Container(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            32.height,
                                            BlackMediumText(label: 'Hi!',fontSize: 16,),
                                            BlackRegularText(label: getLangLocalization('socialMess'),fontSize: 16,fontWeight: FontWeight.w300,),
                                            26.height,
                                            BlackRegularText(label:AppLocalizations.of(context).translate("yourLinks"),fontSize: 16,fontWeight: FontWeight.w300,),
                                            8.height,

                                            SocialMediaFiled(parameters: SocialLinksItem(
                                                type: SocialLinksTypes.facebook,
                                                icon: "assets/images/facebook.svg",
                                                link: _facebookController.text
                                            ),
                                              onUpdate: (link) {
                                              setState(() {
                                                _facebookController.text=link;
                                              });
                                            }, switchWidget:SizedBox(
                                              height: 25.h,
                                              width: 50.w,
                                              child:
                                              FittedBox(
                                                child: Switch(
                                                    activeColor: primaryColor,
                                                    value: appUser?.isFaceBookShow==1,
                                                    onChanged: (value)async {
                                                      await checkPermissionAndShowDialog(
                                                      context,
                                                      PermissionType.toggle_social_info.name,
                                                      ).then((canDo){
                                                        if (canDo) {
                                                          _bloc.add(ChangePersonalStatus((b) => b
                                                            ..keyValue = 'facebook'
                                                            ..statusValue = (value==true?'1':'0')));
                                                        }
                                                      });


                                                      // setState(() {
                                                      //   isEdited = true;
                                                      // });
                                                    }),
                                              ))
                                            ),
                                            SocialMediaFiled(parameters: SocialLinksItem(
                                                type: SocialLinksTypes.facebook,
                                                icon: "assets/images/linkedin.svg",
                                                link: _linkedinController.text
                                            ),
                                                onUpdate: (link) {
                                                  setState(() {
                                                    _linkedinController.text=link;
                                                  });
                                                }, switchWidget:SizedBox(
                                                    height: 25.h,
                                                    width: 50.w,
                                                    child:
                                                    FittedBox(
                                                      child: Switch(
                                                          activeColor: primaryColor,
                                                          value: appUser?.isLinkedInShow==1,
                                                          onChanged: (value) async{
                                                            await checkPermissionAndShowDialog(
                                                            context,
                                                            PermissionType.toggle_social_info.name,
                                                            ).then((canDo){
                                                              if (canDo) {
                                                                _bloc.add(ChangePersonalStatus((b) => b
                                                                  ..keyValue = 'linkedin'
                                                                  ..statusValue = (value==true?'1':'0')));
                                                              }
                                                            });

                                                            // setState(() {
                                                            //   isEdited = true;
                                                            // });
                                                          }),
                                                    ))
                                            ),

                                            SocialMediaFiled(parameters: SocialLinksItem(
                                                type: SocialLinksTypes.facebook,
                                                icon: "assets/images/instagram.svg",
                                                link: _instagramController.text
                                            ),
                                                onUpdate: (link) {
                                                  setState(() {
                                                    _instagramController.text=link;
                                                  });
                                                }, switchWidget:SizedBox(
                                                    height: 25.h,
                                                    width: 50.w,
                                                    child:
                                                    FittedBox(
                                                      child: Switch(
                                                          activeColor: primaryColor,
                                                          value: appUser?.isInstagramShow==1,
                                                          onChanged: (value)async{
                                                            await checkPermissionAndShowDialog(
                                                            context,
                                                            PermissionType.toggle_social_info.name,
                                                            ).then((canDo){
                                                              if (canDo) {
                                                                _bloc.add(ChangePersonalStatus((b) => b
                                                                  ..keyValue = 'instagram'
                                                                  ..statusValue = (value==true?'1':'0')));
                                                              }
                                                            });

                                                            // setState(() {
                                                            //   isEdited = true;
                                                            // });
                                                          }),
                                                    ))
                                            ),
                                            SocialMediaFiled(parameters: SocialLinksItem(
                                                type: SocialLinksTypes.facebook,
                                                icon:  "assets/images/snapchat.svg",
                                                link: _snapchatController.text
                                            ),
                                                onUpdate: (link) {
                                                  setState(() {
                                                    _snapchatController.text=link;
                                                  });
                                                }, switchWidget:SizedBox(
                                                    height: 25.h,
                                                    width: 50.w,
                                                    child:
                                                    FittedBox(
                                                      child: Switch(
                                                          activeColor: primaryColor,
                                                          value: appUser?.isSnapchatShow==1,
                                                          onChanged: (value)async {
                                                            await checkPermissionAndShowDialog(
                                                            context,
                                                            PermissionType.toggle_social_info.name,
                                                            ).then((canDo){
                                                              if (canDo) {
                                                                _bloc.add(ChangePersonalStatus((b) => b
                                                                  ..keyValue = 'snapchat'
                                                                  ..statusValue = (value==true?'1':'0')));
                                                              }
                                                            });


                                                            // setState(() {
                                                            //   isEdited = true;
                                                            // });
                                                          }),
                                                    ))
                                            ),
                                            SocialMediaFiled(parameters: SocialLinksItem(
                                                type: SocialLinksTypes.facebook,
                                                icon:    "assets/images/youtube.svg",
                                                link: _youtubeController.text
                                            ),
                                                onUpdate: (link) {
                                                  setState(() {
                                                    _youtubeController.text=link;
                                                  });
                                                }, switchWidget:SizedBox(
                                                    height: 25.h,
                                                    width: 50.w,
                                                    child:
                                                    FittedBox(
                                                      child: Switch(
                                                          activeColor: primaryColor,
                                                          value: appUser?.isYoutubeShow==1,
                                                          onChanged: (value)async {
                                                            await checkPermissionAndShowDialog(
                                                            context,
                                                            PermissionType.toggle_social_info.name,
                                                            ).then((canDo){
                                                              if (canDo) {
                                                                _bloc.add(ChangePersonalStatus((b) => b
                                                                  ..keyValue = 'youtube'
                                                                  ..statusValue = (value==true?'1':'0')));
                                                              }
                                                            });

                                                            // setState(() {
                                                            //   isEdited = true;
                                                            // });
                                                          }),
                                                    ))
                                            ),
                                            32.height,
                                            CustomButton(onTap: (){
                                              _bloc.add(TryEdit((b) => b
                                                ..first_name = appUser?.firstName??''
                                                ..last_name =appUser?.lastName??''
                                                ..email =appUser?.email??''
                                                ..phone =appUser?.phoneNumber??''
                                                ..countryId =appUser?.countryId
                                                ..cityId = appUser?.cityId
                                                ..image = null
                                                ..gender = appUser?.gender
                                                ..skills = []
                                                ..summary = appUser?.summary
                                                ..facebook = _facebookController.text
                                                ..instagram = _instagramController.text
                                                ..linkedin = _linkedinController.text
                                                ..youtube = _youtubeController.text
                                                ..snapchat = _snapchatController.text));
                                            },title: AppLocalizations.of(context).translate("Save Changes"),),
                                            16.height,

                                            CustomButton(
                                              isOutlined: true,
                                              onTap: (){
                                              Navigator.pop(context);
                                            },title: AppLocalizations.of(context).translate("Cancel"),)
                                          ],
                                        )),
                                    SizedBox(
                                      height: 40,
                                    )
                                  ],
                                ),
                              ),
                              state.isLoading
                                  ? Padding(
                                  padding:250.paddingTop,
                                  child: Center(
                                child: loader(context: context),
                              ))
                                  : Container()
                            ],
                          );
                        })
                  ],
                )
            )

          ],
        ));
  }
}




