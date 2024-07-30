import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_bloc.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

Widget contactInfo(UserModel user) {
  String? country_name, city_name = "";
  try {
    Country? c = sl<SettingsBloc>()
        .state
        .countries
        .singleWhereOrNull((c) => c.id == user.countryId);
    if (c != null) {
      country_name = c.name;
      var cc = c.cities.singleWhereOrNull((c) => c.id == user.cityId);
      if (cc != null) city_name = cc.name;
    }
  } catch (e) {}

  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معلومات التواصل',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(14),
          width: sizeAware.width,
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'تاريخ الإنضمام : ',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      getDateOnly(user.createdAt!),
                      style: TextStyle(
                        color: secondryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (country_name != null)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        'الدولة : ',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        country_name.toString(),
                        style: TextStyle(
                          color: secondryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              if (city_name != null)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        'المدينة : ',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        city_name,
                        style: TextStyle(
                          color: secondryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'رقم الهاتف: ',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    if (user.phoneNumber != null)
                      Text(
                        user.phoneNumber!,
                        style: TextStyle(
                          color: secondryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(user.whatsapp!=null &&user.whatsapp!.isNotEmpty)
                  IconButton(
                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                    icon: SvgPicture.asset("assets/images/whatsapp.svg",
                        color: primaryColor),
                    onPressed: () => launchURL(user.whatsapp),
                  ),
                  if(user.facebook!=null &&user.facebook!.isNotEmpty)
                    IconButton(
                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                    icon: SvgPicture.asset("assets/images/facebook.svg",
                        color: primaryColor),
                    onPressed: () => launchURL(user.facebook),
                  ),
                  if(user.instagram!=null &&user.instagram!.isNotEmpty)
                    IconButton(
                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                    icon: SvgPicture.asset("assets/images/instagram.svg",
                        color: primaryColor),
                    onPressed: () => launchURL(user.instagram),
                  ),
                  if(user.twitter!=null &&user.twitter!.isNotEmpty)
                    IconButton(
                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                    icon: SvgPicture.asset("assets/images/twitter.svg",
                        color: primaryColor),
                    onPressed: () => launchURL(user.twitter),
                  ),
                  if(user.linkedin!=null &&user.linkedin!.isNotEmpty)
                    IconButton(
                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                    icon: SvgPicture.asset("assets/images/linkedin.svg",
                        color: primaryColor),
                    onPressed: () => launchURL(user.linkedin),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
