part of 'shares_bloc.dart';

@immutable
class SharesState {
  SharesState({
    this.paginator,
    required this.filter,
  });

  factory SharesState.init() => SharesState(
        paginator: null,
        filter: SharesFilter(),
      );
  final Paginator? paginator;
  final SharesFilter filter;

  SharesState copyWith({Paginator? paginator, SharesFilter? filter}) {
    return SharesState(
      paginator: paginator ?? this.paginator,
      filter: filter ?? this.filter,
    );
  }
}
