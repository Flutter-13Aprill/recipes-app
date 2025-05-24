// lib/widgets/container/recipe_container.dart
import 'dart:io';
import 'dart:math';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_bloc.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_event.dart';
// import 'package:app/screen/upload/bloc/upload_bloc.dart'; // هذا الاستيراد غير مستخدم هنا، يمكن إزالته
import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/models/recipe.dart';
import 'package:flutter/foundation.dart'; // For debugPrint
// Helper widget to build the recipe image based on the image path

class RecipeContainer extends StatelessWidget {
  const RecipeContainer({super.key, required this.recipe});

  final Recipe recipe;

  Widget _buildRecipeImage(String imagePath, double height) {
    // If image is an asset inside the app bundle
    if (imagePath.startsWith('assets/')) {
      return Image.asset(imagePath, fit: BoxFit.cover);
    } else if (imagePath.startsWith('/')) {
      // Assuming absolute paths indicate local files
      final file = File(imagePath); //take image

      if (file.existsSync()) {
        // File exists, display the image from file system

        return Image.file(file, fit: BoxFit.cover);
      } else {
        // File does not exist, show broken image placeholder

        return Container(
          color: Colors.grey[200],
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
          ),
        );
      }
    } else {
      return Container(
        color: Colors.grey[200],
        child: const Center(
          child: Icon(Icons.image_not_supported, color: Colors.grey, size: 40),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool currentIsFavorite = recipe.isFavorite; // Get favorite state

    return Container(
      width:
          context.getWight() *
          0.47, // Set container width as 47% of screen width
      padding: const EdgeInsets.all(8.0), // Padding inside container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Light shadow color
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // Header row: Profile image and recipe creator name
            children: [
              SizedBox(
                height: context.getHight() * 0.06,
                width: context.getHight() * 0.06,
                child: ClipOval(
                  child: Image.asset(
                    recipe.profileImagePath, //display image from aset 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  recipe.name, // Recipe creator name
                  style: TextStyle(
                    color: const Color(0xff2E3E5C),
                    fontSize: context.getWight() * 0.038,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Stack(//stack 
            alignment: Alignment.topRight,
            children: [
              Container(//conainer wth spiscfic decoration 
                height: context.getHight() * 0.18,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: _buildRecipeImage(
                    recipe.recipeImage,//display image uploaded y user 
                    context.getHight() * 0.18,
                  ),
                ),
              ),
              Positioned(
                top: 8,//spaicfay locaton 
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.read<RecipeBloc>().add(
                        ToggleFavoriteEvent(recipe.id),//add to ToggleFavoriteEvent
                      );
                    },
                    icon: Icon(//dispaly favorite icon based on currentIsFavorite
                      currentIsFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: currentIsFavorite ? Colors.red : Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            recipe.title,//display title of recipe and style it 
            style: const TextStyle(
              color: Color(0xff2E3E5C),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //conatiner for food 
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F7FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Food",
                  style: TextStyle(
                    color: Color(0xFF6B80A5),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(//style conatiner for text 
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xff9FA5C0),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                ">60 mins",
                style: TextStyle(color: Color(0xff9FA5C0), fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
