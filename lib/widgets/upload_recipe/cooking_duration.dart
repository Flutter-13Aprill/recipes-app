import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re/app_theming/app_colors.dart';
import 'package:re/screens/upload_recipe/bloc/recipe_bloc.dart';

class CookingDuration extends StatelessWidget {
  const CookingDuration({super.key, required this.recipeBloc});

  final RecipeBloc recipeBloc;

  @override
  Widget build(BuildContext context) {

    print(recipeBloc.sliderValue);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<RecipeBloc, RecipeState>(
            builder: (context, state) {
              final sliderValue = recipeBloc.sliderValue;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '<10',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color:
                          sliderValue == 10
                              ? AppColors.buttonColor
                              : AppColors.unselectedBottomTabColor,
                    ),
                  ),
                  Text(
                    '30',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color:
                          sliderValue - 5 == 30.0
                              ? AppColors.buttonColor
                              : AppColors.unselectedBottomTabColor,
                    ),
                  ),
                  Text(
                    '60<',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color:
                          sliderValue == 60
                              ? AppColors.buttonColor
                              : AppColors.unselectedBottomTabColor,
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            return Slider(
              min: 10,
              max: 60,
              activeColor: AppColors.buttonColor,
              value: recipeBloc.sliderValue ,
              divisions: 2,
              onChanged: (value) {
                recipeBloc.add(SliderChangeEvent(sliderValue: value));
              },
            );
          },
        ),
      ],
    );
  }
}
