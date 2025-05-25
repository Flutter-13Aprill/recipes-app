import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';
import 'package:re/utilities/screens/screen_sizes.dart';
import 'package:re/widgets/app_custom_button.dart';


Future<T?> showUploadSuccess<T>(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          width: context.getWidth(),
          height: context.getHeight(multiplied: 0.5),
          child: Column(
            children: [
              SizedBox(height: context.getHeight(multiplied: 0.04)),

              Image.asset('assets/upload_recipe/image2.png'),

              SizedBox(height: context.getHeight(multiplied: 0.04)),

              Text(
                'Upload Success',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.mainTextColor,
                ),
              ),

              SizedBox(height: context.getHeight(multiplied: 0.02)),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.getWidth(multiplied: 0.55),
                  maxHeight: context.getHeight(multiplied: 0.1),
                ),
                child: Text(
                  'Your recipe has been uploaded, you can see it on your profile',
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: context.getHeight(multiplied: 0.09)),

              AppCustomButton(
                label: 'Back to Home',
                onPressed:() => Navigator.pop(context)
              ),
              
            ],
          ),
        ),
      );
    },
  );
}
