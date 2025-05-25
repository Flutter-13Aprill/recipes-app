part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

// Defines events for ProfileBloc.
// Currently supports an event for changing the selected tab.
class TabChangedEvent extends ProfileEvent {
  final int index;
  TabChangedEvent(this.index);
}
