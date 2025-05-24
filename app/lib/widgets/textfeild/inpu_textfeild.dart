// lib/widgets/textfeild/inpu_textfeild.dart
import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class InpuTextfeild extends StatelessWidget {
  //definae vaibles and ini in constractor 
  final TextEditingController formFeidController;
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;  
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool? obscureText;

  InpuTextfeild({
    super.key,
    required this.formFeidController,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      //Container with margin & width
      margin: EdgeInsets.only(left: 16, right: 16),
      width: context.getWight(),
      child: TextFormField(
        obscureText: obscureText ?? false,//if it passwod make it  scure 
        onChanged: onChanged,//call method 
        validator: validator,//call method 
        controller: formFeidController,//give controller
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),//rounded 
            borderSide: BorderSide(color: Color(0xff1FCC79)),//color it 
          ),
          suffixIcon: suffixIcon, 
          prefixIcon: prefixIcon,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
        ),
      ),
    );
  }
}