import 'package:flutter/material.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';
import 'package:recipes_app_bloc/style/font_style.dart';
import 'package:recipes_app_bloc/widgets/tab_bar_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
         SizedBox(height: 60),
        Row(children: [
          SizedBox(width: 378),
          Image.asset("lib/assets/images/share.png"),
        ],),
        SizedBox(height: 60),
        Image.asset("lib/assets/images/Avatar.png"),
         SizedBox(height: 16),
         Text("Choirul Syafrill", style: AppTextStyle.fontStyleEight,),
         SizedBox(height: 22),
        Row(
          children: [
              SizedBox(width: 90),
            Column(children: [
           
              Text("32", style:  AppTextStyle.fontStyleEight),
                 Text("Recipes", style: AppTextStyle.fontStyleTen),
            ],),
              SizedBox(width: 48),
            Column(children: [
              Text("782", style:  AppTextStyle.fontStyleEight),
                 Text("Following", style: AppTextStyle.fontStyleTen),
            ],),
            SizedBox(width: 48),
             Column(children: [
        
              Text("1.287", style:  AppTextStyle.fontStyleEight),
                 Text("Followers", style: AppTextStyle.fontStyleTen),
            ],),
          ],
        ),
        SizedBox(height: 22),
        Row(
        children: [
          Container(
            width: 428,
            height: 8,
            decoration: BoxDecoration(
              color: ColorPallete.grey,
              
            ),
          ),
        ],
        
      ),
      SizedBox(height: 22),
       Expanded(child: buildTabBarProfile()),
      ],),
    );
  }
}