import 'package:flutter/material.dart';
import 'package:recipes_app/features/upload/screens/uploud_form_screen.dart';
import 'package:recipes_app/features/widgets/buttom_widget.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ButtomWidget(
            onTab: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadFormScreen()),
              );
            },
            textElevatedButton: 'Let\'s add new recipe 📝',
          ),
        ),
      ),
    );
  }
}
