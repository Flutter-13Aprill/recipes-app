part of 'upload_bloc.dart';

@immutable
sealed class UploadEvent {}

class ChangeImage extends UploadEvent {
  final File image;
  ChangeImage(this.image);
}

class ChangeFoodName extends UploadEvent {
  final String name;
  ChangeFoodName(this.name);
}

class ChangeDescription extends UploadEvent {
  final String text;
  ChangeDescription(this.text);
}

class ChangeDuration extends UploadEvent {
  final double duration;
  ChangeDuration(this.duration);
}
