import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/src/list.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/core/filters/shares_filter.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/model/base_response/base_response.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/share_model/share_model.dart';

part 'shares_event.dart';
part 'shares_state.dart';

class SharesBloc extends Bloc<SharesEvent, SharesState> {
  late int eventId;

  final pagingController = PagingController<int, ShareModel>(firstPageKey: 1);

  final Repository repository;

  SharesBloc(this.repository) : super(SharesState.init()) {
    pagingController.addPageRequestListener((pageKey) {
      add(SharesFetched(page: pageKey));
    });
    on<SharesFetched>((event, emit) async {
      try {
        final result = await fetch(event.page);
        emit(state.copyWith(
          paginator: result.paginator,
        ));
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
    on<SharesFilterChanged>((event, emit) {
      emit(state.copyWith(filter: event.filter));
      pagingController.refresh();
    });
  }

  Future<BaseResponse<BuiltList<ShareModel>>> fetch(int page,
          [ShareStatus? status]) async =>
      await repository.getAllShares(
        eventId,
        state.filter,
        //because back-end  start paging from 1 not from 0.
        page,
      );
}
