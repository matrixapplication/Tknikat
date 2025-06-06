import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_services/add_service_screen.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_state.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/service_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../injectoin.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'bloc/my_services_bloc.dart';
import 'bloc/my_services_event.dart';

class MyServicesPage extends StatefulWidget {
  @override
  _MyServicesPageState createState() => _MyServicesPageState();
}

class _MyServicesPageState extends State<MyServicesPage> {
  @override
  void initState() {
    sl<MyServicesBloc>().add(GetMyServices());
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: AddServiceScreen()));
        },
        backgroundColor: primaryColor,
        shape: CircleBorder(),
        mini: false,
        child:Icon(Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: BlocBuilder(
          bloc: sl<MyServicesBloc>(),
          builder: (BuildContext context, MyServicesState state) {
            return Stack(
              children: [
                SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
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
                          40.height,
                          AuthHeaderWidget(title: AppLocalizations.of(context).translate("Services"),hasLogo: false),
                          state.myServices.content?.isNotEmpty ?? false
                              ? Container(
                              margin: EdgeInsets.all(5),
                              child: GridView.count(
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
                                .translate("not_found_service"),
                            style: TextStyle(),
                          ),
                        )
                      ],
                    ))
                    : Container()
              ],
            );
          }),
    );
  }
}
