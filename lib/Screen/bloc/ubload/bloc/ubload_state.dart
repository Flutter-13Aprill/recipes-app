import 'dart:io';

class UploadState {
  final File? image;
  final String foodName;
  final String description;
  final double duration;
  final bool isValid;

  UploadState({
    this.image,
    this.foodName = '',
    this.description = '',
    this.duration = 30,
    this.isValid = false,
  });

  UploadState copyWith({
    File? image,
    String? foodName,
    String? description,
    double? duration,
    bool? isValid,
  }) {
    return UploadState(
      image: image ?? this.image,
      foodName: foodName ?? this.foodName,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      isValid: isValid ?? this.isValid,
    );
  }
}
