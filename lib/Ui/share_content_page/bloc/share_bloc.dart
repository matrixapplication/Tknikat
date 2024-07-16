import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/model/base_response/base_response.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/product_model/comment_model.dart';
import 'package:taknikat/model/reject_model/reject_model.dart';

import '../../../app/App.dart';

part 'share_event.dart';
part 'share_state.dart';

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  late int shareId;

  final pagingController = PagingController<int, CommentModel>(firstPageKey: 1);

  final Repository repository;

  ShareBloc(this.repository) : super(ShareState.init()) {
    pagingController.addPageRequestListener((pageKey) {
      add(CommentsFetched(page: pageKey));
    });

    on<CommentsFetched>((event, emit) async {
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
    on<CommentAdded>((event, emit) async {
      await repository.reviewModel(
        model_type: "share",
        model_id: event.id.toString(),
        review_content: event.comment,
        parent_review: event.parentCommentId,
        user_id: event.repliedUserId,
      );
      pagingController.refresh();
    });
    on<ApproveShare>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.loading));
      await repository.approveShare(id: event.id.toString(), text: '');
      emit(state.copyWith(status: BlocStatus.success, approved: true));

      pagingController.refresh();
    });
    on<RejectShare>((event, emit) async {
      emit(state.copyWith(status: BlocStatus.loading));

      try {
        await repository.rejectShare(
          id: event.modelId,
          rejectReasonId: event.rejectId, text: event.text,
        );
        emit((state.copyWith(status: BlocStatus.success, approved: false)));
        Navigator.of(navKey.currentContext!).pop();
        Navigator.of(navKey.currentContext!).pop();
        Navigator.of(navKey.currentContext!).pop();

      } on NetworkException catch (_) {
        emit(state.copyWith(status: BlocStatus.fail));
      }
      pagingController.refresh();
    });
    on<GetRejectReasons>((event, emit) async {
      emit(state.copyWith(rejectReasonsStatus: BlocStatus.loading));
      try {
        final data = await repository.getRejectReasons();
        print('ttttt $data');
        emit(state.copyWith(
            rejectReasonsStatus: BlocStatus.success,
            rejectReasons: data.asList()));
      } on NetworkException catch (e) {
        emit(state.copyWith(rejectReasonsStatus: BlocStatus.fail));
      }
    });
  }
  Future<BaseResponse<BuiltList<CommentModel>>> fetch(int page) async =>
      await repository.getShareComments(shareId, page: page);
}
