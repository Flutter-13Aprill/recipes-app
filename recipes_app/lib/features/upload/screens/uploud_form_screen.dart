import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/upload/bloc/uplaod_bloc.dart';
import 'package:recipes_app/features/upload/models/upload_model.dart';
import 'package:recipes_app/features/upload/widgets/food_details_widget.dart';
import 'package:recipes_app/features/upload/widgets/show_upload_success_dialog.dart';
import 'package:recipes_app/features/upload/widgets/tab_bar_widget.dart';
import 'package:recipes_app/features/widgets/buttom_widget.dart';
import 'package:recipes_app/features/upload/widgets/cover_photo_widget.dart';

class UploadFormScreen extends StatelessWidget {
  // UploadFormScreen: Form to add a new recipe with photo, details, and submit button.
  const UploadFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                TabBarWidget(),

                // Add Cover Photo
                CoverPhotoWidget(),

                //Food details
                FoodDetailsWidget(),
                // Next Button
                ButtomWidget(
                  onTab: () {
                    final bloc = context.read<UplaodBloc>();
                    if (bloc.formKey.currentState!.validate()) {
                      final newRecipe = UploadModel(
                        path:
                            context.read<UplaodBloc>().imagePick.isNotEmpty
                                ? context.read<UplaodBloc>().imagePick.last.path
                                : '',
                        foodName: bloc.foodNameController.text.trim(),
                        description: bloc.descriptionController.text.trim(),
                        duration: bloc.cookingDuration.toString(),
                      );
                      bloc.add(AddRecioeEvent(recipes: newRecipe));
                      showUploadSuccessDialog(context);
                    }
                  },
                  textElevatedButton: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
