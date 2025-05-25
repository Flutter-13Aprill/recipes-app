import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/bloc/add_recipe_bloc.dart';
import 'package:recipes/widget/button_two.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.share),
                      ),
                    ),
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/profilepic.png"),
                    ),
                    SizedBox(height: 20),
                    Text("Choirul Syafril"),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("32"),
                            SizedBox(height: 12),
                            Text("Recipes"),
                          ],
                        ),
                        SizedBox(width: 12),
                        Column(
                          children: [
                            Text("782"),
                            SizedBox(height: 12),
                            Text("Following"),
                          ],
                        ),
                        SizedBox(width: 12),
                        Column(
                          children: [
                            Text("1.287"),
                            SizedBox(height: 12),
                            Text("Followers"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ButtonTwo(text: "Follow", onPressed: () {}),
                    const TabBar(
                      indicatorColor: Colors.green,
                      labelColor: Colors.indigo,
                      unselectedLabelColor: Colors.grey,
                      tabs: [Tab(text: "Recipes"), Tab(text: "Liked")],
                    ),

                    Expanded(
                      child: TabBarView(
                        children: [
                          BlocBuilder<AddRecipeBloc, AddRecipeState>(
                            builder: (context, state) {
                              final recipes = state.recipes;
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
                                    color: Colors.white,
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
                                                  const BorderRadius.vertical(
                                                    top: Radius.circular(12),
                                                  ),
                                              child:
                                                  recipe.image is String
                                                      ? Image.asset(
                                                        recipe.image,
                                                        height: 100,
                                                        width: double.infinity,
                                                        fit: BoxFit.fitWidth,
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

                          BlocBuilder<AddRecipeBloc, AddRecipeState>(
                            builder: (context, state) {
                              final likedRecipes =
                                  state.recipes
                                      .where((r) => r.isFavorite)
                                      .toList();

                              return GridView.builder(
                                itemCount: likedRecipes.length,
                                padding: const EdgeInsets.all(12),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 3 / 4,
                                    ),
                                itemBuilder: (context, index) {
                                  final recipe = likedRecipes[index];
                                  return Card(
                                    elevation: 0,
                                    color: Colors.white,
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
                                                  const BorderRadius.vertical(
                                                    top: Radius.circular(12),
                                                  ),
                                              child:
                                                  recipe.image is String
                                                      ? Image.asset(
                                                        recipe.image,
                                                        height: 100,
                                                        width: double.infinity,
                                                        fit: BoxFit.fitWidth,
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
