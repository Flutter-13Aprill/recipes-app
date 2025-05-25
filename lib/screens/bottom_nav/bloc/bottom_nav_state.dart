part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {}

final class BottomNavInitial extends BottomNavState {}

final class SuccessChangingScreenState extends BottomNavState{
  final int index;

  SuccessChangingScreenState({required this.index});
}
