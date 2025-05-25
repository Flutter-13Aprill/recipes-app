part of 'upload_bloc.dart';

@immutable
sealed class UploadState {}

final class UploadInitial extends UploadState {}
// SuccessState state containing the list of saved recipes and the selected minutes.

final class SuccessState extends UploadState {
  final List<RecipesInfoModel> savedRecipes;
  final double minutes;

  SuccessState({required this.savedRecipes, required this.minutes});
}
