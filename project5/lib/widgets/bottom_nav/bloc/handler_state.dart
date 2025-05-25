part of 'handler_bloc.dart';

@immutable
sealed class HandlerState {}

final class HandlerInitial extends HandlerState {}
final class SuccessState extends HandlerState {}
