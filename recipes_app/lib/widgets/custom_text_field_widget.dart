import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final void Function(String)? onChanged;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(color: AppColors.primary),
      decoration: InputDecoration(
        label: Text(label, style: Theme.of(context).textTheme.bodyMedium),
        prefixIcon: Icon(prefixIcon, color: AppColors.primary),
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon, color: AppColors.secondary)
                : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),

          borderSide: BorderSide(color: AppColors.lightSecondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),

          borderSide: BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),

          borderSide: BorderSide(color: Colors.red),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),

          borderSide: BorderSide(color: AppColors.lightSecondary),
        ),
        contentPadding: EdgeInsets.all(13),
      ),
    );
  }
}
