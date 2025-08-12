import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/AllProducts_WithFilter_page/all_products_page.dart';
import 'package:taknikat/Ui/AllProjects_WithFilter_page/all_projects_page.dart';
import 'package:taknikat/Ui/AllRecentSharesWithFilter/all_recent_shares_page.dart';
import 'package:taknikat/Ui/AllServices_WithFilter_page/all_services_page.dart';
import 'package:taknikat/Ui/home_page/bloc/home_bloc.dart';
import 'package:taknikat/Ui/home_page/bloc/home_event.dart';
import 'package:taknikat/Ui/home_page/bloc/home_state.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/product_item.dart';
import 'package:taknikat/core/base_widget/project_item.dart';
import 'package:taknikat/core/base_widget/service_item.dart';
import 'package:taknikat/core/base_widget/share_card.dart';
import 'package:taknikat/core/carousal.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import '../../auth_screen/page/complete_profile_page.dart';
import '../../setting_page/edit_profile_page/bloc/edit_profile_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = sl<HomeBloc>();

  @override
  void initState() {
    if (!_bloc.state.initialized) {
      _bloc.add(GetAllProducts((b) => b..is_new = 1));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, HomeState state) {
          if (state.error != null)
            return Center(
              child: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    _bloc.add(InitHome());
                  }),
            );
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [

                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      _bloc.retry();
                    },
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Container(
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Column(
                              children: <Widget>[
                                state.newProjects.isNotEmpty
                                    ? Column(
                                        children: [
                                          SeeMoreTitleHolder(
                                            title: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: MainTitle(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        "Recently added business"),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            onSeeMorePressed: () {
                                              Navigator.of(context).push(
                                                  PageTransition(
                                                      duration: Duration(
                                                          milliseconds: 700),
                                                      type: PageTransitionType
                                                          .fade,
                                                      child: AllProjectsPage(
                                                        custom_filter:
                                                            CustomFilter(),
                                                      )));
                                            },
                                          ),
                                          Container(
                                            height: 300,
                                            child: Carousal(
                                              state.newProjects
                                                  .map((item) =>
                                                      ProjectItem(item))
                                                  .toList(),
                                              maxCrossAxisExtent: 300,
                                              childAspectRatio: 1.6,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),

                                // state.vendors != null &&
                                //         state.vendors.content.isNotEmpty
                                //     ? Column(
                                //         children: [
                                //           listVendors(context, state.vendors),
                                //           SizedBox(
                                //             height: sizeAware.height * 0.035543,
                                //           ),
                                //         ],
                                //       )
                                //     : Container(),

                                state.newProducts.isNotEmpty
                                    ? Column(
                                        children: [

                                          SeeMoreTitleHolder(
                                            title: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: MainTitle(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        "Recently Added Products"),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            onSeeMorePressed: () {
                                              Navigator.of(context).push(
                                                  PageTransition(
                                                      duration: Duration(
                                                          milliseconds: 700),
                                                      type: PageTransitionType
                                                          .fade,
                                                      child: AllProductsPage(
                                                        custom_filter:
                                                            CustomFilter(
                                                                search: ""),
                                                        title: '',
                                                      )));
                                            },
                                          ),
                                          Container(
                                            height: 300,
                                            child: Carousal(
                                              state.newProducts
                                                  .map((item) =>
                                                      ProductItem(item))
                                                  .toList(),
                                              maxCrossAxisExtent: 300,
                                              childAspectRatio: 1.6,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),

                                state.newServices.isNotEmpty
                                    ? Column(
                                        children: [
                                          SeeMoreTitleHolder(
                                            title: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: MainTitle(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        "Recently Added Services"),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            onSeeMorePressed: () {
                                              Navigator.of(context).push(
                                                  PageTransition(
                                                      duration: Duration(
                                                          milliseconds: 700),
                                                      type: PageTransitionType
                                                          .fade,
                                                      child: AllServicesPage(
                                                        custom_filter:
                                                            CustomFilter(
                                                                search: ""),
                                                      )));
                                            },
                                          ),
                                          Container(
                                            height: 300,
                                            child: Carousal(
                                              state.newServices
                                                  .map((item) =>
                                                      ServiceItem(item))
                                                  .toList(),
                                              maxCrossAxisExtent: 300,
                                              childAspectRatio: 1.6,
                                            ),
                                          ),
                                          SizedBox(
                                            height: sizeAware.height * 0.035543,
                                          ),
                                        ],
                                      )
                                    : Container(),

                                state.newShares.isNotEmpty
                                    ? Column(
                                        children: [
                                          SeeMoreTitleHolder(
                                            title: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              child: MainTitle(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        "Recently Added Shares"),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            onSeeMorePressed: () async {
                                              Navigator.of(context).push(
                                                  PageTransition(
                                                      duration: Duration(
                                                          milliseconds: 700),
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          AllRecentSharesPage(
                                                        custom_filter:
                                                            CustomFilter(
                                                                search: ""),
                                                      )));
                                            },
                                          ),
                                          Container(
                                            height: 225,
                                            child: Carousal(
                                              state.newShares
                                                  .map(
                                                      (item) => ShareItem(item))
                                                  .toList(),
                                              maxCrossAxisExtent: 300,
                                              childAspectRatio: 1.2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: sizeAware.height * 0.035543,
                                          ),
                                        ],
                                      )
                                    : Container(),

                                // state.productCategoryModel != null &&
                                //         state
                                //             .productCategoryModel.content.isNotEmpty
                                //     ? Column(
                                //         children: [
                                //           listRetails(context,
                                //               state.productCategoryModel.content),
                                //           SizedBox(
                                //             height: sizeAware.height * 0.035543,
                                //           ),
                                //         ],
                                //       )
                                //     : Container(),
                              ],
                            ),
                            state.isLoading
                                ? Positioned.fill(
                                    child: Center(
                                        child: loader(
                                      context: context,
                                    )),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class SeeMoreTitleHolder extends StatelessWidget {
  final Widget title;
  final VoidCallback onSeeMorePressed;
  const SeeMoreTitleHolder({
    Key? key,
    required this.title,
    required this.onSeeMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title,
        Container(
          margin: EdgeInsetsDirectional.only(top: 13, end: 13),
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
            onPressed: onSeeMorePressed,
            child: Text(AppLocalizations.of(context).translate("see all")),
          ),
        )
      ],
    );
  }
}
