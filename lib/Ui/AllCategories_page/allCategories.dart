import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/AllProducts_WithFilter_page/all_products_page.dart';
import 'package:taknikat/Ui/AllServices_WithFilter_page/all_services_page.dart';
import 'package:taknikat/Ui/all_events_page/all_events_page.dart';
import 'package:taknikat/Ui/events_content_page/events_content_page.dart';
import 'package:taknikat/Ui/retails_page/retails_page.dart';
import 'package:taknikat/Ui/services_page/services_page.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/carousal.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

import '../setting/menu_screen.dart';
import '../setting/categories_screen.dart';
import 'bloc/all_categories_bloc.dart';
import 'bloc/all_categories_event.dart';
import 'bloc/all_categories_state.dart';

class AllCategoriesPage extends StatefulWidget {
  @override
  _AllCategoriesPageState createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  final _bloc = sl<AllCategoriesBloc>();
  @override
  void initState() {
    if (!_bloc.state.initialized) _bloc.add(GetCategories((b) => b));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, AllCategoriesState state) {
          showToast(state.error);
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());
          return state.isLoading
              ? Center(child: loader(context: context))
              : Container(
                  height: sizeAware.height,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          _bloc.add(InitCategories());
                        },
                        child:

                        SingleChildScrollView(
                          child: Column(
                            children: [
                              // ClipPath(
                              //   clipper: CustomClipPath(),
                              //   child: Container(
                              //     color: primaryColor,
                              //     child: Column(
                              //       children: [
                              //         Container(height: 20),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    child: MainTitle(
                                      AppLocalizations.of(context)
                                          .translate("Services"),
                                      height: 30,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 13, end: 13),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(8)),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            PageTransition(
                                                duration:
                                                    Duration(milliseconds: 700),
                                                type: PageTransitionType.fade,
                                                child: AllServicesPage(
                                                  custom_filter:
                                                      CustomFilter(search: ""),
                                                )));
                                      },
                                      child: Text(AppLocalizations.of(context)
                                          .translate("see all")),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 200,
                                child: Carousal(
                                  state.servicesCategories
                                      .map(
                                        (item) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                PageTransition(
                                                    duration: Duration(
                                                        milliseconds: 700),
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: ServicesPage(item)));
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: CachedNetworkImage(
                                                  placeholderFadeInDuration:
                                                      Duration(seconds: 1),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Container(
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              color: othercolor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: Icon(
                                                              Icons.error)),
                                                  placeholder: (_, __) =>
                                                      ImagePlaceholder
                                                          .rectangular(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                  imageUrl: getImagePath(
                                                      item.image.toString()),
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  item.name!,
                                                  style: styleTitle,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1.07,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    child: MainTitle(
                                      AppLocalizations.of(context)
                                          .translate("Products"),
                                      height: 30,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 13, end: 13),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(8)),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            PageTransition(
                                                duration:
                                                    Duration(milliseconds: 700),
                                                type: PageTransitionType.fade,
                                                child: AllProductsPage(
                                                  custom_filter:
                                                      CustomFilter(search: ""),
                                                  title: '',
                                                )));
                                      },
                                      child: Text(AppLocalizations.of(context)
                                          .translate("see all")),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 200,
                                child: Carousal(
                                  state.productsCategories
                                      .map(
                                        (item) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                PageTransition(
                                                    duration: Duration(
                                                        milliseconds: 700),
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: RetailsPage(item)));
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: CachedNetworkImage(
                                                  placeholderFadeInDuration:
                                                      Duration(seconds: 1),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Container(
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              color: othercolor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: Icon(
                                                              Icons.error)),
                                                  placeholder: (_, __) =>
                                                      ImagePlaceholder
                                                          .rectangular(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                  imageUrl: getImagePath(
                                                      item.image.toString()),
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  item.name!,
                                                  style: styleTitle,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1.07,
                                ),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    child: MainTitle(
                                      AppLocalizations.of(context)
                                          .translate("Events"),
                                      height: 30,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 13, end: 13),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(8)),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            PageTransition(
                                                duration:
                                                    Duration(milliseconds: 700),
                                                type: PageTransitionType.fade,
                                                child: AllEventPage()));
                                      },
                                      child: Text(AppLocalizations.of(context)
                                          .translate("see all")),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 200,
                                child: Carousal(
                                  state.projectsEvents
                                      .map(
                                        (item) => GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                PageTransition(
                                                    duration: Duration(
                                                        milliseconds: 700),
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: EventContentPage(
                                                        item)));
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: CachedNetworkImage(
                                                  placeholderFadeInDuration:
                                                      Duration(seconds: 1),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: othercolor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Icon(
                                                              Icons.error)),
                                                  placeholder: (_, __) =>
                                                      ImagePlaceholder
                                                          .rectangular(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                  imageUrl: getImagePath(
                                                      item.image.toString()),
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  item.name!,
                                                  style: styleTitle,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1.07,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // CategoriesScreen()
                      )),
                );
        });
    // return MenuScreen();
  }
}
