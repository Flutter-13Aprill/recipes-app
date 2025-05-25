part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

class ChangeScreenEvent extends BottomNavEvent{
  final int index;
  ChangeScreenEvent({required this.index});
}