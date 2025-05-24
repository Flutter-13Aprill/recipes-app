import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/model/recipe.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<LoadRecipes>((event, emit) {
      final allRecipes = [
        Recipe(
          id: '1',
          title: 'Pancake',
          image: 'assets/images/pancake.png',
          author: 'Calum Lewis',
          authorImage: 'assets/images/profile1.png',
          category: 'Food',
          duration: '>60 mins',
        ),
        Recipe(
          id: '2',
          title: 'Salad',
          image: 'assets/images/salad.png',
          author: 'Elif Sonas',
          authorImage: 'assets/images/profile1.png',
          category: 'Food',
          duration: '15 mins',
        ),
        Recipe(
          id: '3',
          title: 'pancake',
          image: 'assets/images/pancake2.png',
          author: 'Ali Mansour',
          authorImage: 'assets/images/profile1.png',
          category: 'Food',
          duration: '30 mins',
        ),
        Recipe(
          id: '4',
          title: 'Frote',
          image: 'assets/images/frute.png',
          author: 'Dana Saleh',
          authorImage: 'assets/images/profile2.png',
          category: 'Food',
          duration: '10 mins',
        ),
      ];

      emit(state.copyWith(recipes: allRecipes));
    });

    on<ChangeCategory>((event, emit) {
      emit(state.copyWith(selectedCategory: event.category));
    });

    on<ChangeTab>((event, emit) {
      emit(state.copyWith(selectedTab: event.tab));
    });
  }
}
