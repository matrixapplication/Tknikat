import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_shares/bloc/my_shares_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_approved_shares.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_pending_shares.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_unapproved_shares.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';

import '../../../injectoin.dart';

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
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: baseText('مشاركاتي', color: Colors.white),
          elevation: 0,
          centerTitle: true,
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
                        baseText('موافقة', color: Colors.black),
                        baseText('انتظار الموافقة', color: Colors.black),
                        baseText('مرفوض', color: Colors.black),
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
      ),
    );
  }
}
