import 'package:flutter/material.dart';
import 'package:recipes_app_bloc/models/recipe_model.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';
import 'package:recipes_app_bloc/style/font_style.dart';
import 'package:recipes_app_bloc/widgets/content_card.dart';

Widget buildTabBar(){
  return DefaultTabController(
    length: 2, 
    child: Column(children: [
 TabBar(
   labelStyle: AppTextStyle.fontStyleThirteen,
   unselectedLabelStyle: AppTextStyle.fontStyleTwelve,
     overlayColor: MaterialStateProperty.all(Colors.transparent), 
   indicator: UnderlineTabIndicator(
    borderSide: 
    BorderSide(width: 4,color: ColorPallete.green),
    insets: EdgeInsets.symmetric(horizontal: -100),
   ),
  tabs: [
                Tab(text: 'Left'),
            Tab(text: 'Right'),

  ]
  ),
 Expanded(
   child: TabBarView(
    children: [
      SingleChildScrollView(
        padding: const EdgeInsets.only(top: 26, left:32),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            recipesCardWidget(
  recipe: RecipeModel(
    profileImage: 'lib/assets/images/friend3.png',
    name: 'Calum Lewis',
    imagePath: 'lib/assets/images/pancake_square.png',
    title: 'Pancake',
    description: 'Food • >60 mins',
    isLiked: false,
  ),
),

      recipesCardWidget(
recipe: RecipeModel(

    profileImage: 'lib/assets/images/friend3.png',
    name: 'Calum Lewis',
    imagePath: 'lib/assets/images/pancake_square.png',
    title: 'Pancake',
    description: 'Food • >60 mins',
    isLiked: false,
  ),
),

recipesCardWidget(
  recipe: RecipeModel(
    profileImage: 'lib/assets/images/friens4.png',
    name: 'Elena Shelby',
    imagePath: 'lib/assets/images/food4_s.png',
    title: 'Pancake',
    description: 'Food • >60 mins',
    isLiked: false,
  ),
),

      recipesCardWidget(
  recipe: RecipeModel(
    profileImage: 'lib/assets/images/friend2.png',
    name: 'John Priyadi',
    imagePath: 'lib/assets/images/food_s.png',
    title: 'Salad',
    description: 'Food • 45 mins',
    isLiked: false,
  ),
),

          ],
        ),
      ),
      Center(
      child: Text(
        'No content yet',
        style: AppTextStyle.fontStyleThirteen,
      ),
    ),
    ],
   ),
 )
    
    ]),
  );
    
}