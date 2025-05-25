import 'package:flutter/material.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/style/app_color.dart';
import 'package:recipes_app/widgets/bottom_widget.dart';

class UplaodDialog extends StatelessWidget {
  const UplaodDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 16,
              children: [
                Image.asset('assets/party.png', width: 170,),
                Text('Upload Success', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.mainText),),
                Text('Your recipe has been uploaded,   you can see it on your profile', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.mainText,), textAlign: TextAlign.center,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),);
                  },
                  child: BottomWidget(lable: 'Back to Home', width: 0.9,))
                
              ],
            ),
          ),
        )
      ],
    );});  
      },
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'lable',
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}