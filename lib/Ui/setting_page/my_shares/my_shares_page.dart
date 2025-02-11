import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/Ui/setting_page/my_shares/bloc/my_shares_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_approved_shares.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_pending_shares.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_unapproved_shares.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../injectoin.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';

class MySharesPage extends StatefulWidget {
  const MySharesPage({Key? key}) : super(key: key);

  @override
  State<MySharesPage> createState() => _MySharesPageState();
}

class _MySharesPageState extends State<MySharesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final bloc = sl<MySharesBloc>();

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MySharesBloc>(
      create: (context) => sl(),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: primaryColor,
        //   title: baseText('مشاركاتي', color: Colors.white),
        //   elevation: 0,
        //   centerTitle: true,
        // ),
        body:
        Stack(
          children: [
            SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
            Column(
              children: [
                // ClipPath(
                //   clipper: CustomClipPath(),
                //   child: Container(
                //     color: primaryColor,
                //     child: Column(
                //       children: [
                //         Container(height: 20),
                //       ],
                //     ),
                //   ),
                // ),
                40.height,
                AuthHeaderWidget(title:
                 getLangLocalization('myShare'),hasLogo: false,),

                20.height,
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 13),
                        // alignment: Alignment.bottomCenter,
                        height: 40,
                        child: TabBar(

                          controller: _tabController,
                          indicatorColor: primaryColor,
                          isScrollable: true,
                          tabs: [
                            baseText(getLangLocalization('approval'), color: _tabController.index==0?primaryColor:Colors.black),
                            baseText(getLangLocalization('Waiting for approval'), color: _tabController.index==1?primaryColor:Colors.black),
                            baseText(getLangLocalization('rejected'), color:_tabController.index==2?primaryColor: Colors.black),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              MyApprovedShares(),
                              MyPendingShares(),
                              MyUnapprovedShares()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
