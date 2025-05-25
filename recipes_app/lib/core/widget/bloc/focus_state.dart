part of 'focus_bloc.dart';

@immutable
sealed class FocusState {}

final class FocusInitial extends FocusState {}
class Focused extends FocusState {}

class Unfocused extends FocusState {}