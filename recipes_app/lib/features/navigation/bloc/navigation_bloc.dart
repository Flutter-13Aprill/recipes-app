import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

/// Manages navigation state by handling navigation item selection events.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationBarState(0)) {
    on<NavigationEvent>((event, emit) {});
    on<NavigationItemSelected>((event, emit) {
      emit(NavigationBarState(event.index));
    });
  }
}
