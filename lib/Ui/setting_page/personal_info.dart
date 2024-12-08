import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_event.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_state.dart';
import 'package:taknikat/Ui/setting_page/edit_profile_page/edit_profile_page.dart';
import 'package:taknikat/Ui/setting_page/widget/textInfo.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/login_dialog.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/city/city.dart';
import 'package:taknikat/model/country/country_model.dart';

import '../gallery/gallery_category/gallary_category_screen.dart';
import 'bloc/settings_bloc.dart';
import 'get_countries_user/get_countries_user_screen.dart';
import 'get_countries_user/get_country_users_cubit.dart';
import 'my_shares/my_shares_page.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _bloc = sl<SettingsBloc>();
  Country? userCountry;
  City? userCity;

  initState() {
    super.initState();
    try {
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
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Center(
                              child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: (appUser!.avatar == null
                                      ? AssetImage("assets/images/profile.png")
                                      : CachedNetworkImageProvider(getImagePath(
                                          appUser!.avatar!))) as ImageProvider),
                            ),
                          ),
                          Text(
                            '${appUser!.firstName ?? ''} ${appUser!.lastName ?? ''}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style:
                                        ElevatedButton.styleFrom(elevation: 0),
                                    child:
                                   FittedBox(
                                     child:  Row(
                                       mainAxisAlignment:
                                       MainAxisAlignment.center,
                                       children: [
                                         Icon(
                                           Icons.edit_outlined,
                                           size: 24,
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(5.0),
                                           child: Text(
                                             AppLocalizations.of(context)
                                                 .translate("edit_info"),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                    onPressed: () {
                                      _bloc.add(GetUserData());
                                      Navigator.of(context).push(PageTransition(
                                          duration: Duration(milliseconds: 700),
                                          type: PageTransitionType.fade,
                                          child: EditProfilePage()));
                                    },
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Color(0xFFECECEC),
                                        onPrimary: Color(0xFF6B6B6B)),
                                    child: FittedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/sharesIcon.svg",
                                            width: 24,
                                            height: 24,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .translate("display_myShare"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () async {
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
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Color(0xFFECECEC),
                                        onPrimary: Color(0xFF6B6B6B)),
                                    child: FittedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .translate("add_album"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (await sl<PrefsHelper>()
                                          .getIsLogin()) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              GalleryCategoryScreen(),
                                        ));
                                      } else {
                                        showLoginFirstDialog(context);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 15),
                          baseInfoText(
                            icon: Icons.calendar_month_outlined,
                            title: AppLocalizations.of(context)
                                .translate("come_date"),
                            data: getDateYmd(appUser!.createdAt ?? ''),
                          ),
                          SizedBox(height: 15),
                          if (appUser!.phoneNumber != null)
                            baseInfoText(
                                icon: Icons.phone_outlined,
                                title: AppLocalizations.of(context)
                                    .translate("Phone Number"),
                                data: appUser!.phoneNumber!),
                          SizedBox(height: 15),
                          baseInfoText(
                            icon: Icons.email_outlined,
                            title:
                                AppLocalizations.of(context).translate("Email"),
                            data: appUser?.email ?? '',
                          ),
                          SizedBox(height: 15),
                          Provider<GetCountryUsersCubit>(
                            create: (BuildContext context) =>
                                sl<GetCountryUsersCubit>(),
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GetCountriesUserScreen(
                                                id: userCountry?.id
                                                        .toString() ??
                                                    '',
                                                type: 'country',
                                              )));
                                },
                                child: baseInfoText(
                                  icon: Icons.language,
                                  title: AppLocalizations.of(context)
                                      .translate("Country"),
                                  data: userCountry?.name ?? '',
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15),
                          if (userCity != null)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GetCountriesUserScreen(
                                              id: userCity?.id.toString() ?? '',
                                              type: 'city',
                                            )));
                              },
                              child: baseInfoText(
                                  icon: Icons.location_on_outlined,
                                  title: AppLocalizations.of(context)
                                      .translate("City"),
                                  data: userCity!.name ?? ''),
                            ),
                          SizedBox(height: 15),
                          appUser!.skills != null && appUser!.skills!.isNotEmpty
                              ? Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/skills.svg",
                                    ),
                                    SizedBox(width: 8),
                                    Text(AppLocalizations.of(context)
                                        .translate("Skills")),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Wrap(
                                        children: [
                                          ...appUser!.skills!.map((skill) =>
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              GetCountriesUserScreen(
                                                                id: skill.id
                                                                        .toString() ??
                                                                    '',
                                                                type: 'skill',
                                                              )));
                                                },
                                                child: Text(
                                                  '${skill.name!}، ',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : SizedBox.shrink(),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              appUser!.whatsapp != null &&
                                      appUser!.whatsapp!.isNotEmpty
                                  ? IconButton(
                                      icon: SvgPicture.asset(
                                          "assets/images/whatsapp.svg",
                                          color:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                                appUser!.whatsapp.toString()));
                                        showToast(AppLocalizations.of(context)
                                                .translate(
                                                    "Whatsapp Link copied") +
                                            "\n" +
                                            appUser!.whatsapp.toString());
                                      },
                                    )
                                  : Container(),
                              appUser!.facebook != null &&
                                      appUser!.facebook!.isNotEmpty
                                  ? IconButton(
                                      icon: SvgPicture.asset(
                                        "assets/images/facebook.svg",
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                                appUser!.facebook.toString()));
                                        showToast(AppLocalizations.of(context)
                                                .translate(
                                                    "Facebook Link copied") +
                                            "\n" +
                                            appUser!.facebook.toString());
                                      },
                                    )
                                  : Container(),
                              appUser!.instagram != null &&
                                      appUser!.instagram!.isNotEmpty
                                  ? IconButton(
                                      icon: SvgPicture.asset(
                                          "assets/images/instagram.svg",
                                          color:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                                appUser!.instagram.toString()));
                                        showToast(AppLocalizations.of(context)
                                                .translate(
                                                    "Instagram Link copied") +
                                            "\n" +
                                            appUser!.instagram.toString());
                                      },
                                    )
                                  : Container(),
                              appUser!.twitter != null &&
                                      appUser!.twitter!.isNotEmpty
                                  ? IconButton(
                                      icon: SvgPicture.asset(
                                          "assets/images/twitter.svg",
                                          color:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text: appUser!.twitter.toString()));
                                        showToast(AppLocalizations.of(context)
                                                .translate(
                                                    "Twitter Link copied") +
                                            "\n" +
                                            appUser!.twitter.toString());
                                      },
                                    )
                                  : Container(),
                              appUser!.linkedin != null &&
                                      appUser!.linkedin!.isNotEmpty
                                  ? IconButton(
                                      icon: SvgPicture.asset(
                                          "assets/images/linkedin.svg",
                                          color:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text:
                                                appUser!.linkedin.toString()));
                                        showToast(AppLocalizations.of(context)
                                                .translate(
                                                    "LinkedIn Link copied") +
                                            "\n" +
                                            appUser!.linkedin.toString());
                                      },
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      );
                    },
                  );
      },
    );
  }
}
