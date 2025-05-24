import 'package:flutter/material.dart';
import 'package:recipe/cusom_widget/main_buttom.dart';

void SuccessUpload(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("🥳", style: TextStyle(fontSize: 200)),
              const SizedBox(height: 16),
              const Text(
                "Upload Success",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your recipe has been uploaded,\nyou can see it on your profile",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              MainButton(
                text: "Back to Home",
                onPressed: () {
                  Navigator.of(context).pop(); // close pop up
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
