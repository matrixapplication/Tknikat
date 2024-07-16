import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/create_share_page/create_share_page.dart';
import 'package:taknikat/Ui/share_content_page/share_content_page.dart';
import 'package:taknikat/app/slide_animation.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/share_content_card.dart';
import 'package:taknikat/core/filters/shares_filter.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../../injectoin.dart';
import 'bloc/shares_bloc.dart';

class AllSharesPage extends StatelessWidget {
  const AllSharesPage({
    Key? key,
    required this.event,
  }) : super(key: key);
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final colorSc = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorSc.primary,
        title: Container(
          margin: EdgeInsets.all(13),
          child: Text(
              AppLocalizations.of(context).translate("All Shares")),
          // width: sizeAware.width * 0.282051282051282,
          // child: SvgPicture.asset(
          //   "assets/images/logo-white.svg",
          //   color: Colors.white,
          //   height: sizeAware.height * 0.050090047393365,
          // ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_outlined),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return BlocProvider.value(
                      value: sl<SharesBloc>(), child: FilterEventsDialog());
                },
              );
            },
          ),
        ],
        centerTitle: true,
        titleSpacing: 4,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => sl<SharesBloc>()..eventId = event.id!,
        child: Builder(
          builder: (context) {
            final bloc = context.read<SharesBloc>();
            return Column(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  // child: Container(
                  //   color: primaryColor,
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         width: double.infinity,
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             Navigator.of(context).push(PageTransition(
                  //                 duration: Duration(milliseconds: 700),
                  //                 type: PageTransitionType.fade,
                  //                 child: EventContentPage(event)));
                  //           },
                  //           child: Align(
                  //             alignment: Alignment.bottomCenter,
                  //             child: Text(
                  //               event.name,
                  //               style: TextStyle(
                  //                   fontSize: 18,
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //           ),
                  //         ),
                  //         padding: EdgeInsets.only(bottom: 16),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24),
                //   child: Row(
                //     children: [
                //       Container(
                //           alignment: AlignmentDirectional.topStart,
                //           child: MainTitle(
                //             AppLocalizations.of(context)
                //                 .translate("All Shares"),
                //             height: 30,
                //           )),
                //       Spacer(),
                //  IconButton(
                //         icon: Icon(Icons.sort_outlined),
                //         onPressed: () {
                //           showDialog(
                //             context: context,
                //             builder: (_) {
                //               return BlocProvider.value(
                //                   value: bloc, child: FilterEventsDialog());
                //             },
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 12,
                // ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.pagingController.refresh();
                    },
                    child: PagedListView.separated(
                      // padding: EdgeInsets.all(24),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 16,
                      ),
                      pagingController: bloc.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<ShareModel>(
                        noItemsFoundIndicatorBuilder: (context) => Center(
                          child: Text(
                              AppLocalizations.of(context).translate("no shares")),
                        ),
                        itemBuilder: (context, item, index) {
                          return SlidStaggeredListAnimation(
                            index: index,
                            child: ShareContentCard(
                              share: item,
                              event: item.event!,
                              onTap: () async {
                                await _onSharePressed(item, context);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future _onSharePressed(ShareModel item, BuildContext context) async {
    var user = await sl<PrefsHelper>().getUserOrNull();
    if (item.user.id == user?.id) {
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 700),
          type: PageTransitionType.fade,
          child: CreateEditSharePage(
            event: event,
            shareModel: item,
          ),
        ),
      );
    } else {
      print('event: $event');
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(milliseconds: 700),
          type: PageTransitionType.fade,
          child: ShareContentPage(
            share: item,
            event: event,
          ),
        ),
      );
    }
  }
}

class FilterEventsDialog extends StatelessWidget {
  const FilterEventsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SharesBloc>();
    final filter = bloc.state.filter;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context).translate('Sort'),
              style: Theme.of(context).textTheme.headline6,
            ),
            CheckboxListTile(
                value: filter.ordering == ShareOrdering.desc,
                title:
                    Text(AppLocalizations.of(context).translate('new first')),
                onChanged: (value) {
                  _filter(bloc, filter, ShareOrdering.desc, context);
                }),
            CheckboxListTile(
                value: filter.ordering == ShareOrdering.asc,
                title:
                    Text(AppLocalizations.of(context).translate('old first')),
                onChanged: (value) {
                  _filter(bloc, filter, ShareOrdering.asc, context);
                }),
            // CheckboxListTile(
            //     title: Text(
            //         AppLocalizations.of(context).translate('Most Interactive')),
            //     value: filter.ordering == ShareOrdering.mostInteractive,
            //     onChanged: (value) {
            //       _filter(bloc, filter, ShareOrdering.mostInteractive, context);
            //     }),
            // CheckboxListTile(
            //     value: filter.ordering == ShareOrdering.mostViewed,
            //     title:
            //         Text(AppLocalizations.of(context).translate('Most Viewed')),
            //     onChanged: (value) {
            //       _filter(bloc, filter, ShareOrdering.mostViewed, context);
            //     }),
          ],
        ),
      ),
    );
  }

  void _filter(SharesBloc bloc, SharesFilter filter, ShareOrdering ordering,
      BuildContext context) {
    bloc.add(
      SharesFilterChanged(
        filter.copyWith(ordering: ordering),
      ),
    );
    Navigator.pop(context);
  }
}
