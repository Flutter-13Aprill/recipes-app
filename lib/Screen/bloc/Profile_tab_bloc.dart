// lib/Bloc/profile_tab_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

enum ProfileTab { recipes, liked }

class ProfileTabCubit extends Cubit<ProfileTab> {
  ProfileTabCubit() : super(ProfileTab.recipes);

  void showRecipes() => emit(ProfileTab.recipes);
  void showLiked() => emit(ProfileTab.liked);
}
