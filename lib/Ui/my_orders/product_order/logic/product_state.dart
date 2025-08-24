part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class RequestProductLoading extends ProductState {}
final class RequestProductSuccess extends ProductState {}
final class RequestProductError extends ProductState {}
