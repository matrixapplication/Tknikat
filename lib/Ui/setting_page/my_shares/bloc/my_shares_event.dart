part of 'my_shares_bloc.dart';

@immutable
abstract class MySharesEvent {}

class MySharesFetched extends MySharesEvent {
  final int page;
  ShareStatus status;
  MySharesFetched(this.page , this.status);
}

class MyShareDeleted extends MySharesEvent {
  final int index;

  MyShareDeleted(this.index);
}
