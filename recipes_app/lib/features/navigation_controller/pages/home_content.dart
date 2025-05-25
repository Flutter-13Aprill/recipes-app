import 'package:flutter/material.dart';
import 'package:recipes_app/core/conestant.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:recipes_app/features/navigation_controller/pages/category.dart';
import 'package:recipes_app/features/navigation_controller/pages/grid_image.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),

     
            Text("Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),

           
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Category(label:"All"),
                SizedBox(width: 8),
                Category(label:"Food"),
                SizedBox(width: 8),
                Category(label:"Drink"),
              ],
            ),
            SizedBox(height: 16),

            
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppPalette.green,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppPalette.green,
                    tabs: [
                      Tab(text: "Left"),
                      Tab(text: "Right"),
                    ],
                  ),
                  SizedBox(
                    height: 400, 
                    child: TabBarView(
                      children: [
                        GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.75,
      children: [
        GridImage(
          user: "Calum Lewis",
          title: "Pancake",
          time: "> 60 mins",
          imagePath: "${iP}image1.png",
           avatar: '${iP}avatar4.png',
        ),
        GridImage(
          user: "Eilif Sonas",
          title: "Salad",
          time: "> 60 mins",
          imagePath: "${iP}image4.png",
           avatar: '${iP}avatar1.png', 
        ), GridImage(
          user: "Elena Shelby",
          title: "Orangecake",
          time: "> 60 mins",
          imagePath: "${iP}image3.png", 
          avatar: '${iP}avatar2.png',
        ),
        GridImage(
          user: "John Priyadi",
          title: "Fruts",
          time: "> 60 mins",
          imagePath: "${iP}image2.png", 
          avatar: '${iP}avatar3.png',
        ),
      ],
    ),
    GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.75,
      children: [
         GridImage(
          user: "Calum Lewis",
          title: "Pancake",
          time: "> 60 mins",
          imagePath: "${iP}image1.png",
           avatar: '${iP}avatar4.png',
        ),
        GridImage(
          user: "Eilif Sonas",
          title: "Salad",
          time: "> 60 mins",
          imagePath: "${iP}image4.png",
           avatar: '${iP}avatar1.png', 
        ),
        GridImage(
          user: "Elena Shelby",
          title: "Orangecake",
          time: "> 60 mins",
          imagePath: "${iP}image3.png", 
          avatar: '${iP}avatar2.png',
        ),
        GridImage(
          user: "John Priyadi",
          title: "Fruts",
          time: "> 60 mins",
          imagePath: "${iP}image2.png", 
          avatar: '${iP}avatar3.png',
        ),
      ],
    )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  

   
  }