import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_events/add_event_screen.dart';
import 'package:taknikat/Ui/setting_page/my_events/my_event.dart';
import 'package:taknikat/Ui/setting_page/my_events/my_events_page.dart';
import 'package:taknikat/Ui/setting_page/my_products/my_products_page.dart';
import 'package:taknikat/Ui/setting_page/widget/show_all_button.dart';

import '../../../core/app_localizations.dart';
import '../../../injectoin.dart';
import 'bloc/my_events_bloc.dart';
import 'bloc/my_events_event.dart';
import 'bloc/my_events_state.dart';

class MyEventList extends StatefulWidget {
  @override
  _MyEventListState createState() => _MyEventListState();
}

class _MyEventListState extends State<MyEventList> {
  @override
  void initState() {
    // sl<MyEventsBloc>().add(GetMyEvents((b) => b..page = 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: sl<MyEventsBloc>(),
        builder: (BuildContext context, MyEventsState state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)
                        .translate("Events"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  ShowAllButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyEventsPage(),
                    )),
                  )
                ],
              ),
              Container(
                  height: 200,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 105,
                            height: 135,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(15, 52, 157, 216),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(PageTransition(
                                      duration: Duration(milliseconds: 700),
                                      type: PageTransitionType.fade,
                                      child: AddEventScreen()));
                                },
                                icon: SvgPicture.asset(
                                    "assets/images/addButton.svg"),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(context)
                                .translate("Add_event"),
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 13),
                      ...state.myEvents.map((event) => MyEventItem(event)),
                    ],
                    scrollDirection: Axis.horizontal,
                  )),
            ],
          );
        });
  }
}
