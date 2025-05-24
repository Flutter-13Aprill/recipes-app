// navigationbar_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'navigationbar_event.dart';
part 'navigationbar_state.dart';

class NavigationbarBloc extends Bloc<NavigationbarEvent, NavigationbarState> {
   NavigationbarBloc() : super(  NavigationbarInitial(currentIndex: 0)) {
     on<NavigationItemTapped>(_onNavigationItemTapped);
  }

   FutureOr<void> _onNavigationItemTapped(
    NavigationItemTapped event,  
    Emitter<NavigationbarState> emit, 
  ) {
     emit(NavigationbarSelectionChanged(event.selectedIndex));
  }
}