// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:taknikat/model/share_model/share_model.dart';

class AllRecentSharesState {
  final List<ShareModel> shares;
  final bool isLoading;
  final String? error;
  final int currentPage;
  final bool isLastPage;

  AllRecentSharesState({
    this.shares = const [],
    this.currentPage = 1,
    this.isLastPage = false,
    this.isLoading = false,
    this.error,
  });

  AllRecentSharesState copyWith({
    List<ShareModel>? shares,
    bool? isLoading,
    String? error,
    int? currentPage,
    bool? isLastPage,
  }) {
    return AllRecentSharesState(
      shares: shares ?? this.shares,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}
