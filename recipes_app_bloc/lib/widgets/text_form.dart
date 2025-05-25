import 'package:flutter/material.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';
import 'package:recipes_app_bloc/style/font_style.dart';

Widget buildTextField({required String hintText, required String textType, required String iconName, required TextEditingController controller, bool isPassword  =  false,  void Function(String)? onChanged,} ){
return
  SizedBox(
    width: 327,
    height: 56,
    child:Form(
      
      child: TextFormField(
        
obscureText: isPassword,
 onChanged: onChanged,
      keyboardType: TextInputType.multiline,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
           
        prefixIcon:  Image.asset("lib/assets/images/$iconName.png"),
          suffixIcon: isPassword
       
            ? Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Transform.scale(
          scale: 0.5, 
          child: Image.asset(
            "lib/assets/images/Show.png",
            fit: BoxFit.contain,
          ),
        ),
      )

            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: ColorPallete.bluishGrey),
        
        ),
      enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: ColorPallete.bluishGrey),
      ),
      errorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: ColorPallete.red),
      ),
      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
          borderSide: BorderSide(color: ColorPallete.green),
      ),
        
      ),
      style: AppTextStyle.fontStyleThree,
     
      )
      ),
);
}