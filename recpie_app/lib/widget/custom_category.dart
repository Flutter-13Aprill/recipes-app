import 'package:flutter/material.dart';
import 'package:recpie_app/theme/colors_app.dart';

class CustomCategoryContainer extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;
  final bool isSelected;
  final FontWeight fontWeight;
  final VoidCallback? onTap;

  const CustomCategoryContainer({
    Key? key,
    required this.text,
    this.backgroundColor = const Color(0xFFF4F4F4),
    this.textColor = Colors.black,
    this.borderRadius = 32,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.onTap,
    required this.isSelected,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isSelected ? ColorsApp.primary : ColorsApp.fillColor;
    final textColor = isSelected ? ColorsApp.white : ColorsApp.secondryText;
    final fontWeight = isSelected ? FontWeight.bold : FontWeight.normal;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
