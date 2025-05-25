import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/screens/add_recipe.dart';
import 'package:recipes/screens/profile.dart';
import 'package:recipes/screens/recipeListScreen.dart';
import '../bloc/add_recipe_bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    RecipeListScreen(),
    AddRecipeScreen(),
    Text("nothing"),
    Text("nothing"),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: Colors.green,
        color: Colors.grey,
        style: TabStyle.reactCircle,
        initialActiveIndex: currentIndex,

        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          TabItem(icon: Icon(Icons.home), title: 'Home'),
          TabItem(icon: Icon(Icons.edit), title: 'Upload'),
          TabItem(icon: Icon(Icons.qr_code_rounded), title: 'Scan'),
          TabItem(icon: Icon(Icons.notifications), title: 'Notification'),
          TabItem(icon: Icon(Icons.person_rounded), title: 'Profile'),
        ],
      ),
    );
  }
}
