part of 'upload_bloc.dart';

@immutable
sealed class UploadState {}

final class UploadInitial extends UploadState {}

final class SuccessUploadImg extends UploadState {
  final File image;

  SuccessUploadImg({required this.image});
}

final class SuccessCreateState extends UploadState {
  final List<Map> recipes;

  SuccessCreateState({required this.recipes});
}
