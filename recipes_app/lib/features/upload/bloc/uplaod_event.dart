part of 'uplaod_bloc.dart';

@immutable
sealed class UplaodEvent {}

class UpdateCookingDurationEvent extends UplaodEvent {
  final double duration;
  UpdateCookingDurationEvent(this.duration);
}

class AddRecioeEvent extends UplaodEvent {
  final UploadModel recipes;
  AddRecioeEvent({required this.recipes});
}

class PickImageEvent extends UplaodEvent {}
