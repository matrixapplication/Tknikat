import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_bloc.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_state.dart';
import 'package:taknikat/Ui/setting_page/my_posts/add_post_screen.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/login_dialog.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/app_localizations.dart';

class WritePostWidget extends StatelessWidget {
  const WritePostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = sl<SettingsBloc>();

    return BlocBuilder<SettingsBloc, SettingsState>(
      bloc: _bloc,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (appUser != null) {
              Navigator.of(context).push(PageTransition(
                  duration: Duration(milliseconds: 700),
                  type: PageTransitionType.fade,
                  child: AddPostScreen(image: state.user.avatar,)));
            } else {
              showLoginFirstDialog(context);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Center(
                    child: CircleAvatar(
                        radius: 25,
                        backgroundImage: (state.user.avatar == null
                                ? AssetImage("assets/images/profile.png")
                                : CachedNetworkImageProvider(
                                    getImagePath(state.user.avatar!)))
                            as ImageProvider),
                  ),

                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: 
                    Container(
                      height: 44.h,
                      margin: 8.paddingEnd,
                      padding: 16.paddingHorizontal+8.paddingVert+5.paddingTop,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.01),
                            blurRadius: 15,
                            offset: Offset(2,6)
                          )
                        ],
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)
                              .translate("typing_here"),
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      )
                    )
                  ),
                 Container(
                   height: 44.h,
                   margin: 8.paddingEnd,
                   padding: 16.paddingHorizontal+8.paddingVert,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                             color: Colors.black.withOpacity(0.01),
                             blurRadius: 15,
                             offset: Offset(2,6)
                         )
                       ],
                       borderRadius: BorderRadius.circular(16)
                   ),
                   child:  SvgPicture.asset(AppImages.image5)
                 )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
