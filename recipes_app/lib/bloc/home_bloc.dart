import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(
          likedCards: List.generate(4, (_) => false),
          currentPageIndex: 0,
        )) {
    on<ToggleLike>((event, emit) {
      final newLikedCards = List<bool>.from(state.likedCards);
      newLikedCards[event.cardIndex] = !newLikedCards[event.cardIndex];
      emit(state.copyWith(likedCards: newLikedCards));
    });

    on<NavigateToPage>((event, emit) {
      emit(state.copyWith(currentPageIndex: event.pageIndex));
    });
  }
}
