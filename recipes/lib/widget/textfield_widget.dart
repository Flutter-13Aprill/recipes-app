import 'package:flutter/material.dart';
import 'package:recipes/theems/color.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.hintText,
    required this.iconprefix,
    required this.controller,
    this.validator,
    this.iconsuffix,
    this.onchange,
     this.obscureText=false,
  });
  final String hintText;
  final Widget? iconsuffix;
  final IconData iconprefix;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onchange;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onchange,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(iconprefix),
        suffixIcon: iconsuffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: myAppColor.greencolor),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
