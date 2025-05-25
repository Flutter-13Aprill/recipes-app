part of 'focus_bloc.dart';

@immutable
sealed class FocusEvent {}
class FocusIn extends FocusEvent {}

class FocusOut extends FocusEvent {}