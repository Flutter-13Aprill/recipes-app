import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_colors.dart';

class BottomNavItemWidget extends StatelessWidget {
  final IconData icon;
  final int index;
  final String label;
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavItemWidget({
    super.key,
    required this.icon,
    required this.index,
    required this.label,
    required this.selectedIndex,
    required this.onTap,
  });
  // A custom widget for a single item in the bottom navigation bar.
  // It displays an icon and a label, and highlights itself when selected.
  // Tapping the item triggers the provided callback with the item's index.
  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? AppColors.buttonColor : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.buttonColor : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
