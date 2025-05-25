part of 'upload_bloc.dart';

@immutable
sealed class UploadEvent {}

class UploadImgfromGallery extends UploadEvent {}

class AddedRecipe extends UploadEvent {
  final String name;
  final String description;

  AddedRecipe({required this.name, required this.description});
}
