import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_events/my_event.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_state.dart';
import 'package:taknikat/Ui/vendor_page/vendor_events/vendor_events_tab.dart';
import 'package:taknikat/Ui/vendor_page/widget/show_all_button.dart';

import '../bloc/vendor_bloc.dart';

class VendorEventsList extends StatelessWidget {
  VendorBloc bloc;
  VendorEventsList(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, VendorState state) {
          return state.events.isNotEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الفعاليات',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        ShowAllButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VendorEventsTab(bloc),
                          )),
                        )
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        children: [
                          ...state.events.map((event) => MyEventItem(event))
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                )
              : Container();
        });
  }
}
