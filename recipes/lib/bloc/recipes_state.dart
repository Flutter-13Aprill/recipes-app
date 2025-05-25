part of 'recipes_bloc.dart';

@immutable
sealed class RecipesState {}

final class RecipesInitial extends RecipesState {}

final class visavilstate extends RecipesState{
  final bool obscureText;

  visavilstate({required this.obscureText});
  
}


final class Passwordvalidatestate extends RecipesState{
  final bool hasminlength;
  final bool hasnumber;
  Passwordvalidatestate({required this.hasminlength, required this.hasnumber});
  
}