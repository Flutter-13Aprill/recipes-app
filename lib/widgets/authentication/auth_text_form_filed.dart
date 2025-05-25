import 'package:flutter/material.dart';

// -- External Package
import 'package:flutter_svg/svg.dart';
import 'package:re/app_theming/app_colors.dart';



class AuthTextFormFiled extends StatelessWidget {
  const AuthTextFormFiled({
    super.key,
    required this.controller,
    required this.hintText,
    // this.isTherePrefixIcon = false,
    this.prefixIconPath,
    //this.isThereSuffixIcon = false,
    this.suffixIconPath,
    this.isPassword = false,
    this.isShowPassword = false,
    this.focusNode,
    this.onChanged,
    this.onValidate,
    this.onPressed
  });

  final TextEditingController controller;
  final String hintText;

  //final bool isTherePrefixIcon;
  final String? prefixIconPath;

  //final bool isThereSuffixIcon;
  final String? suffixIconPath;

  final bool isPassword;
  final bool isShowPassword;

  final FocusNode? focusNode;

  final String? Function(String?)? onValidate;
  final void Function(String value)? onChanged;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      cursorHeight: 12,
      cursorColor: AppColors.borderColorUnfocusInput,
      obscureText: isShowPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall,
        prefixIcon: SvgPicture.asset(prefixIconPath!, fit: BoxFit.scaleDown),
        suffixIcon:isPassword ? IconButton(icon: Icon(isShowPassword ? Icons.visibility_off : Icons.visibility,),onPressed: onPressed) : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColorUnfocusInput,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColorFocusInput,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      onChanged: onChanged,
      validator: onValidate,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
