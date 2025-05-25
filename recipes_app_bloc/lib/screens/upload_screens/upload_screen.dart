import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes_app_bloc/models/recipe_model.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_bloc.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_event.dart';
import 'package:recipes_app_bloc/screens/upload_screens/bloc/upload_bloc.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:recipes_app_bloc/style/font_style.dart';
import 'package:recipes_app_bloc/widgets/content_card_profile.dart';
class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UploadBloc(),
      child: Scaffold(
        body: UploadScreenContent(), 
      ),
    );
  }
}


    
   class UploadScreenContent extends StatelessWidget {
  const UploadScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UploadBloc>().state;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60),
          Row(
            children: [
              SizedBox(width: 42),
              Text("Cancel", style: AppTextStyle.fontStyleFourteen),
              SizedBox(width: 270),
              Text("1/2", style: AppTextStyle.fontStyleEight),
            ],
          ),
          SizedBox(height: 32),
      
          DottedBorder(
            color: ColorPallete.bluishGrey,
            strokeWidth: 2,
            dashPattern: [6, 4],
            borderType: BorderType.RRect,
            radius: Radius.circular(16),
            child: Container(
              width: 327,
              height: 161,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () async{  final picker = ImagePicker();
               final pickedFile = await picker.pickImage(source: ImageSource.gallery);
               if (pickedFile != null) {
               context.read<UploadBloc>().add(UpdateImage(pickedFile.path));
                }},
                child: Column(
                  children: [
                    SizedBox(height: 22),
                    state.imagePath != null
        ? Image.file(
        File(state.imagePath!),
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      )
        : Image.asset(
        "lib/assets/images/Image.png",
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      
                    SizedBox(height: 16),
                    Text("Add Cover Photo", style: AppTextStyle.fontStyleEight),
                    SizedBox(height: 8),
                    Text("(up to 12 MB)", style: AppTextStyle.fontStyleTen),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 48),
              Text("Food Name", style: AppTextStyle.fontStyleEight),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 327,
            height: 56,
            child: TextField(
              onChanged: (value) {
                context.read<UploadBloc>().add(UpdateTitle(value));
              },
              decoration: InputDecoration(
                hintText: 'Enter recipe name',
                hintStyle: AppTextStyle.fontStyleTen,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: ColorPallete.bluishGrey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: ColorPallete.bluishGrey, width: 1.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 48),
              Text("Description", style: AppTextStyle.fontStyleEight),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 327,
            height: 80,
            child: TextField(
              onChanged: (value) {
                context.read<UploadBloc>().add(UpdateDescription(value));
              },
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Tell a little about your food',
                hintStyle: AppTextStyle.fontStyleTen,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: ColorPallete.bluishGrey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: ColorPallete.bluishGrey, width: 1.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 48),
              Text("Cooking Duration", style: AppTextStyle.fontStyleEight),
              Text("(in minutes)"),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 327,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('<10', style: TextStyle(color: ColorPallete.green)),
                Text('30', style: TextStyle(color: ColorPallete.green)),
                Text('>60', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          SizedBox(
            width: 370,
            child: Slider(
              value: state.duration,
              min: 0,
              max: 2,
              divisions: 2,
              onChanged: (value) {
                context.read<UploadBloc>().add(UpdateDuration(value));
              },
              activeColor: ColorPallete.green,
              inactiveColor: ColorPallete.grey,
            ),
          ),
          SizedBox(height: 32),
          SizedBox(
            width: 327,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
               
        final uploadState = context.read<UploadBloc>().state;

  // Add the uploaded recipe to MyRecipesBloc with isUploaded: true
  context.read<MyRecipesBloc>().add(AddRecipe(
    RecipeModel(
      imagePath: uploadState.imagePath ?? 'lib/assets/images/Image.png',
      title: uploadState.title,
      description: uploadState.description,
      isUploaded: true, // shows in the Recipes tab only
    ),
  ));

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(24),
                      content: SizedBox(
                        width: 327,
                        height: 358,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  SizedBox(width: 72),
                                  Image.asset("lib/assets/images/hooray.png"),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  SizedBox(width: 64),
                                  Text('Upload Success', style: AppTextStyle.fontStyleOne),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  SizedBox(width: 32),
                                  Text(
                                    'Your recipe has been uploaded,\n you can see it on your profile',
                                    style: AppTextStyle.fontStyleFour,
                                  ),
                                ],
                              ),
                              Spacer(),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/home');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: ColorPallete.green,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: Text('Back to Home'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorPallete.green,
                foregroundColor: Colors.white,
              ),
              child: Text("Next", style: AppTextStyle.buttonText),
            ),
          ),
        
          SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 48),
              Text("Preview", style: AppTextStyle.fontStyleEight),
            ],
          ),
          SizedBox(height: 16),
          recipesCardWidgetProfile(

  recipe: RecipeModel(
    imagePath: state.imagePath ?? 'lib/assets/images/Image.png',
    title: state.title.isNotEmpty ? state.title : 'Your title',
    description: state.description.isNotEmpty
        ? state.description
        : 'Your description',

          
  )

                
          ),
        ],
      ),
    );
  }
}
   

