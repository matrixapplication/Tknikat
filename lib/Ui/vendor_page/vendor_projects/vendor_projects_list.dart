import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_projects/my_project.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_state.dart';
import 'package:taknikat/Ui/vendor_page/vendor_products/vendor_products_tab.dart';
import 'package:taknikat/Ui/vendor_page/vendor_projects/vendor_projects_tab.dart';
import 'package:taknikat/Ui/vendor_page/widget/show_all_button.dart';
import 'package:taknikat/injectoin.dart';

import '../bloc/vendor_bloc.dart';

class VendorProjectsList extends StatelessWidget {
  VendorBloc bloc;
  VendorProjectsList(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, VendorState state) {
          return state.projects.isNotEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'معرض الاعمال',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        ShowAllButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VendorProjectsTab(bloc),
                          )),
                        )
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        children: [
                          ...state.projects
                              .map((project) => MyProjectItem(project))
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
