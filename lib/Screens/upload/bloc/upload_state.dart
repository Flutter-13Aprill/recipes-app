part of 'upload_bloc.dart';

@immutable
sealed class UploadState {}

class UploadInitial extends UploadState {}

class UploadInProgress extends UploadState {}

class UploadSuccess extends UploadState {}

class UploadError extends UploadState {}

final class SliderChanged extends UploadState {}
