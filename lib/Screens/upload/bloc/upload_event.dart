part of 'upload_bloc.dart';

@immutable
// Upload Bloc
sealed class UploadEvent {}

class PickImageEvent extends UploadEvent {}

class ImageError extends UploadEvent {
  final String message;
  ImageError(this.message);
}

class DurationChanged extends UploadEvent {
  final String duration;
  DurationChanged(this.duration);
}

class SubmitRecipe extends UploadEvent {}

final class SliderClicked extends UploadEvent {
  final double value;
  SliderClicked(this.value);
}
