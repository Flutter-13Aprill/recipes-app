import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_buttons.dart';
import 'package:recipes_app/style/app_colors.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  const CustomAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(56),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🥳', style: TextStyle(fontSize: 150)),
          SizedBox(height: 20),
          Text(
            'Upload Success',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: AppColors.lightrimary),
          ),

          SizedBox(height: 10),
          Text(
            'Your recipe has been uploaded,\nyou can see it on your profile',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: AppColors.primary),
          ),
          SizedBox(height: 20),

          ElevatedButton(
            style: AppButtons.primaryXs(context),

            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => BottomNavbarScreen()),
              // );
            },
            child: Text(
              "Back to Home",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
