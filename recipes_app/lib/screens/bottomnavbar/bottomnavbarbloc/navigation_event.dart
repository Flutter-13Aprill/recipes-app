part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

// Defines navigation-related events for NavigationBloc.

class PageTappedEvent extends NavigationEvent {
  final int index;
  PageTappedEvent(this.index);
}
