import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_services/my_service.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_state.dart';
import 'package:taknikat/Ui/vendor_page/vendor_services/vendor_services_tab.dart';
import 'package:taknikat/Ui/vendor_page/widget/show_all_button.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/filters/filter_class.dart';
import '../bloc/vendor_bloc.dart';

class VendorServicesList extends StatelessWidget {
  VendorBloc bloc;
  VendorServicesList(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, VendorState state) {
          return state.services.isNotEmpty
              ? 
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getLangLocalization('Services'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        ShowAllButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VendorServicesTab(bloc),
                          )),
                        )
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        children: [
                          ...state.services
                              .map((service) => MyServiceItem(service))
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
