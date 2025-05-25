import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';

class FoodFieldWidget extends StatelessWidget {
  const FoodFieldWidget({
    super.key,
    required this.width,
    this.img,
    required this.lable,
    this.icon,
    this.color,
    this.raduis,
    this.height,
  });
  final double width;
  final Image? img;
  final String lable;
  final Icon? icon;
  final Color? color;
  final double? raduis;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * width,
      height: 60,
      child: TextField(
        // maxLines: 4, // or just omit this
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: height ?? 60,),
          filled: true,
          fillColor: color,
          prefixIcon: img,
          suffixIcon: icon,
          hintText: lable,
          hintStyle: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(color: AppColors.secondaryText),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(raduis ?? 30.0),
            borderSide: BorderSide(color: AppColors.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(raduis ?? 30.0),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          // contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
