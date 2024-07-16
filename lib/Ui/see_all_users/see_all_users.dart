import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/vendor_page/vendor_profile_page.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/userInfo.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../injectoin.dart';
import 'bloc/see_all_users.dart';
import 'bloc/see_all_users_event.dart';
import 'bloc/see_all_users_state.dart';

class SeeAllUsers extends StatefulWidget {
  SeeAllUsers();

  @override
  _SeeAllUsersState createState() => _SeeAllUsersState();
}

class _SeeAllUsersState extends State<SeeAllUsers> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bloc.add(Getusers((b) => b));
    _listController.addListener(() {
      if (_listController.position.atEdge) {
        if (_listController.position.pixels ==
            _listController.position.maxScrollExtent) {
          _bloc.add(GetNextusers((b) => b));
        }
      }
    });
  }

  int? selectedTap;

  final _bloc = sl<SeeAllUsersBloc>();

  var _listController = ScrollController();
  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, SeeAllUsersState state) {
          return Scaffold(
              appBar: AppBar(
                title: baseText('All Users', textAlign: TextAlign.center),
                backgroundColor: primaryColor,
                // toolbarHeight: sizeAware.height * 0.089999,
                elevation: 0,
              ),
              body: Column(
                children: [
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
                  (state.users != null)
                      ? Expanded(
                          child: SingleChildScrollView(
                            controller: _listController,
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    ...state.users.map((e) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              PageTransition(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  type: PageTransitionType.fade,
                                                  child: VendorProfilePage(e)));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          width: sizeAware.width,
                                          height: sizeAware.height *
                                              0.139047619047619,
                                          child: buildUserInfo(context, e),
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                                state.isLoading
                                    ? Container(
                                        height: sizeAware.height,
                                        width: sizeAware.width,
                                        child: Center(
                                          child: loader(context: context),
                                        ),
                                      )
                                    : state.users.isEmpty
                                        ? Container(
                                            width: sizeAware.width,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: SvgPicture.asset(
                                                    "assets/images/empty_content.svg",
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(20),
                                                  child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(
                                                              "empty Content"),
                                                      style: TextStyle()),
                                                )
                                              ],
                                            ))
                                        : Container()
                              ],
                            ),
                          ),
                        )
                      : state.users.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove_from_queue,
                                  size: 100,
                                  color: primaryColor,
                                ),
                                Text('No Content', style: TextStyle())
                              ],
                            )
                          : Container(),
                ],
              ));
        });
  }
}
