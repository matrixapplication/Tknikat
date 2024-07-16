import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/services_page/widget/list_services.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/model/category_model/category_model.dart';

import '../../core/app_localizations.dart';
import '../../injectoin.dart';
import 'bloc/services_bloc.dart';
import 'bloc/services_event.dart';
import 'bloc/services_state.dart';

class ServicesPage extends StatefulWidget {
  final CategoryModel category;

  ServicesPage(
    this.category,
  );

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>
    with SingleTickerProviderStateMixin {
  final _bloc = sl<ServicesBloc>();
  var _listController = ScrollController();

  @override
  void initState() {
    _bloc.add(GetCategoryServices((b) => b..categoryId = widget.category.id));
    _listController.addListener(() {
      if (_listController.position.atEdge) {
        if (_listController.position.pixels ==
            _listController.position.maxScrollExtent) {
          print('GetNext');
          _bloc.add(GetNext((b) => b..categoryId = widget.category.id));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        buildWhen: (previous, current) =>
            (previous as ServicesState).isLoading !=
            (current as ServicesState).isLoading,
        builder: (BuildContext context, ServicesState state) {
          showToast(state.error);
          return Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false, // this avoids the overflow error
              appBar: AppBar(
                backgroundColor: primaryColor,
                title: baseText(widget.category.name!,
                    color: Color(0xFFFFFFFF), textAlign: TextAlign.center),
                centerTitle: true,
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
                          height: 30,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: sizeAware.height * 0.01,
                              ),
                              Expanded(
                                  child: gridServices(
                                      context,
                                      state.services.toList(),
                                      _listController)),
                              SizedBox(
                                height: sizeAware.height * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  state.isLoading
                      ? Center(
                          child: loader(context: context),
                        )
                      : state.services.isEmpty
                          ? Container(
                              width: sizeAware.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: SvgPicture.asset(
                                      "assets/images/empty_services.svg",
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
                              ))
                          : Container()
                ],
              ));
        });
  }
}
