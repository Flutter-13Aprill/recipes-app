import 'package:flutter/material.dart';
import 'package:recipes_app/extensions/screens/get_size_screen.dart';
import 'package:recipes_app/features/navigation/screen/navigation_bar_screen.dart';
import 'package:recipes_app/features/widgets/buttom_widget.dart';

// Displays a success dialog after uploading a recipe,
void showUploadSuccessDialog(context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          content: SizedBox(
            height: context.getHeight() / 2.5,
            child: Column(
              children: [
                Text('🥳', style: TextStyle(fontSize: 180)),
                Text(
                  'Upload Success',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Your recipe has been uploaded,\nyou can see it on your profile.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          actions: [
            ButtomWidget(
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationBarScreen(),
                  ),
                );
              },
              textElevatedButton: 'Back to Home',
            ),
          ],
        ),
  );
}
