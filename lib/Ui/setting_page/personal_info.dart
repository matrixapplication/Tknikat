import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_event.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_state.dart';
import 'package:taknikat/Ui/setting_page/edit_profile_page/edit_profile_page.dart';
import 'package:taknikat/Ui/setting_page/widget/textInfo.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/login_dialog.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';
import 'package:taknikat/core/widgets/tap_effect.dart';
import 'package:taknikat/core/widgets/texts/primary_texts.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/city/city.dart';
import 'package:taknikat/model/country/country_model.dart';

import '../gallery/gallery_category/gallary_category_screen.dart';
import '../sheets/contact_profile/contact_profile_sheet.dart';
import 'bloc/settings_bloc.dart';
import 'edit_profile_page/bloc/edit_profile_bloc.dart';
import 'edit_profile_page/bloc/edit_profile_state.dart';
import 'get_countries_user/get_countries_user_screen.dart';
import 'get_countries_user/get_country_users_cubit.dart';
import 'my_shares/my_shares_page.dart';

class PersonalInfoPage extends StatefulWidget {

  PersonalInfoPage();

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _bloc = sl<SettingsBloc>();

  final _bloc2 = sl<EditProfileBloc>();
  Country? userCountry;
  City? userCity;

  initState() {
    super.initState();
    try {
      isShow=false;
      if (appUser?.countryId != null)
        userCountry = sl<SettingsBloc>()
            .state
            .countries
            .singleWhereOrNull((x) => x.id == appUser!.countryId);

      if (appUser?.cityId != null && userCountry != null)
        userCity = userCountry?.cities
            .singleWhereOrNull((x) => x.id == appUser!.cityId);
    } catch (e) {}
  }
  bool isShow =false;




  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, SettingsState state2) {
        return appUser == null
            ? Center(
          child: loader(),
        )
            : appUser == null
            ? Container()
            : BlocBuilder(
          bloc: _bloc,
          builder: (context, SettingsState state5) {
            // showToast(state.error);
            // if (!state.initialized) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    50.width,
                    Column(
                      children: [
                        CircleAvatar(
                            radius: 60,
                            backgroundImage: (appUser!.avatar == null
                                ? AssetImage("assets/images/profile.png")
                                : CachedNetworkImageProvider(getImagePath(
                                appUser!.avatar!))) as ImageProvider),
                        8.height,
                        Text(
                          '${appUser!.firstName ?? ''} ${appUser!.lastName ?? ''}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconWidget(
                      onTap: (){
                        _bloc.add(GetUserData());
                        Navigator.of(context).push(PageTransition(
                            duration: Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: EditProfilePage()));
                      },
                      height: 40.w,
                      width: 40.w,
                      widget: Padding(
                        padding: 10.paddingAll,
                        child: SvgPicture.asset(AppImages.editProfile),
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 13),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  child: ReadMoreText(
                    appUser!.summary?.trim().isEmpty ?? true
                        ? AppLocalizations.of(context)
                        .translate("no summary")
                        : appUser!.summary!,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF707070),
                    ),
                    colorClickableText: Colors.blue,
                    trimCollapsedText: AppLocalizations.of(context)
                        .translate("see more"),
                    trimExpandedText: AppLocalizations.of(context)
                        .translate("see less2"),
                  ),
                ),
                // Text(
                //   state.user.summary?.trim().isEmpty ?? true
                //       ? AppLocalizations.of(context)
                //           .translate("no summary")
                //       : state.user.summary!,
                //   style: TextStyle(
                //     fontSize: 14,
                //     color: Color(0xFF707070),
                //   ),
                //   maxLines: 2,
                //   softWrap: true,
                //   overflow: TextOverflow.ellipsis,
                // ),
                // ),
                10.height,
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child:
                      IconWidget(
                          onTap: ()async{
                            if (await sl<PrefsHelper>()
                                .getIsLogin()) {
                              Navigator.of(context).push(
                                  PageTransition(
                                      duration:
                                      Duration(milliseconds: 700),
                                      type: PageTransitionType.fade,
                                      child: MySharesPage()));
                            } else {
                              showLoginFirstDialog(context);
                            }
                          },
                          // radius: 16.r,
                          widget: Container(
                              padding: 16.paddingHorizontal+10.paddingVert,
                              child:
                              FittedBox(
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    PrimaryBoldText(label: AppLocalizations.of(context).translate("display_myShare")
                                      ,fontSize: 12,),
                                    5.width,
                                    SvgPicture.asset(AppImages.share,color: primaryColor,),
                                  ],
                                ),
                              )
                          )
                      ),),
                    5.width,
                    Expanded(
                      flex: 1,
                      child: IconWidget(
                        onTap: (){
                          showContactProfile(context, phone: appUser?.phoneNumber??'', email: appUser?.email??'');
                        },
                          height: 40.w,
                          width: 40.w,
                          // radius: 16.r,
                          padding: 10,
                          widget:  SvgPicture.asset(AppImages.phone)
                      ),),
                    Expanded(
                      flex: 1,
                      child:
                      IconWidget(
                          onTap: (){
                            setState(() {
                              isShow =!isShow;
                            });
                          },
                          height: 40.w,
                          width: 40.w,
                          // radius: 16.r,
                          padding: 10,
                          widget:
                          isShow==false?
                          SvgPicture.asset(AppImages.down):
                          SvgPicture.asset(AppImages.up)
                      ),),
                  ],
                ),
                if(isShow)
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(appUser!.whatsapp!=null && appUser!.whatsapp!.isNotEmpty)
                          IconWidget(
                            padding: 4,
                            onTap: (){
                              launchURL(appUser!.whatsapp);
                            },
                            widget:  Icon(FontAwesomeIcons.whatsapp,color: Colors.green,size: 30,),
                          ),

                        if(appUser!.facebook!=null && appUser!.facebook!.isNotEmpty)
                          IconWidget(
                            padding: 4,
                            onTap: (){
                              launchURL(appUser!.facebook);
                            },
                            widget:  Icon(Icons.facebook,color: Colors.blue,size: 30,),
                          ),

                        if(appUser!.instagram!=null && appUser!.instagram!.isNotEmpty)
                          IconWidget(
                            padding: 5.5,
                            onTap: (){
                              launchURL(appUser!.instagram);
                            },
                            widget:  Icon(FontAwesomeIcons.instagram,color: Colors.pinkAccent,size: 27,),
                          ),

                        if(appUser!.twitter!=null && appUser!.twitter!.isNotEmpty)
                          IconWidget(
                            padding: 4,
                            onTap: (){
                              launchURL(appUser!.twitter);
                            },
                            widget:  Icon(FontAwesomeIcons.twitter,color: Colors.blue,size: 30,),
                          ),

                        if(appUser!.linkedin!=null && appUser!.linkedin!.isNotEmpty)
                          IconWidget(
                            padding: 7,
                            onTap: (){
                              launchURL(appUser!.linkedin);
                            },
                            widget:  Icon(FontAwesomeIcons.linkedin,color: Colors.blue,size: 22,),
                          ),
                        if(appUser!.snapchat!=null && appUser!.snapchat!.isNotEmpty)
                          IconWidget(
                            padding: 5.5,
                            onTap: (){
                              launchURL(appUser!.snapchat);
                            },
                            widget:  Icon(FontAwesomeIcons.snapchat,color: Colors.orange,size: 26,),
                          ),
                        if(appUser!.youtube!=null && appUser!.youtube!.isNotEmpty)
                          IconWidget(
                            padding: 5.5,
                            onTap: (){
                              launchURL(appUser!.youtube);
                            },
                            widget:  Icon(FontAwesomeIcons.youtube,color: Colors.red,size: 26,),
                          ),


                      ],
                    ),
                  ),
              ],
            );
          },
        );
      },
    );

  }
}
