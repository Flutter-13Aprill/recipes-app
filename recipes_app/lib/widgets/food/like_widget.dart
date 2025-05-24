import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/models/food_model.dart';
import 'package:recipes_app/views/layout/bloc/layout_bloc.dart';

class LikeWidget extends StatelessWidget {
   const LikeWidget({super.key, required this.food ,required this.index});
  final FoodModel food;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
         context.read<LayoutBloc>().add(ChangeFavorite(indexFood:index));
        },
        splashColor: AppColors.border,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:food.isFavorite?AppColors.accent : Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.favorite_border, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
