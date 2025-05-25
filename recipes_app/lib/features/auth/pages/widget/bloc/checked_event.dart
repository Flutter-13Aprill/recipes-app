part of 'checked_bloc.dart';

@immutable
sealed class CheckedEvent {}

class CheckRuleEvent extends CheckedEvent {
final TextEditingController controller;
final String? Function(String?) condition;

  CheckRuleEvent(this.controller, this.condition);
}
