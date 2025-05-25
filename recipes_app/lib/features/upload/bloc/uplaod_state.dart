part of 'uplaod_bloc.dart';

@immutable
sealed class UplaodState {}

final class UpdateCookingDurationState extends UplaodState {}

final class SuccessListState extends UplaodState {
  final List<UploadModel> recipes;
  SuccessListState(this.recipes);
}

class ImagePickedState extends UplaodState {}
