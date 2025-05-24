import 'package:flutter/material.dart';
import 'package:recipes_app/extensions/screen_size.dart';
import 'package:recipes_app/models/food_model.dart';
import 'package:recipes_app/models/user_model.dart';
import 'package:recipes_app/style/my_style.dart';
import 'package:recipes_app/widgets/food/like_widget.dart';

class DisplayFood extends StatelessWidget {
  DisplayFood({super.key, required this.foods});
  List<FoodModel> foods;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: context.getHight(pre: 0.6),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
          mainAxisExtent: 280,
        ),
        scrollDirection: Axis.vertical,
        itemCount: foods.length,
        itemBuilder: (context, index) {
          FoodModel food = foods[index];
          UserModel user = food.creator;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //user info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: user.avatar,
                  ),
                  Text(
                    user.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              StyleApp.sizeH16,

              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(width: 150, food.image),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, right: 42),
                        child: LikeWidget(food: food, index: index),
                      ),
                    ),
                  ],
                ),
              ),
              StyleApp.sizeH16,

              Text(
                food.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              StyleApp.sizeH8,

              Text(
                "Food ● > ${food.duration}  mints",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }
}
