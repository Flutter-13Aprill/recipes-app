import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';
import 'package:recipes_app/widgets/custom_card_widget.dart';

class TabOne extends StatelessWidget {
  const TabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCardWidget(
                iconImg: 'assets/Rectangle1.png',
                name: 'Calum Lewis',
                img: 'assets/item1.png',
                time: '60',
                title: 'Pancake',
                icon: Icon(Icons.favorite_border, color: AppColors.white),
              ),
              CustomCardWidget(
                iconImg: 'assets/rectangle2.png',
                name: 'Eilif Sonas',
                img: 'assets/item2.png',
                time: '60',
                title: 'Salad',
                icon: Icon(Icons.favorite_border, color: AppColors.white),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCardWidget(
                iconImg: 'assets/Rectangle1.png',
                name: 'Calum Lewis',
                img: 'assets/item1.png',
                time: '60',
                title: 'Pancake',
                icon: Icon(Icons.favorite_border, color: AppColors.white),
              ),
              CustomCardWidget(
                iconImg: 'assets/rectangle2.png',
                name: 'Eilif Sonas',
                img: 'assets/item2.png',
                time: '60',
                title: 'Salad',
                icon: Icon(Icons.favorite_border, color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
