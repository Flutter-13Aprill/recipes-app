import 'package:app/screen/home_tab_bar/bloc/recipe_events_bloc.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_state.dart';
import 'package:app/widgets/container/recipe_conainer.dart'; // تأكد من وجود هذا الويدجت
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/models/recipe.dart'; // تأكد من استيراد Recipe هنا

class TabBarHome extends StatelessWidget {
  const TabBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs

      child: Column(
        children: [
          const TabBar(
            // Tab bar at the top with two tabs: All Recipes and Favorites
            indicatorColor: Color(0xff1FCC79),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            unselectedLabelColor: Color(0xff9FA5C0),
            tabs: [
              Tab(text: "Left"), // Tabs
              Tab(text: "Rigth"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                BlocSelector<RecipeBloc, RecipeState, List<Recipe>>(
                  selector: (state) {
                    if (state is RecipeLoadedState) {
                      return state
                          .recipes; // Select the list of all recipes if loaded, otherwise return empty list
                    }
                    return [];
                  },
                  builder: (context, recipes) {
                    // Show loading spinner if recipes are loading
                    if (context.read<RecipeBloc>().state
                        is RecipeLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (recipes.isEmpty) {//if list empty 
                      return const Center(child: Text("There are no recipes to display."));
                    }
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        //dislay recipes 
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,// make 2recipes in a row 
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                              childAspectRatio: 0.55,
                            ),
                        itemCount: recipes.length,//nmber of items on  recipes
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return RecipeContainer(
                            key: ValueKey(
                              recipe.id,
                            ), 
                            recipe: recipe,
                          );
                        },
                      ),
                    );
                  },
                ),
                     //righ 
                 BlocSelector<RecipeBloc, RecipeState, List<Recipe>>(
                  selector: (state) {
                    if (state is RecipeLoadedState) {
                      return state.recipes
                          .where((r) => r.isFavorite)
                          .toList();  //liked Recipe while be displayes 
                    }
                    return [];
                  },
                  builder: (context, likedRecipes) {
                     if (context.read<RecipeBloc>().state
                        is RecipeLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (likedRecipes.isEmpty) {
                      return const Center(
                        child: Text("ىخ بشرخعقفقهؤحثس "),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                              childAspectRatio: 0.55,
                            ),
                        itemCount: likedRecipes.length,
                        itemBuilder: (context, index) {
                          final recipe = likedRecipes[index];
                          return RecipeContainer(
                            key: ValueKey(
                              recipe.id,
                            ),  
                            recipe: recipe,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
