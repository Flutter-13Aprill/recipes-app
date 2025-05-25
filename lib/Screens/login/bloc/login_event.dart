part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginButtonPressed extends LoginEvent {
  BuildContext context;
  LoginButtonPressed({required this.context});
}

final class ObscurePasswordClicked extends LoginEvent {}
