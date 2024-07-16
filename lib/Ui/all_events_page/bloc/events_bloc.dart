import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/src/list.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/core/filters/event_filter.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/model/base_response/base_response.dart';
import 'package:taknikat/model/event_model/event_model.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final pagingController = PagingController<int, EventModel>(firstPageKey: 1);

  EventsBloc(this.repository) : super(EventsState.init()) {
    pagingController.addPageRequestListener((pageKey) {
      add(EventsFetched(page: pageKey));
    });

    on<EventsFetched>((event, emit) async {
      await _mapFetched(event.page);
    });
    on<FilterChanged>((event, emit) async {
      emit(state.copyWith(filter: event.eventsFilter));
      pagingController.refresh();
    });
    on<ReloadEvents>((event, emit) async {
      pagingController.refresh();
    });
  }

  final Repository repository;

  _mapFetched(int page) async {
    try {
      final result = await fetch(page);
      final newItems = result.content!.toList();
      if (result.paginator!.isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } on NetworkException catch (e) {
      pagingController.error = e.error;
    }
  }

  Future<BaseResponse<BuiltList<EventModel>>> fetch(int page) async =>
      await repository.getAllEvents(state.filter, page: page);
}

