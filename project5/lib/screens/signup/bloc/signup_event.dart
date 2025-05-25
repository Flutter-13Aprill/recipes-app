part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class CorrectLengthEvent extends SignupEvent{}

class WrongLengthEvent extends SignupEvent{}

class ContainNumberEvent extends SignupEvent{}

class DontContainNumberEvent extends SignupEvent{}

class VisibleEvent extends SignupEvent{}