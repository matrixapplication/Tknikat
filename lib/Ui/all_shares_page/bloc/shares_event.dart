part of 'shares_bloc.dart';

@immutable
abstract class SharesEvent {}

class SharesFetched extends SharesEvent {
  final int page;

  SharesFetched({this.page = 1});
}

class SharesFilterChanged extends SharesEvent {
  final SharesFilter filter;

  SharesFilterChanged(this.filter);
}
