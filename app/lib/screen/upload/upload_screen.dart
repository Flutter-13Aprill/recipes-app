import 'dart:io';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_bloc.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_event.dart';
import 'package:app/screen/upload/bloc/upload_bloc.dart';
import 'package:app/screen/upload/bloc/upload_event.dart';
import 'package:app/screen/upload/bloc/upload_state.dart';
import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:app/widgets/container/line_conatiner.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart'; // For debugPrint

// Custom path for DottedBorder (used in image upload area)
Path customPath(Size size) {
  Path path = Path();
  path.moveTo(0, 0);
  path.lineTo(size.width, 0);
  path.lineTo(size.width, size.height);
  path.lineTo(0, size.height);
  path.close();
  return path;
}

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  /// Displays a success dialog after a successful recipe upload.

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), //make it rounded
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0), //add padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/16.png',
                  height: context.getHight()*.2,
                  width: context.getHight()*.2,
                ), //dispay image
                const SizedBox(height: 20),
                const Text(
                  "Upload Success", //dispay text and style
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  //text
                  "Your recipe has been uploaded, you can see it on your profile",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close dialog and go back
                    },
                    style: ElevatedButton.styleFrom(
                      //define a style
                      backgroundColor: const Color(0xff1FCC79),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Back to Home", //button text and style
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UploadFoodBloc(), //create a bloc for screen
      child: BlocListener<UploadFoodBloc, UploadFoodState>(
        listener: (context, state) {
          // Listen for successful upload
          if (state.status == UploadStatus.success && state.newRecipe != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<RecipeBloc>().add(
                AddRecipeEvent(state.newRecipe!),
              ); //add newRecipe

              _showSuccessDialog(context); // Show success popup
              context.read<UploadFoodBloc>().add(
                const UploadStatusReset(),
              ); // Reset upload status
            });
          } else if (state.status == UploadStatus.failure) {
            // Show error message if upload fails
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Upload Failed: ${state.errorMessage}')),
            );
          }
        },
        child: BlocBuilder<UploadFoodBloc, UploadFoodState>(
          builder: (context, state) {
            final uploadBloc =
                context
                    .read<UploadFoodBloc>(); // Get instance of UploadFoodBloc

            return Scaffold(
              appBar: AppBar(
                leading: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    "Cancel", //display text
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "1/2", //dispaly text and style
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          //bottom sheet  for slection image way
                          context: context,
                          builder: (context2) {
                            return SafeArea(
                              child: Wrap(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.photo_library),
                                    title: const Text('Photo Library'),

                                    ///from gallery
                                    onTap: () async {
                                      final picker =
                                          ImagePicker(); //make  ImagePicker obj
                                      //wait for image spasify size
                                      final image = await picker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 70,
                                        maxWidth: 1024,
                                        maxHeight: 1024,
                                      );
                                      if (image != null) {
                                        //f user chosse image
                                        uploadBloc.add(
                                          ImageSelected(image),
                                        ); //add it to this event
                                      } //close it
                                      Navigator.of(context2).pop();
                                    },
                                  ),
                                  ListTile(
                                    //select image by camea
                                    leading: const Icon(Icons.photo_camera),
                                    title: const Text('Camera'), //title
                                    onTap: () async {
                                      final picker = ImagePicker();

                                      // take image from cam
                                      final image = await picker.pickImage(
                                        source: ImageSource.camera,
                                      );
                                      //if use give image
                                      if (image != null) {
                                        uploadBloc.add(
                                          ImageSelected(image),
                                        ); //add it
                                      } //close it
                                      Navigator.of(context2).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }, //DottedBorderfor border of image conatiner make it dashed
                      child: DottedBorder(
                        options: CustomPathDottedBorderOptions(
                          customPath: customPath, //call customPath
                        ),
                        child: Container(
                          //conatner with spaisics syle
                          width: double.infinity,
                          height: context.getHight()*.2,
                          color: Colors.grey[200],
                          child: //if image uploadded display on screen
                              state.uploadData.image != null
                                  ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(state.uploadData.image!.path),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ) //else dispay this cloum with icon and text and styleing tthem
                                  : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Add Cover Photo",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "(up to 12 Mb)",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Food Name", //dispay the text and give it style
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      //TextFormField
                      controller: uploadBloc.foodNameController, //controller
                      onChanged: (value) {
                        uploadBloc.add(FoodTitleChanged(value)); //add to event
                      },
                      decoration: const InputDecoration(
                        //give it hit asn style
                        hintText: "Enter food name",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Description", //text Description and style it
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      //TextFormField for descritopn
                      controller: uploadBloc.descriptionController,
                      maxLines: 4,
                      onChanged: (value) {
                        uploadBloc.add(DescriptionChanged(value));
                      },
                      decoration: const InputDecoration(
                        hintText: "Tell a little about your food",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Cooking Duration (in minutes)", //text for Duration
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Slider(
                      //Slider for cook
                      value:
                          state
                              .uploadData
                              .cookingMinutes, //cookingMinuteshave defalut value
                      min: 0, //min value
                      max: 60, //maxvaue
                      divisions: 6, //incrment or decremt by 6
                      label:
                          state.uploadData.cookingMinutes
                              .round()
                              .toString(), //cookingMinutes
                      onChanged: (value) {
                        uploadBloc.add(
                          CookingMinutesChanged(value),
                        ); //add to CookingMinutesChanged
                      },
                      activeColor: const Color(0xff1FCC79), //activeColor
                      inactiveColor: Colors.grey[300], //inactiveColor
                    ),
                    Row(
                      //row to display cooke minutes
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("<10"), //text
                        Text(
                          "${state.uploadData.cookingMinutes.round()} min", //value chossen by user
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(">60"), //text
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          uploadBloc.add(
                            const UploadSubmitted(),
                          ); //add to UploadSubmitted
                        },//give it style 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1FCC79),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Next",//text 
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const LineConatiner(),//custom widgts 
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
