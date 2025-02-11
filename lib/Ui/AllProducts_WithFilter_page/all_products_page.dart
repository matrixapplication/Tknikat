import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/filter_screen/filterScreen.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/list_products.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import '../../core/app_localizations.dart';
import '../../core/assets_image/app_images.dart';
import '../../core/custom_text_field.dart';
import '../../injectoin.dart';
import '../auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'bloc/all_products_bloc.dart';
import 'bloc/all_products_event.dart';
import 'bloc/all_products_state.dart';

// this class is used by filtering + see all New product + see all On Sale

class AllProductsPage extends StatefulWidget {
  final CustomFilter custom_filter;
  final String title;

  AllProductsPage({required this.custom_filter, required this.title});

  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  final _bloc = sl<AllProductsBloc>();
  var _listController = ScrollController();
  CustomFilter _filter = new CustomFilter();

  @override
  void initState() {
    _filter = widget.custom_filter;
    _searchController.text = widget.custom_filter.search ?? '';

    _bloc.add(GetAllProducts((b) => b..customFilter = _filter));
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
        builder: (BuildContext context, AllProductsState state) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body:
              Stack(
                children: [

                  SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
                  Column(
                    children: [
                      40.height,
                      AuthHeaderWidget(title: AppLocalizations.of(context).translate("Products"),hasFilter: true,
                        onTapFilter: (){
                          Navigator.of(context)
                              .push(PageTransition(
                              duration:
                              Duration(milliseconds: 1000),
                              type: PageTransitionType.fade,
                              child: FilterScreen(_filter)))
                              .then((value) {
                            if (value != null) {
                              _filter = value;
                              _bloc.add(GetAllProducts(
                                      (b) => b..customFilter = value));
                            }
                          });
                        },
                      ),
                      Container(
                        padding: 20.paddingHorizontal,
                          child:  CustomTextField(
                          borderColor: Colors.transparent,
                          hintText:  AppLocalizations.of(context).translate('search'),
                          onChanged: (value){
                            _bloc.add(GetAllProducts((b) => b..customFilter = _filter));
                          },
                          prefixIcon: SvgPicture.asset(AppImages.search),
                          controller: _searchController,
                        ),
                      ),

                      (state.products != null && state.products.isNotEmpty)
                          ? Expanded(
                              child: SingleChildScrollView(
                                  controller: _listController,
                                  child: gridProducts(context, state.products,
                                      is_discount: true)),
                            )
                          : Container(),
                    ],
                  ),
                  state.isLoading
                      ? Center(
                          child: loader(context: context),
                        )
                      : state.products.isEmpty
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
                                          AppImages.noFoundData
                                          // "assets/images/empty_content.svg",
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
