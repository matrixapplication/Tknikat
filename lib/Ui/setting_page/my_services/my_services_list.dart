import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_event.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_state.dart';
import 'package:taknikat/Ui/setting_page/my_services/my_service.dart';
import 'package:taknikat/Ui/setting_page/my_services/my_services_page.dart';

import '../../../core/app_localizations.dart';
import '../../../injectoin.dart';
import 'add_service_screen.dart';

class MyServiceList extends StatefulWidget {
  @override
  _MyServiceListState createState() => _MyServiceListState();
}

class _MyServiceListState extends State<MyServiceList> {
  @override
  void initState() {
    sl<MyServicesBloc>().add(GetMyServices());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: sl<MyServicesBloc>(),
        builder: (BuildContext context, MyServicesState state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)
                        .translate("Services"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          // foregroundColor: primaryColor,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              fontFamily: 'Tajawal')),
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyServicesPage(),
                          )),
                      child: Text(
                          AppLocalizations.of(context)
                              .translate("display all"),))
                ],
              ),
              Container(
                height: 200,
                child: state.myServices.content?.isNotEmpty ?? false
                    ? ListView(
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
                                          child: AddServiceScreen()));
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/images/addButton.svg"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'اضافة خدمة',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width: 13),
                          ...state.myServices.content!
                              .map((service) => MyServiceItem(service))
                        ],
                        scrollDirection: Axis.horizontal,
                      )
                    : Column(
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
                                      child: AddServiceScreen()));
                                },
                                icon: SvgPicture.asset(
                                    "assets/images/addButton.svg"),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            AppLocalizations.of(context)
                                .translate("Add_service"),
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
              ),
            ],
          );
        });
  }
}
