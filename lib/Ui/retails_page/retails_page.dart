import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/list_products.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/category_model/category_model.dart';

import 'bloc/retails_bloc.dart';
import 'bloc/retails_event.dart';
import 'bloc/retails_state.dart';

class RetailsPage extends StatefulWidget {
  final CategoryModel category;

  RetailsPage(
    this.category,
  );

  @override
  _RetailsPageState createState() => _RetailsPageState();
}

class _RetailsPageState extends State<RetailsPage>
    with SingleTickerProviderStateMixin {
  bool checkBoxValue = false;

  var _searchController = TextEditingController();
  final _bloc = sl<RetailsBloc>();
  var _listController = ScrollController();
  var selectedDate = DateTime.now();

  @override
  void initState() {
    _bloc.add(GetCategoryRetails((b) => b..categoryId = widget.category.id));
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
            (previous as RetailsState).isLoading !=
            (current as RetailsState).isLoading,
        builder: (BuildContext context, RetailsState state) {
          showToast(state.error);
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());
          return Scaffold(
              resizeToAvoidBottomInset: false, // this avoids the overflow error
              appBar: AppBar(
                backgroundColor: primaryColor,
                title: baseText(widget.category.name!,
                    color: Colors.white, textAlign: TextAlign.center),
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
                        child: SingleChildScrollView(
                          controller: _listController,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: sizeAware.height * 0.01,
                              ),
                              gridProducts(context, state.retails,
                                  is_discount: true),
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
                      : state.retails.isEmpty
                          ? Container(
                              width: sizeAware.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                              ))
                          : Container()
                ],
              ));
        });
  }

  // bool isInCardLit(int id, BuiltList<CartModel> cart) {
  //   print("id" + cart.toString());
  //   for (int i = 0; i < cart.length; i++) {
  //     if (id == cart[i].parent_id) {
  //       print("iddd" +
  //           id.toString() +
  //           "parent id:" +
  //           cart[i].parent_id.toString());

  //       return true;
  //     }
  //   }
  //   return false;
  // }

}
