import 'package:flutter/material.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/extensions/theme_text.dart';
import 'package:project5/models/recpies_model.dart';

class Posts2 extends StatelessWidget {
  const Posts2({
    super.key,
  
    required this.onPressed, required this.models,
    
  });

  final RecpiesModel models;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() * 0.35,
      height: context.getHeight() * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              Container(
                width: 31,
                height: 31,
                child: Image.asset(models.setProfilePicture, fit: BoxFit.contain),
              ),
              Text(models.setName, style: context.titleL()!.copyWith(fontSize: 12)),
            ],
          ),

          Container(
            width: context.getWidth() * 0.35,
            height: context.getHeight() * 0.157,
            child: Stack(
              children: [
                Container(clipBehavior: Clip.hardEdge,
                  width: context.getWidth() * 0.35,
                  height: context.getHeight() * 0.157,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Image.asset(models.setFoodImage, fit: BoxFit.fill),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    width: 50,
                    height: 50,
                    child: Container(
                      alignment: Alignment.center,
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(51, 255, 255, 255),
                      ),
                      //bloc needed
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onPressed,
                        icon: Icon(models.isLike? Icons.favorite:Icons.favorite_border,color:models.isLike? Colors.redAccent:Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Text(
            textAlign: TextAlign.left,
            models.setFoodName,
            style: context.titleL()!.copyWith(fontSize: 17),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Text('Food', style: context.bodyS()),
              SizedBox(width: 10),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 159, 165, 192),
                ),
              ),
              SizedBox(width: 10),

              Text(
                textAlign: TextAlign.left,
                models.setTimer,
                style: context.bodyS(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
