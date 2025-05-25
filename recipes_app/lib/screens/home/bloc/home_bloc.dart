import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
// import 'package:recipes_app/screens/profile/bloc/profile_bloc.dart';

part 'home_state.dart';
part 'home_event.dart';

// Bloc to manage the state of home screen tabs.

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<TabChangedEvent>((event, emit) => emit(SuccessState(event.index)));
  }
}
