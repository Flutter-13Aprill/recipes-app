import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:blocrecipes/Models/recipe.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<String> categories = ['All', 'Food', 'Drink'];

  int selectedCategoryIndex = 0;
  HomeBloc() : super(HomeInitial()) {
    void init() {
      emit(HomeInitial());
    }

    init();
    on<HomeEvent>((event, emit) {});
    on<SelectCategory>((event, emit) {
      selectedCategoryIndex = event.selectedIndex;
      emit(CategorySelected());
    });
    on<LikeRecipe>((event, emit) {
      emit(RecipeLiked());
    });
    on<RefreshScreen>((event, emit) {
      emit(HomeInitial());
    });
  }
}
