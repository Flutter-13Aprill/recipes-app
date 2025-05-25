import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.width,
    required this.img,
    required this.lable,
    this.icon,
    this.color,
    required this.controller,
    this.validator, this.onChanged,
  });
  final double width;
  final String img;
  final String lable;
  final Icon? icon;
  final Color? color;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * width,
      height: 60,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          prefixIcon: Image.asset(img, width: 24),
          suffixIcon: icon,
          hintText: lable,
          hintStyle: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(color: AppColors.secondaryText),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
