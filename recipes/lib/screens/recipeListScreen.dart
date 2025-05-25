import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/bloc/add_recipe_bloc.dart';
import 'package:recipes/theems/color.dart';
import 'package:recipes/widget/category.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRecipeBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AddRecipeBloc>();
          return Scaffold(
            body: DefaultTabController(
              length: 2,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    // Search Bar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SearchBar(
                        leading: Icon(Icons.search),
                        hintText: "Search",
                        elevation: WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStatePropertyAll(
                          myAppColor.graycolor,
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: (value) {
                          bloc.add(UpdateSearchQuery(value));
                        },
                      ),
                    ),

                    // Category Title
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Category"),
                      ),
                    ),

                    // Category Buttons
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          //widgets
                          Category(title: "All"),
                          const SizedBox(width: 12),
                          Category(title: "Food"),
                          const SizedBox(width: 12),
                          Category(title: "Drink"),
                        ],
                      ),
                    ),

                    // Tabs
                    const TabBar(
                      indicatorColor: Colors.green,
                      labelColor: Colors.indigo,
                      unselectedLabelColor: Colors.grey,
                      tabs: [Tab(text: "Left"), Tab(text: "Right")],
                    ),

                    // Tab View
                    Expanded(
                      child: TabBarView(
                        children: [
                          BlocBuilder<AddRecipeBloc, AddRecipeState>(
                            builder: (context, state) {
                              final recipes = state.filteredRecipes;

                              return GridView.builder(
                                itemCount: recipes.length,
                                padding: EdgeInsets.all(12),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 3 / 4,
                                    ),
                                itemBuilder: (context, index) {
                                  final recipe = recipes[index];
                                  return Card(
                                    elevation: 0,
                                    color: myAppColor.whitecolor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Image.asset(recipe.imageavtar),
                                            SizedBox(width: 12),
                                            Text(recipe.personname),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child:
                                                  recipe.image is String
                                                      ? Image.asset(
                                                        recipe.image,
                                                        height: 100,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      )
                                                      : Image.file(
                                                        recipe.image,
                                                        height: 100,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                            ),

                                            IconButton(
                                              icon: Icon(
                                                recipe.isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color:
                                                    recipe.isFavorite
                                                        ? Colors.red
                                                        : Colors.grey,
                                              ),
                                              onPressed: () {
                                                bloc.add(
                                                  ToggleFavoritePressed(index),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            recipe.title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          recipe.description +
                                              " • >${recipe.duration} mins",
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),

                          const Center(child: Text("Right tab")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
