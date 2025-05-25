part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

class PageTappedEvent extends NavigationEvent {
  final int index;
  PageTappedEvent(this.index);
}
