import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/theme/app_colors.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    super.key,
    required this.pageRoute,
    required this.setText,
  });

  final Widget pageRoute;
  final String setText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() * 0.76,
      height: context.getHeight() * 0.058,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.buttonsColor,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoute),
          );
        },
        child: Text(
          setText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
