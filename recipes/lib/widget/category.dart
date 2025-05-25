import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/theems/color.dart';
import '../bloc/add_recipe_bloc.dart';

class Category extends StatelessWidget {
  final String title;

  const Category({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRecipeBloc, AddRecipeState>(
      builder: (context, state) {
        final isSelected = state.selectedCategory == title;
        final bloc = context.read<AddRecipeBloc>();
        return GestureDetector(
          onTap: () {
            bloc.add(ChangeCategory(title));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? myAppColor.greencolor : myAppColor.graycolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: TextStyle(color: isSelected ? myAppColor.whitecolor: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
