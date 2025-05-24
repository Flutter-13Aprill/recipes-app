import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/cusom_widget/main_buttom.dart';
import 'package:recipe/screens/upload/bloc/upload_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe/screens/upload/bloc/upload_state.dart';
import 'package:recipe/screens/upload_success_screen/upload_success_screen.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UploadBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<UploadBloc, UploadState>(
            builder: (context, state) {
              final Bolc = context.read<UploadBloc>();
              return SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cancel", style: TextStyle(color: Colors.red)),
                    Text("1/2", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 24),
                    //add image
                    GestureDetector(
                      onTap: () async {
                        final picked = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (picked != null) {
                          Bolc.add(ChangeImage(File(picked.path)));
                        }
                      },
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: state.coverImage == null
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.image_outlined, size: 40),
                                    SizedBox(height: 8),
                                    Text(
                                      "Add Cover Photo",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "(up to 12 Mb)",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              : Image.file(
                                  state.coverImage!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Food Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      onChanged: (val) => Bolc.add(ChangeFoodName(val)),
                      decoration: InputDecoration(
                        hintText: "Enter food name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                    const Text(
                      "Description",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLines: 3,
                      onChanged: (val) => Bolc.add(ChangeDescription(val)),
                      decoration: InputDecoration(
                        hintText: "Tell a little about your food",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                    const Text.rich(
                      TextSpan(
                        text: "Cooking Duration ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: "(in minutes)",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      value: state.duration,
                      onChanged: (val) => Bolc.add(ChangeDuration(val)),
                      min: 0,
                      max: 60,
                      divisions: 6,
                      activeColor: Colors.green,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("<10", style: TextStyle(color: Colors.green)),
                          Text("30", style: TextStyle(color: Colors.green)),
                          Text(">60", style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    MainButton(
                      text: "Next",
                      onPressed: () {
                        SuccessUpload(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
