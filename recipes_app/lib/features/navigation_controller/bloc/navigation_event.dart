part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}
class MoveIndexEvent extends NavigationEvent {


final int index;


  MoveIndexEvent(this.index);
}
