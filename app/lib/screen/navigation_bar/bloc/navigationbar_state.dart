// navigationbar_state.dart
part of 'navigationbar_bloc.dart';

@immutable
sealed class NavigationbarState {}

 final class NavigationbarInitial extends NavigationbarState {
  final int currentIndex;  

    NavigationbarInitial({this.currentIndex = 0});  
}

 final class NavigationbarSelectionChanged extends NavigationbarState {
  final int currentIndex; 

    NavigationbarSelectionChanged(this.currentIndex); }