import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/screen/bottom_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import '../bloc/recipe_bloc.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});
  final recipeNameController =
      TextEditingController(); //controller for recipe name field
  final decripController =
      TextEditingController(); //controller for decription field

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipeBloc(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state) {
                final bloc = context.read<RecipeBloc>();
                String name = '';
                String description = '';
                XFile? image;

                if (state is UploadState) {
                  name = state.name;
                  description = state.description;
                  image = state.image;
                }

                if (recipeNameController.text != name) {
                  recipeNameController.text = name;
                  recipeNameController.selection = TextSelection.fromPosition(
                    TextPosition(offset: recipeNameController.text.length),
                  );
                }
                if (decripController.text != description) {
                  decripController.text = description;
                  decripController.selection = TextSelection.fromPosition(
                    TextPosition(offset: decripController.text.length),
                  );
                }

                return Column(
                  children: [
                    Container(
                      height: 160,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                      ),

                      child: DottedBorder(
                        options: RectDottedBorderOptions(
                          strokeWidth: 1,
                          color: const Color.fromARGB(255, 130, 191, 220),
                        ),

                        child: InkWell(
                          onTap: () => bloc.add(PickImageEvent()),
                          child: Center(
                            child:
                                image == null
                                    ? Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Image.asset("assets/images/image.png"),

                                        Text('Add Cover Photo'),
                                        Text("(up to 12 Mb)"),
                                      ],
                                    )
                                    : Image.file(File(image.path), height: 160),
                          ),
                        ),
                      ),
                    ),
                    if (image != null)
                      Image.file(File(image.path), height: 200),

                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsetsGeometry.only(right: 220),
                      child: Text(
                        "Food Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF3E5481),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 48,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: const Color.fromARGB(149, 158, 158, 158),
                        ),
                      ),
                      child: TextField(
                        controller: recipeNameController,
                        decoration: InputDecoration(
                          labelText: '  Enter Food name',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(212, 158, 158, 158),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (val) => bloc.add(SetNameEvent(val)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsetsGeometry.only(right: 220),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF3E5481),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),

                    Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color.fromARGB(149, 158, 158, 158),
                        ),
                      ),
                      child: TextField(
                        controller: decripController,
                        decoration: InputDecoration(
                          labelText: '  Tell a little about your food',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(212, 158, 158, 158),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (val) => bloc.add(SetDescEvent(val)),
                      ),
                    ),

                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1FCC79),
                        padding: EdgeInsets.symmetric(
                          horizontal: 120,
                          vertical: 16,
                        ),
                      ),
                      onPressed: () {
                        bloc.add(SaveEvent());

                        showDialog(
                          context: context,
                          builder:
                              (ctx) => AlertDialog(
                                content: Container(
                                  height: 400,
                                  width: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 24),
                                      Image.asset("assets/images/emoji.png"),
                                      SizedBox(height: 10),
                                      const Text(
                                        "Upload Success",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32,
                                          color: Color(0xFF3E5481),
                                        ),
                                      ),
                                      Text(
                                        "Your recipe has been uploaded,\n   you can see it on your profile",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF3E5481),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF1FCC79),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 120,
                                            vertical: 16,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => BottomNavBar(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Home",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
