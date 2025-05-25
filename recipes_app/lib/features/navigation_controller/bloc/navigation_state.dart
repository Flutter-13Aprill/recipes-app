part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}
final class MoveIndexState extends NavigationState {
final int index;

  MoveIndexState( this.index);
}
