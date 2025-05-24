 
 import 'package:image_picker/image_picker.dart';

 
abstract class UploadFoodEvent {
  const UploadFoodEvent();
}

/// Event triggered when the user selects an image (from gallery or camera).
/// Contains the selected image file
class ImageSelected extends UploadFoodEvent {
  final XFile? image;  
  const ImageSelected(this.image);

  @override
  String toString() => 'ImageSelected(image: ${image?.path})';
}

/// Event triggered when the user changes the food name input field.
/// Contains the new title entered by the user.
class FoodTitleChanged extends UploadFoodEvent {
  final String title;  
  const FoodTitleChanged(this.title);

  @override
  String toString() => 'FoodTitleChanged(title: $title)';
}

/// Event triggered when the user changes the description input field.
/// Contains the new description entered by the user.
class DescriptionChanged extends UploadFoodEvent {
  final String description;  
  const DescriptionChanged(this.description);

  @override
  String toString() => 'DescriptionChanged(description: $description)';
}
/// Event triggered when the user adjusts the cooking time slider.
/// Contains the new cooking duration in minutes.
class CookingMinutesChanged extends UploadFoodEvent {
  final double minutes; 
  const CookingMinutesChanged(this.minutes);

  @override
  String toString() => 'CookingMinutesChanged(minutes: $minutes)';
}
/// Event triggered when the user presses the "Upload" or "Next" button.
/// Indicates that the form has been submitted and processing should begin.
class UploadSubmitted extends UploadFoodEvent {
  const UploadSubmitted();  

  @override
  String toString() => 'UploadSubmitted()';
}
/// Event triggered to reset the upload status back to initial state.
/// Useful after a successful or failed upload to clear any previous state.
class UploadStatusReset extends UploadFoodEvent {
  const UploadStatusReset();

  @override
  String toString() => 'UploadStatusReset()';
}
