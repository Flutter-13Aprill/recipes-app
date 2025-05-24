import 'package:flutter/material.dart';
import 'package:recipes_app/Theme/app_colors.dart';

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({super.key, required this.onTap, required this.text});
  final Function onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
          onTap: (){  onTap();},
          child: Container(
            alignment: Alignment.center,
            width: 327,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.success,
              borderRadius: BorderRadius.circular(32),
              
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.surface,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
  }
}