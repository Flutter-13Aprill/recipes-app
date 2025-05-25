import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/models/recipe_data.dart';
import 'package:recipes_app/features/upload/bloc/uplaod_bloc.dart';

/// Displays a grid of recipes combining dummyRecipes and uploaded recipes.
class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UplaodBloc, UplaodState>(
          builder: (context, state) {
            if (state is SuccessListState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: dummyRecipes.length + state.recipes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    // final item = state.recipes[index];
                    if (index < dummyRecipes.length) {
                      return Center(
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    dummyRecipes[index].imageUrl,
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              dummyRecipes[index].recipeName,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              dummyRecipes[index].preparationTime,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    } else {
                      final uplaodindex = index - dummyRecipes.length;

                      return Center(
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    state.recipes[uplaodindex].path,
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              state.recipes[uplaodindex].foodName,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              "Food ${state.recipes[uplaodindex].duration}min",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              );
            }
            return const Center(child: Text('No recipes add'));
          },
        ),
      ),
    );
  }
}
