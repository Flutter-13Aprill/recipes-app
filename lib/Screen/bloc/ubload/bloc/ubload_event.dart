import 'dart:io';

abstract class UploadEvent {}

class CoverImagePicked extends UploadEvent {
  final File image;
  CoverImagePicked(this.image);
}

class FoodNameChanged extends UploadEvent {
  final String name;
  FoodNameChanged(this.name);
}

class DescriptionChanged extends UploadEvent {
  final String description;
  DescriptionChanged(this.description);
}

class DurationChanged extends UploadEvent {
  final double duration;
  DurationChanged(this.duration);
}

class UploadSubmitted extends UploadEvent {}
