import 'package:flutter/material.dart';
import 'package:recipes_app/core/conestant.dart';
import 'package:recipes_app/core/text/liked_post.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:recipes_app/features/navigation_controller/pages/grid_image.dart';
import 'package:recipes_app/features/navigation_controller/pages/groub_text.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 24), 
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      "${iP}avatar5.png"),                ),
                Icon(Icons.share_outlined, color: Colors.grey[700]),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Choirul Syafril",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 16),

         
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GroubText( number:  32,label:  "Recipes"),
                GroubText(number: 782,label: "Following"),
                GroubText( number: 1.287,label: "Followers"),
              ],
            ),
            SizedBox(height: 16),

      
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: AppPalette.green,
                    labelColor: AppPalette.green,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Recipes"),
                      Tab(text: "Liked"),
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
      
      children:[]
      
    ),
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

