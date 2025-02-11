import 'package:flutter/material.dart';
import 'package:taknikat/Ui/auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'package:taknikat/Ui/sheets/dropdown_entity.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import '../../core/assets_image/app_images.dart';
import '../../core/widgets/dialog/show_delete_account_dialog.dart';
import '../../core/widgets/dialog/show_logout_dialog.dart';
import '../base_page/widgets/drawer_item.dart';
import '../sheets/change_langauge/change_langauge_picker_sheet.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String languageCode = myLocale.languageCode;
    DropDownEntity? selectLanguage =languageCode == "ar"?languageList[0]:languageList[1];
    return  Scaffold(
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child:
            Column(
              children: [
                20.height,
                AuthHeaderWidget(
                  horizontal: 0,
                  title: getLangLocalization('Settings'),hasLogo: false,),
                30.height,
                // DrawerItem(
                //     onTap: () {
                //
                //     },
                //     image: AppImages.password5,
                //     title: getLangLocalization('Manage Password')
                //     ),
                // 8.height,
                DrawerItem(
                    onTap: () {
                      showChangeLanguagePicker(context,
                          defaultList:languageList,
                          defaultValue: selectLanguage,
                          isMultiChoice: false);
                    },
                    image: AppImages.langauge5,
                    title: getLangLocalization('Language')

                ),
                8.height,

                DrawerItem(
                    onTap: () {
                      showDeleteAccountDialog(context);
                    },
                    image: AppImages.account5,
                    title: getLangLocalization('Delete Account')
                    ),
                8.height,

                DrawerItem(
                    color: Colors.red,
                    onTap: () {
                      showLogOutDialog(context);
                    },
                    image: AppImages.logout5,
                    title: getLangLocalization('Log Out')
                ),
              ],
            )
        )
    );
  }

  List<DropDownEntity> languageList=[DropDownEntity(id: 1, title: 'العربية'),DropDownEntity(id: 2, title: 'English')];

}
