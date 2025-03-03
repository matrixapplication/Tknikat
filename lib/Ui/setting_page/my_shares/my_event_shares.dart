import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/all_shares_page/bloc/shares_bloc.dart';
import 'package:taknikat/Ui/create_share_page/create_share_page.dart';
import 'package:taknikat/Ui/share_content_page/share_content_page.dart';
import 'package:taknikat/app/slide_animation.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/share_content_card.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../injectoin.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';

class MyEventShares extends StatefulWidget {
  final EventModel event;

  const MyEventShares({Key? key, required this.event}) : super(key: key);

  @override
  State<MyEventShares> createState() => _MyEventSharesPageState();
}

class _MyEventSharesPageState extends State<MyEventShares>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SharesBloc>(
      create: (context) => sl<SharesBloc>()..eventId = widget.event.id!,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: primaryColor,
        //   title: baseText(
        //       AppLocalizations.of(context).translate("All Shares"), color: Colors.white),
        //   elevation: 0,
        //   centerTitle: true,
        // ),
        body:
        Stack(
          children: [
            SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),

            Column(
              children: [
                40.height,
                AuthHeaderWidget(
                  title: AppLocalizations.of(context).translate("All Shares"),hasLogo: false,
                ),
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
                            baseText(
                                AppLocalizations.of(context).translate("approval")
                                , color: Colors.black),
                            baseText(
                                AppLocalizations.of(context).translate("Waiting for approval")
                                , color: Colors.black),
                            baseText(
                                AppLocalizations.of(context).translate("rejected")
                                , color: Colors.black),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              MyEventsSpecificShares(
                                  event: widget.event,
                                  status: ShareStatus.approved),
                              MyEventsSpecificShares(
                                  event: widget.event, status: ShareStatus.pending),
                              MyEventsSpecificShares(
                                  event: widget.event,
                                  status: ShareStatus.unapproved),
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

class MyEventsSpecificShares extends StatefulWidget {
  final EventModel event;
  final ShareStatus status;

  const MyEventsSpecificShares(
      {Key? key, required this.event, required this.status})
      : super(key: key);

  @override
  State<MyEventsSpecificShares> createState() => _MyEventsSpecificSharesState();
}

class _MyEventsSpecificSharesState extends State<MyEventsSpecificShares> {
  late var bloc = context.read<SharesBloc>();

  @override
  void initState() {
    bloc = context.read<SharesBloc>();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(SharesFetched(page: 0));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PagedListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 16,
          ),
          pagingController: bloc.pagingController,
          builderDelegate: PagedChildBuilderDelegate<ShareModel>(
            noItemsFoundIndicatorBuilder: (context) => Center(
              child: Text(
                  AppLocalizations.of(context).translate("no shares")
                ),
            ),
            itemBuilder: (context, item, index) {
              return SlidStaggeredListAnimation(
                index: index,
                child: (item.status == widget.status)
                    ? ShareContentCard(
                        share: item,
                        event: item.event!,
                        onTap: () async {
                          await _onSharePressed(item, context);
                        },
                      )
                    : SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future _onSharePressed(ShareModel item, BuildContext context) async {
    var user = await sl<PrefsHelper>().getUserOrNull();
    print('ddddddddddff ${item.user.id == user?.id}');
    if (item.user.id == user?.id) {
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 700),
          type: PageTransitionType.fade,
          child: CreateEditSharePage(
            event: widget.event,
            shareModel: item,
          ),
        ),
      );
    } else {
      print('event: ${widget.event}');
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 700),
          type: PageTransitionType.fade,
          child: ShareContentPage(
            share: item,
            event: widget.event,
          ),
        ),
      );
    }
  }
}
