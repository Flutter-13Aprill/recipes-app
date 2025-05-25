import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipes_app/Models/Recipe_Model.dart';
import 'package:flutter_recipes_app/Provider/Recipe_Provider%20.dart';
import 'package:flutter_recipes_app/Screen/Navigator_Screen.dart';
import 'package:flutter_recipes_app/Screen/Upload_Success_Screen.dart';
import 'package:flutter_recipes_app/Screen/bloc/ubload/bloc/ubload_bloc.dart';
import 'package:flutter_recipes_app/Screen/bloc/ubload/bloc/ubload_event.dart';
import 'package:flutter_recipes_app/Screen/bloc/ubload/bloc/ubload_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});

  final _foodNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      context.read<UploadBloc>().add(CoverImagePicked(File(pickedFile.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UploadBloc(),
      child: BlocBuilder<UploadBloc, UploadState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                          onPressed: () {
                             Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => NavigatorScreen()),
                          );},
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red.shade300),
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '1/',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3E5481),
                                  ),
                                ),
                                TextSpan(
                                  text: '2',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6B7A99),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Image Picker
                      Center(
                        child: GestureDetector(
                          onTap: () => _pickImage(context),
                          child: DottedBorder(
                            color: const Color(0xFFD0DBEA),
                            strokeWidth: 2,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            dashPattern: const [6, 3],
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                                image:
                                    state.image != null
                                        ? DecorationImage(
                                          image: FileImage(state.image!),
                                          fit: BoxFit.cover,
                                        )
                                        : null,
                              ),
                              child:
                                  state.image == null
                                      ? const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image_rounded,
                                            size: 64,
                                            color: Color(0xFF9FA5C0),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Add Cover Photo',
                                            style: TextStyle(
                                              color: Color(0xFF3E5481),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            '(up to 12 Mb)',
                                            style: TextStyle(
                                              color: Color(0xFF9FA5C0),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      )
                                      : null,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Food Name
                      const Text(
                        'Food Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3E5481),
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _foodNameController,
                        onChanged:
                            (value) => context.read<UploadBloc>().add(
                              FoodNameChanged(value),
                            ),
                        decoration: InputDecoration(
                          hintText: 'Enter food name',
                          hintStyle: const TextStyle(
                            color: Color(0xFF9FA5C0),
                            fontSize: 15,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: const BorderSide(
                              color: Color(0xFFD0DBEA),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: const BorderSide(
                              color: Color(0xFFD0DBEA),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: const BorderSide(
                              color: Color(0xFF3FD28B),
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Description
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3E5481),
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _descriptionController,
                        maxLines: 3,
                        onChanged:
                            (value) => context.read<UploadBloc>().add(
                              DescriptionChanged(value),
                            ),
                        decoration: const InputDecoration(
                          hintText: 'Tell a little about your food',
                          hintStyle: TextStyle(
                            color: Color(0xFF9FA5C0),
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFD0DBEA)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFD0DBEA)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF3FD28B),
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Cooking Duration
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Cooking Duration ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3E5481),
                                fontSize: 17,
                              ),
                            ),
                            TextSpan(
                              text: '(in minutes)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9FA5C0),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '<10',
                            style: TextStyle(
                              color:
                                  (state.duration) > 10
                                      ? Colors.green
                                      : Color(0xFF9FA5C0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '30',
                            style: TextStyle(
                              color:
                                  (state.duration) >= 30
                                      ? Colors.green
                                      : Color(0xFF9FA5C0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '>60',
                            style: TextStyle(
                              color:
                                  (state.duration) == 60
                                      ? Colors.green
                                      : Color(0xFF9FA5C0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: (state.duration).toDouble(),
                        min: 0,
                        max: 60,
                        divisions: 6,
                        label: ((state.duration).round()).toString(),
                        onChanged:
                            (value) => context.read<UploadBloc>().add(
                              DurationChanged(value),
                            ),
                        activeColor: Colors.green,
                        inactiveColor: const Color(0xFF9FA5C0),
                      ),
                      const SizedBox(height: 50),

                      // Next Button
                      Center(
                        child: SizedBox(
                          height: 56,
                          width: 340,
                          child: ElevatedButton(
                            onPressed:
                                state.isValid
                                    ? () {
                                      final recipe = Recipe(
                                        title: _foodNameController.text,
                                        imagePath: state.image!.path,
                                       
                                        isLiked: false, 
                                      );

                                      Provider.of<RecipeProvider>(
                                        context,
                                        listen: false,
                                      ).addRecipe(recipe);

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder:
                                            (context) => UploadSuccessScreen(),
                                      );
                                    }
                                    : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3FD28B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
