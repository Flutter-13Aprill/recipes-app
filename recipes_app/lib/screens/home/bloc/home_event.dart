part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

// Defines events for HomeBloc.
// Currently supports an event for changing the selected tab.
class TabChangedEvent extends HomeEvent {
  final int index;
  TabChangedEvent(this.index);
}
