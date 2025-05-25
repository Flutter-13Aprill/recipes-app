part of 'upload_bloc.dart';

@immutable
sealed class UploadEvent {}

class UpdateImage extends UploadEvent{
  final String imagePath;
  UpdateImage(this.imagePath);
}

class UpdateTitle extends UploadEvent{
  final String title;
  UpdateTitle(this.title);
}

class UpdateDescription extends UploadEvent{
final String description;

 UpdateDescription(this.description);

}
class SubmitRecipe extends UploadEvent{

}
class UpdateDuration  extends UploadEvent{
  final double duration;
  UpdateDuration(this.duration);
}