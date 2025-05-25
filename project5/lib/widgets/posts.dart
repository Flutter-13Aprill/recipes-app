import 'package:flutter/material.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/extensions/theme_text.dart';

class Posts extends StatelessWidget {
  const Posts({
    super.key,
    required this.setProfile,
    required this.setName,
    required this.setFoodImage,
    required this.onPressed,
     this.setFoodName, this.setFoodNameController, this.isLiked,
     
    
  });

  final bool? isLiked;
  final String setProfile;
  final String setName;
  final String setFoodImage;
  final String? setFoodName;
  final TextEditingController? setFoodNameController;
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
                child: Image.asset(setProfile, fit: BoxFit.contain),
              ),
              Text(setName, style: context.titleL()!.copyWith(fontSize: 12)),
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

                  child: Image.asset(setFoodImage, fit: BoxFit.fill),
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
                        icon: Icon(Icons.favorite_border, color: isLiked!? Colors.redAccent:Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Text(
            textAlign: TextAlign.left,
            setFoodName!,
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

              Text('>', style: context.bodyS()),
              Text(
                textAlign: TextAlign.left,
                '60 mins',
                style: context.bodyS(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
