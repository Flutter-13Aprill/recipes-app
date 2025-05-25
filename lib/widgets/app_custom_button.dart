import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';
import 'package:re/utilities/screens/screen_sizes.dart';


class AppCustomButton extends StatelessWidget {
  const AppCustomButton({super.key, required this.label, required this.onPressed });

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(context.getWidth(), context.getHeight(multiplied: 0.05),),
        backgroundColor: AppColors.buttonColor,
        textStyle: Theme.of(context).textTheme.displayMedium,
        foregroundColor: Colors.white,
      ),
      child: Text(label, style: Theme.of(context).textTheme.displayMedium,),
    );
  }
}
