import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';
import 'package:re/models/post_model.dart';
import 'package:re/utilities/screens/screen_sizes.dart';


class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post, this.onPressed});

  final PostModel post;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        width: context.getWidth(multiplied: 0.34),
        height: context.getHeight(multiplied: 0.32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
      
            Row(
              spacing: 8,
              children: [
                Image.asset(post.authorImage),
                Text(post.authorName, style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.mainTextColor, fontSize: 14),)
              ],
            ),
      
            Stack(
              children: [
                Image.asset(post.recipeImage, fit: BoxFit.cover,),
                
                Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    onTap: onPressed,
                    child: (post.isLikePost ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border)).frosted(
                      blur: 8,
                      borderRadius: BorderRadius.circular(8),
                      padding: EdgeInsets.all(8),
                      frostColor: AppColors.blurColor
                    ),
                  ),
                )
              ],
            ),
      
            SizedBox(height: context.getHeight(multiplied: 0.016)),
      
            Text(post.recipeName, style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.mainTextColor)),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(post.recipeCategory, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14),),
      
                Container(
                  width: 10,
                  height: 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryTextColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
      
                Text(post.recipeDuration, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}