import 'package:flutter/material.dart';
import 'package:project5/extensions/sizes.dart';

class AuthorizeTextField extends StatelessWidget {
  const AuthorizeTextField({
    super.key,
    required this.isPassword,
    required this.setHint,
    required this.preIcon,
    this.suffIcon,
    this.controller,
    this.globalKey,
    this.valid,
    this.onChanged,
    this.isVisable,
    this.onPressed,
  });

  final bool isPassword;
  final bool? isVisable;
  final String setHint;
  final String preIcon;
  final Icon? suffIcon;
  final TextEditingController? controller;
  final GlobalKey? globalKey;
  final String? Function(String?)? valid;
  final Function(String)? onChanged;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() * 0.76,
      child: TextFormField(
        controller: controller,
        validator: valid!,
        obscureText: isPassword ? isVisable! : false,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          hintText: setHint,
          suffixIcon:
              isPassword
                  ? IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      isVisable!
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    color: Color.fromARGB(255, 159, 165, 192),
                  )
                  : null,
          prefixIcon: Image.asset(preIcon),
        ),
      ),
    );
  }
}
