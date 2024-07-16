import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:taknikat/Ui/base_page/navigation_bar_provider.dart';
import 'package:taknikat/Ui/setting_page/profile_screen.dart';
import 'package:taknikat/Ui/vendor_page/vendor_profile_page.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/user_model/user_model.dart';

Future<void> showProfile(dynamic id, BuildContext context) async {
  BotToast.showLoading();
  final UserModel user = await sl<Repository>().getUserById(id);
  if (user == appUser) {
    // context.read<BottomNavigationProvider>().index = 3;
    Navigator.of(context).push(
      PageTransition(
          duration: Duration(milliseconds: 700),
          type: PageTransitionType.fade,
          child: ProfileScreen(
            user: user,
          )),
    );
  } else {
    Navigator.of(context).push(
      PageTransition(
          duration: Duration(milliseconds: 700),
          type: PageTransitionType.fade,
          child: VendorProfilePage(user)),
    );
  }
  BotToast.closeAllLoading();
}
