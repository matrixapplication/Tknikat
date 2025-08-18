part of 'service_order_cubit.dart';

@immutable
sealed class ServiceOrderState {}

final class ServiceOrderInitial extends ServiceOrderState {}

final class RequestServiceOrderLoading extends ServiceOrderState {}
final class RequestServiceOrderSuccess extends ServiceOrderState {}
final class RequestServiceOrderError extends ServiceOrderState {}
