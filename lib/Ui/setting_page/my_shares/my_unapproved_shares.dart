import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_share.dart';
import 'package:taknikat/app/slide_animation.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/share_model/share_model.dart';

import 'bloc/my_shares_bloc.dart';

class MyUnapprovedShares extends StatefulWidget {
  const MyUnapprovedShares({Key? key}) : super(key: key);

  @override
  State<MyUnapprovedShares> createState() => _MyUnapprovedSharesState();
}

class _MyUnapprovedSharesState extends State<MyUnapprovedShares> {
  final bloc = sl<MySharesBloc>();
  ShareStatus status = ShareStatus.unapproved;

  @override
  void initState() {
    bloc.add(MySharesFetched(0, status));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(MySharesFetched(0, ShareStatus.unapproved));
      },
      child: PagedListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 16,
        ),
        pagingController: bloc.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ShareModel>(
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Text('لا يوجد فعاليات مرفوضة'),
          ),
          newPageProgressIndicatorBuilder: (context) => loader(),
          firstPageProgressIndicatorBuilder: (context) => loader(),
          itemBuilder: (context, item, index) {
            return SlidStaggeredListAnimation(
              index: index,
              child: MyShareItem(
                item,
                status,
                onDeleted: () {
                  bloc.add(MyShareDeleted(index));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
