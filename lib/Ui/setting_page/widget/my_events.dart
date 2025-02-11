import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/core/extensions/extensions.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../core/base_widget/event_item.dart';
import '../../../core/constent.dart';
import '../../../core/style/custom_loader.dart';
import '../../../injectoin.dart';
import '../../vendor_page/widget/show_all_button.dart';
import '../my_events/bloc/my_events_bloc.dart';
import '../my_events/bloc/my_events_event.dart';
import '../my_events/bloc/my_events_state.dart';
import '../my_events/my_events_page.dart';
import '../my_projects/my_projects_page.dart';

class MyEvents extends StatelessWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = sl<MyEventsBloc>();

    return  BlocBuilder<MyEventsBloc, MyEventsState>(
      bloc: sl<MyEventsBloc>(),
      builder: (context, state) {

        return Stack(
          children: [
            RefreshIndicator(
                color: primaryColor,
                onRefresh: () async {
                  bloc.add(GetMyEvents((b) => b..page = 1));
                },
                child:
                Container(
                  height: sizeAware.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .translate("Events"),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            if(!state.isLoading && state.myEvents.isNotEmpty)
                              ShowAllButton(
                              onPressed: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyEventsPage(),
                                  )),
                            )
                          ],
                        ),

                        state.myEvents != null &&
                            state.myEvents.isNotEmpty
                            ?
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: GridView.count(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics:
                                NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                childAspectRatio: 0.630,
                                crossAxisSpacing: 10.0,
                                children: List.generate(
                                    state.myEvents.length,
                                        (index) {
                                      return EventItem(
                                        state.myEvents[index],
                                        isMine: true,
                                      );
                                    })))
                            : Container()
                      ],
                    ),
                  ),
                ),


              // PagedListView.separated(
              //   separatorBuilder: (context, index) => SizedBox(height: 16),
              //   pagingController: bloc.pagingController!,
              //   builderDelegate: PagedChildBuilderDelegate<EventModel>(
              //     noItemsFoundIndicatorBuilder: (context) => Center(
              //       child: Text(
              //         AppLocalizations.of(context).translate("no events"),
              //       ),
              //     ),
              //     itemBuilder: (context, item, index) {
              //       return SlidStaggeredListAnimation(
              //         index: index,
              //         child:
              //        Container(
              //          height: 100,
              //          width: 100,
              //          child:  EventItem(
              //            item,
              //            isMine: true,
              //          ),
              //        )
              //       );
              //     },
              //   ),
              // ),
            ),
            if (state.isLoading)
              Center(child: loader(context: context)),
            if (state.myEvents.isEmpty && !state.isLoading)
              Container(
                  width: sizeAware.width,
                  // height: sizeAware.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      40.height,
                      Center(
                        child: SvgPicture.asset(
                          AppImages.noFoundData,

                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          AppLocalizations.of(context)
                              .translate("not_found_event"),
                          style: TextStyle(),
                        ),
                      )
                    ],
                  ))


          ],
        );
      },
    );
  }
}
