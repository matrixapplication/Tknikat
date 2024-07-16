import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/core/mixin.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/model/base_response/base_response.dart';
import 'package:taknikat/model/share_model/share_model.dart';

part 'my_shares_event.dart';
part 'my_shares_state.dart';

class MySharesBloc extends Bloc<MySharesEvent, MySharesState>
    with RetryBlocMixin {
  final Repository repository;

  final pagingController = PagingController<int, ShareModel>(firstPageKey: 1);

  MySharesBloc(this.repository) : super(MySharesState.initial()) {
    // pagingController.addPageRequestListener((pageKey) {
    //   add(MySharesFetched(pageKey, ShareStatus.approved));
    // });
    on<MySharesFetched>((event, emit) async {
      try {
        if (event.page == 0) {
          pagingController.refresh();
        }

        final result = await _fetch(event.page, event.status);

        final newItems = result.content!.toList();

        if (result.paginator!.isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = event.page + 1;
          pagingController.appendPage(newItems, nextPageKey);
        }
      } on NetworkException catch (e) {
        pagingController.error = e.error;
      }
    });
    on<MyShareDeleted>((event, emit) async {
      try {
        final items = pagingController.itemList ?? [];
        await repository.deleteShare(items[event.index].id);
        pagingController.itemList = List.from(items..removeAt(event.index));
      } on NetworkException catch (e) {
        Fluttertoast.showToast(msg: e.error);
      }
    });
  }

  Future<BaseResponse<BuiltList<ShareModel>>> _fetch(
          int page, ShareStatus status) async =>
      await repository.getMyShares(page: page, status: status);
}
