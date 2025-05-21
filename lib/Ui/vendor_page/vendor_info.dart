import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_bloc.dart';
import 'package:taknikat/Ui/vendor_page/vendor_shares/vendor_shares_tab.dart';
import 'package:taknikat/Ui/vendor_page/widget/textInfo.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/city/city.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

import '../gallery/vendor/vendor_gallary_category_screen.dart';
import '../gallery/vendor/vendor_gallary_screen.dart';

class VendorPersonalInfoPage extends StatelessWidget {
  final UserModel user;
  final bloc;

  VendorPersonalInfoPage(this.user, this.bloc);

  Country? userCountry;

  City? userCity;

  initState() {
    try {
      if (user.countryId != null)
        userCountry = sl<SettingsBloc>()
            .state
            .countries
            .singleWhereOrNull((x) => x.id == user.countryId);

      if (user.cityId != null && userCountry != null)
        userCity =
            userCountry?.cities.singleWhereOrNull((x) => x.id == user.cityId);
    } catch (e) {}
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: CircleAvatar(
                radius: 60,
                backgroundImage: (user.avatar == null
                    ? AssetImage("assets/images/profile.png")
                    : CachedNetworkImageProvider(
                        getImagePath(user.avatar!))) as ImageProvider),
          ),
        ),
        Text(
          '${user.firstName??''} ${user.lastName??''}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 13),
        Container(
          alignment: Alignment.center,
          width: 300,
          child: ReadMoreText(
            user.summary?.trim().isEmpty ?? true
                ? AppLocalizations.of(context).translate("no summary")
                : user.summary!,
            trimLines: 2,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF707070),
            ),
            colorClickableText: Colors.blue,
            trimCollapsedText:getLangLocalization('see more'),
            trimExpandedText: getLangLocalization('see less2'),
          ),
        ),
        Row(
          children: [
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFF6B6B6B), backgroundColor: Color(0xFFECECEC), elevation: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/sharesIcon.svg",
                      width: 24,
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(getLangLocalization('Show Shares')),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(PageTransition(
                      duration: Duration(milliseconds: 700),
                      type: PageTransitionType.fade,
                      child: VendorSharesTab(bloc)));
                },
              ),
            ),),
            SizedBox(width: 10,),
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFF6B6B6B), backgroundColor: Color(0xFFECECEC), elevation: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Icon(Icons.photo_library_sharp,color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(getLangLocalization('gallery')),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VendorGalleryCategoryScreen(vendorId: user.id??0)));
                  // Navigator.of(context).push(PageTransition(
                  //     duration: Duration(milliseconds: 700),
                  //     type: PageTransitionType.fade,
                  //     child: VendorSharesTab(bloc)));
                },
              ),
            ),)
          ],
        ),
        Divider(),
        SizedBox(height: 15),
        baseInfoText(
          icon: Icons.calendar_month_outlined,
          title: getLangLocalization('come_date'),
          data: getDateYmd(user.createdAt),
        ),
        SizedBox(height: 15),
        if (user.phoneNumber != null)
        baseInfoText(
            icon: Icons.phone_outlined,
            title: AppLocalizations.of(context).translate("Phone Number"),
            data: user.phoneNumber??''),
        if (userCountry?.name != null)
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: baseInfoText(
                icon: Icons.location_on_outlined,
                title: AppLocalizations.of(context).translate("Country"),
                data: userCountry!.name!),
          ),
        if (user.city?.name != null)
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: baseInfoText(
                icon: Icons.location_on_outlined,
                title: AppLocalizations.of(context).translate("City"),
                data: user.city?.name ?? ''),
          ),
        SizedBox(height: 15),
        Row(
          children: [
            SvgPicture.asset(
              "assets/images/skills.svg",
            ),
            SizedBox(width: 8),
            Text(AppLocalizations.of(context).translate("Skills")),
            SizedBox(width: 8),
            user.skills != null
                ? Expanded(
                    child: Wrap(
                      children: [
                        ...user.skills!.map((skill) => Text(
                              skill.name!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  )
                : Text(
                    getLangLocalization('No skills'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(user.whatsapp!=null && user.whatsapp!.isNotEmpty)
            IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: SvgPicture.asset("assets/images/mail.svg",
                  color: primaryColor),
              onPressed: () => launchURL(user.whatsapp),
            ),
            if(user.facebook!=null && user.facebook!.isNotEmpty)
              IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: SvgPicture.asset("assets/images/facebook.svg",
                  color: primaryColor),
              onPressed: () => launchURL(user.facebook),
            ),
            if(user.instagram!=null && user.instagram!.isNotEmpty)
              IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: SvgPicture.asset("assets/images/instagram.svg",
                  color: primaryColor),
              onPressed: () => launchURL(user.instagram),
            ),
            if(user.twitter!=null && user.twitter!.isNotEmpty)
              IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: SvgPicture.asset("assets/images/twitter.svg",
                  color: primaryColor),
              onPressed: () => launchURL(user.twitter),
            ),
            if(user.linkedin!=null && user.linkedin!.isNotEmpty)
              IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: SvgPicture.asset("assets/images/linkedin.svg",
                  color: primaryColor),
              onPressed: () => launchURL(user.linkedin),
            ),
          ],
        ),
      ],
    );
  }
}
