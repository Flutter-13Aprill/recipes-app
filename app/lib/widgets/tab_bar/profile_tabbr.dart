// lib/widgets/tab_bar/profile_tabbr.dart
import 'package:app/widgets/container/recipe_conainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_bloc.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_state.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //length 2 tabs
      child: Column(
        children: [
          TabBar(
            indicatorColor: const Color(0xff1FCC79), //indicator Color
            indicatorSize: TabBarIndicatorSize.tab, // make it large
            indicatorWeight: 3, //give it width
            labelColor: Colors.black, //lable colo
            labelStyle: const TextStyle(
              fontSize: 20, //sie of font
              fontWeight: FontWeight.bold, //ake it bold
            ),
            unselectedLabelColor: const Color(
              0xff9FA5C0,
            ), //define unselected Label Color
            tabs: [
              //2 tabs
              Tab(text: "Recipes"),
              Tab(text: "Liked"),
            ],
          ),
          Expanded(
            // Expands the child widget to fill available space within a Column or Row
            child: BlocBuilder<RecipeBloc, RecipeState>(
              // Listens to changes in RecipeBloc and rebuilds UI accordingly
              builder: (context, state) {
                if (state is RecipeLoadedState) {
                  // When recipes are successfully loaded

                  final allRecipes =
                      state.recipes; // Get all recipes from the loaded state

                  final likedRecipes =
                      allRecipes
                          .where((r) => r.isFavorite)
                          .toList(); // Filter recipes to only those marked as favorite (liked)

                  // Displays different tabs with scrollable views

                  return TabBarView(
                    children: [
                      _buildGrid(context, allRecipes),
                      _buildGrid(context, likedRecipes),
                    ],
                  );
                }
                      // While recipes are loading, show a loading spinner

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context, List recipes) {
    return Padding(
        // Adds padding around the grid view

      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: recipes.length,      // Number of items to display in the grid

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,      // Defines the grid layout with 2 columns and spacing between items

          crossAxisSpacing: 20.0,// Horizontal space between grid items
          mainAxisSpacing: 20.0,// Vertical space between grid items
          childAspectRatio: 0.55, // Width to height ratio of each grid item
        ),
              // Builds each individual grid item using the RecipeContainer widget
        itemBuilder: (context, index) {
          return RecipeContainer(recipe: recipes[index]);
        },
      ),
    );
  }
}
