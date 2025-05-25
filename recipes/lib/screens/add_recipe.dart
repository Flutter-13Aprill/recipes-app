import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes/theems/color.dart';
import 'package:recipes/widget/button_one.dart';
import '../bloc/add_recipe_bloc.dart';

class AddRecipeScreen extends StatelessWidget {
  const AddRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final duration = ValueNotifier<double>(30);
    final imageFile = ValueNotifier<File?>(null);
    final personnamecontroller = TextEditingController();
    Future<void> pickImage() async {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        imageFile.value = File(picked.path);
      }
    }

    void showSuccessDialog(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (_) => AlertDialog(
              backgroundColor: myAppColor.whitecolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("images/face.png"),
                  SizedBox(height: 16),
                  Text(
                    "Upload Success",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Your recipe has been uploaded,\nyou can see it on your profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myAppColor.greencolor,
                    ),
                    child: Text(
                      "Back to Home",
                      style: TextStyle(color: myAppColor.whitecolor),
                    ),
                  ),
                ],
              ),
            ),
      );
      //close the dilog
      Future.delayed(Duration(seconds: 6), () {
        Navigator.pop(context);
      });
    }

    void submit(BuildContext context) {
      if (imageFile.value != null &&
          nameController.text.isNotEmpty &&
          descController.text.isNotEmpty) {
        context.read<AddRecipeBloc>().add(
          AddRecipePressed(
            personname: personnamecontroller.text,
            image: imageFile.value!,
            title: nameController.text,
            description: descController.text,
            duration: duration.value.toInt(),
          ),
        );
        showSuccessDialog(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("all the fields is requierd")),
        );
      }
    }

    return BlocProvider(
      create: (context) => AddRecipeBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AddRecipeBloc>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      Text("1/2"),
                    ],
                  ),
                  SizedBox(height: 30),
                  ValueListenableBuilder<File?>(
                    valueListenable: imageFile,
                    builder: (context, value, __) {
                      return GestureDetector(
                        onTap: () {
                          pickImage(); // pick picture
                        },
                        child: DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 1,
                          dashPattern: [6, 4],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          child: Container(
                            height: 160,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image, size: 48, color: Colors.grey),
                                SizedBox(height: 8),
                                Text(
                                  "Add Cover Photo",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "(up to 12 Mb)",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Food Name"),
                  SizedBox(height: 13),
                  TextField(
                    controller: nameController,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Enter food name",
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Description"),
                  SizedBox(height: 13),
                  TextField(
                    controller: descController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 13),

                  SizedBox(height: 8),
                  Text("Cooking Duration (in minutes)"),
                  SizedBox(height: 13),
                  // setstate the value number change the color for the slider
                  ValueListenableBuilder<double>(
                    valueListenable: duration,
                    builder: (context, value, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "<10",
                            style: TextStyle(
                              color: value < 10 ? Colors.green : Colors.grey,
                              fontWeight:
                                  value < 10
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          Text(
                            "30",
                            style: TextStyle(
                              color:
                                  (value >= 25 && value <= 35)
                                      ? Colors.green
                                      : Colors.grey,
                              fontWeight:
                                  (value >= 25 && value <= 35)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          Text(
                            ">60",
                            style: TextStyle(
                              color: value > 50 ? Colors.green : Colors.grey,
                              fontWeight:
                                  value > 50
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  // slider
                  ValueListenableBuilder<double>(
                    valueListenable: duration,
                    builder: (context, value, __) {
                      return Slider(
                        value: value,
                        min: 10,
                        max: 60,
                        divisions: 6,
                        activeColor: myAppColor.greencolor,
                        onChanged: (val) => duration.value = val,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  ButtonOne(text: "Next", onPressed: () => submit(context)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
