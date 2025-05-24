// navigationbar_event.dart
part of 'navigationbar_bloc.dart';

@immutable
sealed class NavigationbarEvent {}

 final class NavigationItemTapped extends NavigationbarEvent {
  final int selectedIndex;  

    NavigationItemTapped(this.selectedIndex);  
}