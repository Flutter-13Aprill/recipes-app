import 'package:flutter/material.dart';
import 'package:recipes_app/Theme/app_colors.dart';

class TextFiledAuthWidget extends StatelessWidget {
  const TextFiledAuthWidget({
    super.key,
    required this.validator,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.onChange ,
  });
  final Function? validator;
  final Function(String)? onChange;
  final String hintText;
  final int maxLines;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChange != null
          ? (value) {
              onChange!(value);
            }
          : null,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(maxLines > 1 ? 16 : 32),

          borderSide: BorderSide(color: AppColors.success),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(maxLines > 1 ? 16 : 32),
        ),
        suffixIcon: Icon(suffixIcon, color: AppColors.textHint),
      ),
      validator: validator != null ? (value) => validator!(value) : null,
    );
  }
}
