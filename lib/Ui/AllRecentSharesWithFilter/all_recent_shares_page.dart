import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taknikat/Ui/AllRecentSharesWithFilter/bloc/cubit.dart';
import 'package:taknikat/Ui/AllRecentSharesWithFilter/bloc/state.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/share_content_card.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import '../../core/app_localizations.dart';
import '../../injectoin.dart';

class AllRecentSharesPage extends StatefulWidget {
  final CustomFilter custom_filter;
  final String? title;

  AllRecentSharesPage({required this.custom_filter, this.title});

  @override
  _AllRecentSharesPageState createState() => _AllRecentSharesPageState();
}

class _AllRecentSharesPageState extends State<AllRecentSharesPage> {
  final AllRecentSharesCubit _bloc = sl.get();
  final controller = PagingController<int, ShareModel>(firstPageKey: 1);

  @override
  void initState() {
    controller.addPageRequestListener((pageKey) {
      _bloc.loadPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocConsumer(
          bloc: _bloc,
          listenWhen:
              (AllRecentSharesState previous, AllRecentSharesState current) {
            return !current.isLoading;
          },
          listener: (BuildContext context, AllRecentSharesState state) {
            if (state.error != null) {
              controller.value = PagingState(
                nextPageKey: state.currentPage + 1,
                error: state.error,
                itemList: state.shares.isEmpty ? null : state.shares,
              );

              return;
            }

            if (state.isLastPage) {
              controller.appendLastPage(
                state.shares.sublist(controller.itemList?.length ?? 0),
              );
            } else {
              controller.appendPage(
                state.shares.sublist(controller.itemList?.length ?? 0),
                state.currentPage + 1,
              );
            }
          },
          builder: (BuildContext context, AllRecentSharesState state) {
            return Scaffold(
              resizeToAvoidBottomInset: false, // this avoids the overflow error

              appBar: AppBar(
                backgroundColor: primaryColor,
                title: Container(
                  child: Text(AppLocalizations.of(context)
                      .translate("Recently Added Shares")),
                  margin: EdgeInsets.all(13),
                  padding: EdgeInsets.symmetric(horizontal: 13),
                ),
                centerTitle: true,
                titleSpacing: 4,
                elevation: 0,
              ),
              body: Column(
                children: [
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      color: primaryColor,
                      child: Column(
                        children: [
                          Container(
                            height:
                                (sizeAware.height * 0.098483412322275) / 1.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: PagedListView(
                        pagingController: controller,
                        builderDelegate: PagedChildBuilderDelegate<ShareModel>(
                          itemBuilder: (context, item, index) {
                            return ShareContentCard(share: item);
                          },
                          firstPageProgressIndicatorBuilder: (context) {
                            return Center(
                              child: loader(context: context),
                            );
                          },
                          firstPageErrorIndicatorBuilder: (context) {
                            return Center(
                              child: TextButton(
                                child: Text("something went wrong, try again"),
                                onPressed: () {
                                  controller.retryLastFailedRequest();
                                },
                              ),
                            );
                          },
                          newPageErrorIndicatorBuilder: (context) {
                            return TextButton(
                              child: Text("something went wrong, try again"),
                              onPressed: () {
                                controller.retryLastFailedRequest();
                              },
                            );
                          },
                          noItemsFoundIndicatorBuilder: (context) {
                            return Center(
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
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
