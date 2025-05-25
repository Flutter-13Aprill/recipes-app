part of 'upload_bloc.dart';

@immutable
class UploadState {
  final String? imagePath;
  final String title;
  final String description;
  final double duration;

  const UploadState({
    this.imagePath,
    this.title = '',
    this.description = '',
    this.duration = 1,
  });

  UploadState copyWith({
    String? imagePath,
    String? title,
    String? description,
    double? duration,
  }) {
    return UploadState(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
    );
  }
}


