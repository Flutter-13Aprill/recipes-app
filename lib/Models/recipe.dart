// --- Model ---

import 'package:flutter/material.dart';

class Recipe {
  final String profileImagePath;
  final String userName;
  final FileImage? foodImage;
  final String duration;
  final String type;
  final String foodName;
  bool isFromFile; // Flag to differentiate source

  bool isLiked = false;
  final String? foodImagePath;

  Recipe({
    this.isFromFile = false,
    this.foodImagePath,
    required this.foodName,
    required this.profileImagePath,
    required this.userName,
    this.foodImage,
    required this.duration,
    this.type = 'Food',
  });
}
