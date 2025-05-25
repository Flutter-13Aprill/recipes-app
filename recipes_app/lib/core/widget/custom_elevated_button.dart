import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
   const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,  required this.width,  required this.height
  });
  final String text;
  final VoidCallback onPressed;
  final double width;
 final double height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(backgroundColor: AppPalette.lightGreen,fixedSize: Size(width, height)  ),child: Text(text,style:  TextStyle(color: AppPalette.whiteColor)));
  }
}
