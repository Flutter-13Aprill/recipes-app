//// Model class to represent an uploaded food recipe item.
class UploadModel {
  final String path;
  final String foodName;
  final String description;
  final String duration;

  UploadModel({
    required this.path,
    required this.foodName,
    required this.description,
    required this.duration,
  });
}
