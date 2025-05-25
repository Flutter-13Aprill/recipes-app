import 'package:flutter/material.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';
import 'package:recipes_app_bloc/style/font_style.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(children: [
      SizedBox(height: 220,),
   Stack(
    clipBehavior: Clip.none,
    children: [
    
    Center(child: Image.asset("lib/assets/images/food5.png")),
    Positioned(
      top: -140,
      left:250,
      child: 
  Image.asset("lib/assets/images/food4.png"),
    ),
     Positioned(
      top: -10,
      left:350,
      child: 
  Image.asset("lib/assets/images/food7.png"),
    ),
     Positioned(
       top: 110,
      left:320,
      child: 
  Image.asset("lib/assets/images/food8.png"),
    ),
     Positioned(
      top: 190,
      left:200,
      child: 
  Image.asset("lib/assets/images/food9.png"),
    ), Positioned(
      top: 190,
      left:60,
      child: 
  Image.asset("lib/assets/images/food2.png"),
    ), Positioned(
    child: 
  Image.asset("lib/assets/images/food1.png"),
    ), Positioned(
       top: -100,
      left:60,
      child: 
  Image.asset("lib/assets/images/food3.png"),
    ),
   ],),
   SizedBox(height: 130),
Text("Start Cooking", style: AppTextStyle.fontStyleOne),
 SizedBox(height: 16),
Text("Let’s join our community\n to cook better food!", style: AppTextStyle.fontStyleTwo,),
SizedBox(height: 140),
SizedBox(
  width: 327,
  height: 56,
  child: ElevatedButton(onPressed: (){
  Navigator.pushNamed(context, '/signin');
  }, 
 
  style: ElevatedButton.styleFrom(
     elevation: 0,
    backgroundColor: ColorPallete.green,
    foregroundColor: Colors.white,
  ),
  child: Text("Get Started", style: AppTextStyle.buttonText)),
)
    ],)
    

    );
  }
}