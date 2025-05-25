part of 'checked_bloc.dart';

@immutable
sealed class CheckedState {}

final class CheckedInitial extends CheckedState {}
final class TrueState extends CheckedState {}
final class FalseState extends CheckedState {}
