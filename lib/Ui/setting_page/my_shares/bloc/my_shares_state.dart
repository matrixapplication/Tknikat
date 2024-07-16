part of 'my_shares_bloc.dart';

class MySharesState {
  final List<ShareModel> shares;
  final bool loading;
  final String? error;

  MySharesState({required this.shares, required this.loading, this.error});

  factory MySharesState.initial() {
    return MySharesState(
      shares: [],
      loading: false,
      error: null,
    );
  }

  MySharesState copyWith({
    List<ShareModel>? shares,
    bool? loading,
    String? error,
  }) {
    return MySharesState(
      shares: shares ?? this.shares,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
