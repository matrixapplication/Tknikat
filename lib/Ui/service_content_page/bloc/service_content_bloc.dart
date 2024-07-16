import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'service_content_event.dart';
import 'service_content_state.dart';

class ServiceContentBloc
    extends Bloc<ServiceContentEvent, ServiceContentState> {
  Repository _repository;

  ServiceContentBloc(this._repository) : super(ServiceContentState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<AddComment>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      try {
        await _repository.reviewModel(
          model_type: "service",
          model_id: event.id.toString(),
          review_content: event.comment,
          parent_review: event.parentCommentId,
          user_id: event.repliedUserId,
        );
        final data = await _repository.getComments("service", event.id, 1);
        emit(state.rebuild((b) => b
          ..paginator.replace(data.paginator!)
          ..comments.replace(data.content!)
          ..isLoading = false));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<GetComments>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      try {
        final data =
            await _repository.getComments("service", event.model_id, 1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(data.paginator!)
          ..comments.replace(data.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<GetNextComments>((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        emit(state.rebuild((b) => b..isLoading = true));
        final data = await _repository.getComments(
            "service", event.model_id, this.state.paginator.currentPage! + 1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(data.paginator!)
          ..comments.addAll(data.content!)));
      } else {
        emit(state.rebuild((b) => b..isLoading = false));
      }
    });
  }
}
