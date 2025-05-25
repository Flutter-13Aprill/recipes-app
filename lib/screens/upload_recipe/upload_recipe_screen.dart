import 'dart:io';
import 'package:flutter/material.dart';


// -- BLoC
import 'package:re/screens/upload_recipe/bloc/recipe_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// -- Models
import 'package:re/models/recipe_model.dart';

// -- Widgets
import 'package:re/widgets/app_custom_button.dart';
import 'package:re/widgets/upload_recipe/cooking_duration.dart';
import 'package:re/widgets/upload_recipe/photo_cover.dart';
import 'package:re/widgets/upload_recipe/recipe_input_field.dart';
import 'package:re/widgets/upload_recipe/show_upload_success.dart';
import 'package:re/widgets/upload_recipe/top_section.dart';

// -- App Theming
import 'package:re/app_theming/app_colors.dart';

// -- Utilities
import 'package:re/utilities/screens/screen_sizes.dart';

class UploadRecipeScreen extends StatelessWidget {
  /// [UploadRecipeScreen] lets users upload a new recipe with image, name, description, and cooking duration.
  /// Uses RecipeBloc to handle image picking and recipe submission.
  /// Shows success dialog on successful upload.
  const UploadRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController foodName = TextEditingController();
    final TextEditingController description = TextEditingController();
    final recipeBloc = BlocProvider.of<RecipeBloc>(context);


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TopSection(),

                SizedBox(height: context.getHeight(multiplied: 0.03)),

                InkWell(
                  onTap: () async {
                    recipeBloc.pickImage();
     
                  },
                  child: PhotoCover()
                ),

                SizedBox(height: context.getHeight(multiplied: 0.03)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Food Name',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),

                SizedBox(height: context.getHeight(multiplied: 0.01)),

                RecipeInputField(
                  controller: foodName,
                  labelText: 'Enter food name',
                  isDescription: false,
                ),

                SizedBox(height: context.getHeight(multiplied: 0.03)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),

                SizedBox(height: context.getHeight(multiplied: 0.01)),

                RecipeInputField(
                  controller: description,
                  labelText: 'Tell a little about your food',
                  isDescription: true,
                ),

                SizedBox(height: context.getHeight(multiplied: 0.03)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Cooking Duration ',
                      style: Theme.of(context).textTheme.labelMedium,
                      children: [
                        TextSpan(
                          text: '(in minutes)',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: context.getHeight(multiplied: 0.03)),

                CookingDuration(recipeBloc: recipeBloc),

                SizedBox(height: context.getHeight(multiplied: 0.1)),
                AppCustomButton(
                  label: 'Submit',
                  onPressed: () {
                    
                    final duration = recipeBloc.sliderValue;
                    final RecipeModel recipeModel = RecipeModel(
                      name: foodName.text,
                      duration: '${duration - 5} m',
                      category: 'Food',
                      imagePath: File(''),
                    );

                    recipeBloc.add(AddRecipeEvent(recipeModel: recipeModel));

                    showUploadSuccess(context);
                  },
                ),

                SizedBox(height: context.getHeight(multiplied: 0.1)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
