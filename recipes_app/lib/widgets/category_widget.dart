import 'package:flutter/material.dart';
class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.lable, required this.bgColor, required this.txtColor});
  final String lable;
  final Color bgColor;
  final Color txtColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: 70,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Text(
            lable,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(color: txtColor),
          ),
        ),
      ),
    );
  }
}
