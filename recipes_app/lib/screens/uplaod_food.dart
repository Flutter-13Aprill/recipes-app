import 'package:flutter/material.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/style/app_color.dart';
import 'package:recipes_app/widgets/custom_img_field.dart';
import 'package:recipes_app/widgets/food_field_widget.dart';
import 'package:recipes_app/widgets/uplaod_dialog.dart';

class UplaodFood extends StatelessWidget {
  const UplaodFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.displayMedium!
                          .copyWith(color: AppColors.secondary),
                    ),
                  ),
                  Text(
                    '1/2',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.mainText,
                    ),
                  ),
                ],
              ),
              CustomImgField(),
              SizedBox(height: 8),
              Text(
                'Food Name',
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(color: AppColors.mainText),
              ),
              FoodFieldWidget(
                width: 1,
                lable: 'Enter food name',
                color: Colors.transparent,
              ),
              SizedBox(height: 8),
              Text(
                'Description',
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(color: AppColors.mainText),
              ),
              FoodFieldWidget(
                width: 1,
                lable: 'Tell a little about your food',
                color: Colors.transparent,
                height: 100,
                raduis: 10,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Coocking Duration',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.mainText,
                    ),
                  ),
                  Text(
                    ' (in minutes)',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '>10',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    '30',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    '>60',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              Slider(
                min: 0,
                max: 2,
                value: 1,
                onChanged: (double value) {},
                activeColor: AppColors.primary,
                inactiveColor: AppColors.form,
              ),
              SizedBox(height: 16),
              UplaodDialog(),
            ],
          ),
        ),
      ),
    );
  }
}
