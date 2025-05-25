import 'dart:ui';
import 'package:flutter/material.dart';

class FoodCardWidget extends StatelessWidget {
  final String image;
  final String avatar;
  final String user;
  final String title;
  final bool isSelected;

  const FoodCardWidget({
    super.key,
    required this.image,
    required this.avatar,
    required this.user,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with avatar and username
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.asset(
                    avatar,
                    width: 31,
                    height: 31,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 80,
                  height: 15,
                  child: Text(
                    user,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E3E5C),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Food image and favorite icon
          ClipRRect(
            borderRadius: const BorderRadius.all( Radius.circular(12)),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  image,
                  width: double.infinity,
                  height: 151,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xFF3E5481),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Food • >60 mins",
                  style: TextStyle(color: Color(0xFF9FA5C0), fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
