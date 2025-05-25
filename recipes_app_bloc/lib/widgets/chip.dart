import 'package:flutter/material.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';

Widget buildChip({required String label, required Color color} ){
 return SizedBox(
  height: 47,
  width: 86,
   child: Chip(label: 
   Text(
    label, 
    style: TextStyle(
         color: ColorPallete.blue,
          fontWeight: FontWeight.w500,
           fontSize: 15
    ),
   ),
       backgroundColor: color,
      shape: RoundedRectangleBorder(
       
        borderRadius: BorderRadius.circular(32),
        side: BorderSide(color: Colors.transparent)
        
      ),
   
   ),
 );

}