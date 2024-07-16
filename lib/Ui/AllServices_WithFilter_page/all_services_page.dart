import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/filter_screen/filterScreen.dart';
import 'package:taknikat/Ui/services_page/widget/list_services.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../core/app_localizations.dart';
import '../../injectoin.dart';
import 'bloc/all_services_bloc.dart';
import 'bloc/all_services_event.dart';
import 'bloc/all_services_state.dart';

// this class is used by filtering + see all New product + see all On Sale

class AllServicesPage extends StatefulWidget {
  final CustomFilter custom_filter;
  final String? title;

  AllServicesPage({required this.custom_filter, this.title});

  @override
  _AllServicesPageState createState() => _AllServicesPageState();
}

class _AllServicesPageState extends State<AllServicesPage> {
  final _bloc = sl<AllServicesBloc>();
  var _listController = ScrollController();
  CustomFilter _filter = new CustomFilter();

  @override
  void initState() {
    _filter = widget.custom_filter;
    _searchController.text = widget.custom_filter.search ?? '';

    _bloc.add(GetAllServices((b) => b..customFilter = _filter));
    _listController.addListener(() {
      if (_listController.position.atEdge) {
        if (_listController.position.pixels ==
            _listController.position.maxScrollExtent) {
          print('GetNext');
          _bloc.add(GetNext((b) => b..customFilter = _filter));
        }
      }
    });
    _searchController.addListener(() {
      _filter = _filter.copyWith(search: _searchController.text);
    });
    super.initState();
  }

  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, AllServicesState state) {
          return Scaffold(
              resizeToAvoidBottomInset: false, // this avoids the overflow error

              appBar: AppBar(
                backgroundColor: primaryColor,
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                  margin: EdgeInsets.all(13),
                  padding: EdgeInsets.symmetric(horizontal: 13),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      _bloc.add(
                          GetAllServices((b) => b..customFilter = _filter));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Icon(
                        Icons.search_outlined,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
                centerTitle: true,
                titleSpacing: 4,
                elevation: 0,
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          color: primaryColor,
                          child: Column(
                            children: [
                              Container(
                                height: (sizeAware.height * 0.098483412322275) /
                                    1.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              baseText(
                                  AppLocalizations.of(context)
                                      .translate("Search Result"),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(PageTransition(
                                          duration:
                                              Duration(milliseconds: 1000),
                                          type: PageTransitionType.fade,
                                          child: FilterScreen(
                                            _filter,
                                          )))
                                      .then((value) {
                                    if (value != null) {
                                      _filter = value;
                                      _bloc.add(GetAllServices(
                                          (b) => b..customFilter = value));
                                    }
                                  });
                                },
                                child: baseText(
                                  AppLocalizations.of(context)
                                      .translate("Filter Result"),
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      (state.services != null && state.services.isNotEmpty)
                          ? Expanded(
                              child: gridServices(context,
                                  state.services.toList(), _listController),
                            )
                          : Container(),
                    ],
                  ),
                  state.isLoading
                      ? Center(
                          child: loader(context: context),
                        )
                      : state.services.isEmpty
                          ? Center(
                              child: Container(
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
                                                .translate("empty Content"),
                                            style: TextStyle()),
                                      )
                                    ],
                                  )),
                            )
                          : Container()
                ],
              ));
        });
  }
}
