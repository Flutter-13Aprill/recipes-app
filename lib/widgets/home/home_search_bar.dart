import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:re/app_theming/app_colors.dart';


class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key, required this.controller});

  final TextEditingController controller; 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: controller,
        cursorColor: AppColors.borderColorFocusInput,
        cursorHeight: 12,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.searchBarColor,
          hintText: 'Search',
          prefixIcon: SvgPicture.asset('assets/home/Vector.svg',fit: BoxFit.scaleDown,) ,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.searchBarColor, width: 0),
            borderRadius: BorderRadius.circular(32),
          ),
      
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColorFocusInput, width: 2),
            borderRadius: BorderRadius.circular(32),
          )
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}