import 'package:flutter/material.dart';

// A custom widget to display a number with a label below it
// Used in the profile screen for showing stats like Followers, Recipes, etc.
class ProfileColumn extends StatelessWidget {
  const ProfileColumn({super.key, required this.number, required this.title});
  final String
  title; // The label shown below the number (e.g., "Followers", "Recipes")

  final double number; // The number shown at the top

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          // Display the number (e.g., 1.2K, 500)
          number.toString(),
          style: TextStyle(
            color: Color(0xff3E5481),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          // Display the label (e.g., "Followers")
          title,
          style: TextStyle(color: Color(0xff9FA5C0), fontSize: 20),
        ),
      ],
    );
  }
}
