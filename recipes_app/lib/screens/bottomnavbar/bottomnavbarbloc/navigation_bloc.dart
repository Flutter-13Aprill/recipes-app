import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

// Bloc to manage navigation between pages.

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<PageTappedEvent>((event, emit) {
      emit(SuccessState(event.index));
    });
  }
}
