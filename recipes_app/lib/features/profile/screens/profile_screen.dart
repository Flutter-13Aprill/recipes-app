import 'package:flutter/material.dart';
import 'package:recipes_app/features/profile/screens/liked_screen.dart';
import 'package:recipes_app/features/profile/screens/recipes_screen.dart';
import 'package:recipes_app/features/profile/widget/bottom_bar_widget.dart';
import 'package:recipes_app/style/style_color.dart';

/// Profile screen with two tabs: Recipes and Liked.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.share, color: StyleColor.mainText),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 300),
            child: BottomBarWidget(),
          ),
        ),
        body: TabBarView(children: [RecipesScreen(), LikedScreen()]),
      ),
    );
  }
}
