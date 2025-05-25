import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recpie_app/theme/colors_app.dart';
import 'package:recpie_app/widget/custom_text.dart';
import 'package:recpie_app/widget/main_text.dart';
import 'package:recpie_app/widget/secondary_text.dart';

class CustomCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String mainImage;
  final String title;
  final String subtitle;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const CustomCard({
    super.key,
    required this.userName,
    required this.userImage,
    required this.mainImage,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  userImage,
                  width: 33,
                  height: 33,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              CustomText(fontSize: 15, text: userName),
            ],
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  mainImage,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: onFavoritePressed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(76, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: ColorsApp.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          MainText(text: title),
          SizedBox(height: 8),
          SecondaryText(text: subtitle, fontSize: 12),
        ],
      ),
    );
  }
}
