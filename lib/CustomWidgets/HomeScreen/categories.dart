import 'package:blocrecipes/Helper/screen_extension.dart';
import 'package:blocrecipes/Screens/home/bloc/home_bloc.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        var bloc = context.read<HomeBloc>();
        final categories = bloc.categories;
        return SizedBox(
          width: context.screenWidth,
          height: context.screenHeight * 0.045,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final bool isSelected = index == bloc.selectedCategoryIndex;
              return Padding(
                padding: EdgeInsets.only(left: context.screenWidth * 0.04),
                child: GestureDetector(
                  onTap: () {
                    bloc.selectedCategoryIndex = index;
                    bloc.add(SelectCategory(index));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor : background,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : secondaryText,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
