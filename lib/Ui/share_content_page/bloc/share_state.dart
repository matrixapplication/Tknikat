part of 'share_bloc.dart';

enum BlocStatus { loading, success, init, fail }

@immutable
class ShareState {
  ShareState({
    this.paginator,
    this.status = BlocStatus.init,
    this.rejectReasons = const [],
    this.rejectReasonsStatus = BlocStatus.init,
    this.approved,
  });

  final Paginator? paginator;
  final List<RejectModel> rejectReasons;
  final BlocStatus status;
  final BlocStatus rejectReasonsStatus;
  final bool? approved;

  factory ShareState.init() => ShareState(
        paginator: null,
        status: BlocStatus.init,
      );

  ShareState copyWith({
    Paginator? paginator,
    List<RejectModel>? rejectReasons,
    BlocStatus? status,
    BlocStatus? rejectReasonsStatus,
    bool? approved,
  }) {
    return ShareState(
      paginator: paginator ?? this.paginator,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      status: status ?? this.status,
      rejectReasonsStatus: rejectReasonsStatus ?? this.rejectReasonsStatus,
      approved: approved ?? this.approved,
    );
  }
}
