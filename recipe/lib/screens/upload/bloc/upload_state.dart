import 'dart:io';

class UploadState {
  final File? coverImage;
  final String foodName;
  final String description;
  final double duration;

  const UploadState({
    this.coverImage,
    this.foodName = '',
    this.description = '',
    this.duration = 30,
  });

  UploadState copyWith({
    File? coverImage,
    String? foodName,
    String? description,
    double? duration,
  }) {
    return UploadState(
      coverImage: coverImage ?? this.coverImage,
      foodName: foodName ?? this.foodName,
      description: description ?? this.description,
      duration: duration ?? this.duration,
    );
  }
}
