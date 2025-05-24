 
import 'package:image_picker/image_picker.dart';

class Upload {
  final XFile? image; // The image file selected by the user.
  String foodTitle; // The title of the recipe (e.g., "Chicken Curry").
  String description; // A detailed description of the recipe or dish.
  double cookingMinutes; // The cooking duration, typically selected via a slider.

  Upload({
    this.image,
    this.cookingMinutes = 30.0,  // Default value for cooking duration in minutes.
    this.description = '',  // Default empty string for the description.
    this.foodTitle = '', // Default empty string for the food title.
  });

   
   // copyWith method to create a new Upload instance with updated values.
  Upload copyWith({
    XFile? image,
    String? foodTitle,
    String? description,
    double? cookingMinutes,
  }) {
    return Upload(// Use new values if provided, otherwise retain current.
      image: image ?? this.image,
      foodTitle: foodTitle ?? this.foodTitle,
      description: description ?? this.description,
      cookingMinutes: cookingMinutes ?? this.cookingMinutes,
    );
  }
 
}