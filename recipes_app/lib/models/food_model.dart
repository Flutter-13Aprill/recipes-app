// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:recipes_app/models/user_model.dart';

class FoodModel {
  final String name;
  final String image;
  final String description;
  final double duration;
  bool isFavorite;

  final UserModel creator;
  FoodModel({
    required this.creator,
    required this.isFavorite,
    required this.image,
    required this.name,
    required this.description,
    required this.duration,
  });
}
