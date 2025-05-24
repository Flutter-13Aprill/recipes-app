 import 'package:app/models/recipe.dart';
import 'package:app/models/upload.dart';  
// Enum representing the current status of the upload process

 enum UploadStatus {
  initial, 
  loading,  
  success,  
  failure  
}
// Main state class for the Upload Screen
// This holds all relevant data during the upload flow
 
class UploadFoodState {
  // Contains the current upload data (image, title, description, cooking time)
  final Upload uploadData; 
  final UploadStatus status;  
  final String? errorMessage;  
  final Recipe? newRecipe;  
// Current status of the upload operation
  const UploadFoodState({
    required this.uploadData,
    this.status = UploadStatus.initial,  
    this.errorMessage,
     this.newRecipe, 
  });

   // Factory method to create a new state with updated values
  // Useful for updating only specific parts of the state
    UploadFoodState copyWith({
    Upload? uploadData,
    UploadStatus? status,
      final Recipe? newRecipe,

    String? errorMessage, 
  }) {
    return UploadFoodState(
      uploadData: uploadData ?? this.uploadData,
      status: status ?? this.status,
      errorMessage: errorMessage,
      newRecipe:newRecipe
    );
  }

  
}