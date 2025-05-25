import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'home_screen.dart';
import 'dart:io';

class UploadStep extends StatelessWidget {
  UploadStep({super.key});

  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ValueNotifier<File?> _image = ValueNotifier(null);

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _image.value = File(picked.path);
    }
  }

  void _clearFields() {
    _foodNameController.clear();
    _descriptionController.clear();
    _image.value = null;
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          width: MediaQuery.of(context).size.width * 0.7,
          constraints: const BoxConstraints(
            minHeight: 360,
            maxHeight: 500,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Image.asset(
                'assets/pic/image.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                "Upload Success",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your recipe has been uploaded\nyou can see it on your profile.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Missing Data"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _handleNext(BuildContext context) {
    if (_foodNameController.text.isEmpty) {
      _showErrorDialog(context, "Please enter the food name.");
      return;
    }

    if (_descriptionController.text.isEmpty) {
      _showErrorDialog(context, "Please enter a description.");
      return;
    }

    if (_image.value == null) {
      _showErrorDialog(context, "Please select an image.");
      return;
    }

    print("Image: ${_image.value?.path}");
    print("Food: ${_foodNameController.text}");
    print("Desc: ${_descriptionController.text}");
    print("Duration: 30 mins");

    _showSuccessDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _clearFields,
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    '1/2',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: _pickImage,
                child: ValueListenableBuilder<File?>(
                  valueListenable: _image,
                  builder: (context, img, _) {
                    return Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 254, 253, 253),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 226, 225, 225),
                          width: 1.5,
                        ),
                        image: img != null
                            ? DecorationImage(
                                image: FileImage(img),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: img == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.photo,
                                    size: 50, color: Colors.grey),
                                SizedBox(height: 8),
                                Text(
                                  'Add Cover Photo',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Up to 12 MB',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          : null,
                    );
                  },
                ),
              ),
              //Food Name
              const SizedBox(height: 16),
              const Text("Food Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 6),
              TextField(
                controller: _foodNameController,
                decoration: InputDecoration(
                  hintText: 'Enter food name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                style: const TextStyle(fontSize: 13),
              ),
              //food Description
              const SizedBox(height: 16),
              const Text("Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 6),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Tell a little about your food',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 20),

              // Cooking Duration
              const Text("Cooking Duration (in minutes)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('<10', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('30', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('>60', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 4),
             SliderTheme(
  data: SliderTheme.of(context).copyWith(
    activeTrackColor: Colors.green,
    inactiveTrackColor: Colors.grey.withOpacity(0.3),
    thumbColor: Colors.green,
    disabledActiveTrackColor: Colors.green,
    disabledInactiveTrackColor: Colors.green.withOpacity(0.3),
    disabledThumbColor: Colors.green,
  ),
  child: Slider(
    value: 58,
    min: 4,
    max: 100,
    divisions: 11,
    onChanged: (value) {},
  ),
),


              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () => _handleNext(context),
                  child: const Text("Next",
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
