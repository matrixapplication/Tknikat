import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/setting_page/profile_page.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/user_model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;
  const ProfileScreen({Key? key , required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: baseText(user.firstName!.trim() + " " + user.lastName!.trim(),
            color: Colors.white),
        // automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(sizeAware.width, 20),
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                color:
                    // ? Colors.transparent
                    Colors.white,
              )),
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
            ],
          ),
        ),
      ),
      body: ProfilePage(),
    );
  }
}
