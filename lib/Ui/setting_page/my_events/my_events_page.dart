import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_events/add_event_screen.dart';
import 'package:taknikat/Ui/setting_page/my_events/my_event.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/event_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../../core/app_localizations.dart';
import '../../../injectoin.dart';
import 'bloc/my_events_bloc.dart';
import 'bloc/my_events_event.dart';
import 'bloc/my_events_state.dart';

class MyEventsPage extends StatefulWidget {
  @override
  _MyEventsPageState createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  @override
  void initState() {
    sl<MyEventsBloc>().add(GetMyEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: baseText(AppLocalizations.of(context)
            .translate("Events"), color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: AddEventScreen()));
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
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
            child: BlocBuilder(
                bloc: sl<MyEventsBloc>(),
                builder: (BuildContext context, MyEventsState state) {
                  return Stack(
                    children: [
                      RefreshIndicator(
                        color: primaryColor,
                        onRefresh: () async {
                          sl<MyEventsBloc>().add(GetMyEvents());
                        },
                        child: Container(
                          height: sizeAware.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                state.myEvents.isNotEmpty?
                                Container(
                                        margin: EdgeInsets.all(5),
                                        child: GridView.count(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            crossAxisCount: 2,
                                            // childAspectRatio: 0.630,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            children: List.generate(
                                                state.myEvents.length, (index) {
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
                      ),
                      state.isLoading
                          ? Center(child: loader(context: context))
                          : state.myEvents.isEmpty
                              ? Container(
                                  width: sizeAware.width,
                                  height: sizeAware.height * 0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          AppLocalizations.of(context)
                                              .translate("not_found_event"),
                                          style: TextStyle(),
                                        ),
                                      )
                                    ],
                                  ))
                              : Container()
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
