part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class TabChangedEvent extends ProfileEvent {
  final int index;
  TabChangedEvent(this.index);
}
