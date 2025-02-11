import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/core/extensions/extensions.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../core/base_widget/service_item.dart';
import '../../../core/constent.dart';
import '../../../core/style/custom_loader.dart';
import '../../../injectoin.dart';
import '../my_services/bloc/my_services_bloc.dart';
import '../my_services/bloc/my_services_event.dart';
import '../my_services/bloc/my_services_state.dart';
import '../my_services/my_services_page.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sl<MyServicesBloc>().add(GetMyServices());

    return BlocBuilder(
        bloc: sl<MyServicesBloc>(),
        builder: (BuildContext context, MyServicesState state) {
          return Stack(
            children: [
              RefreshIndicator(
                color: primaryColor,
                onRefresh: () async {
                  sl<MyServicesBloc>().add(GetMyServices());
                },
                child: Container(
                  height: sizeAware.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .translate("Services"),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            if(!state.isLoading && (state.myServices.content?.isNotEmpty??false))
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
                        state.myServices.content?.isNotEmpty ?? false
                            ? Container(
                            margin: EdgeInsets.all(5),
                            child: GridView.count(
                              padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics:
                                NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                childAspectRatio: 0.630,
                                crossAxisSpacing: 10.0,
                                children: List.generate(
                                    state.myServices.content!
                                        .length, (index) {
                                  return ServiceItem(
                                    state
                                        .myServices.content![index],
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
                  : state.myServices.content?.isEmpty??false
                  ?
              Container(
                  width: sizeAware.width,
                  // height: sizeAware.height * 0.8,
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
                              .translate("not_found_service"),
                          style: TextStyle(),
                        ),
                      )
                    ],
                  ))
                  : Container()
            ],
          );
        });
  }
}
