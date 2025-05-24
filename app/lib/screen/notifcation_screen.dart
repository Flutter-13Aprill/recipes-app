 
import 'dart:io';  
 import 'package:app/screen/home_tab_bar/bloc/recipe_events_bloc.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_event.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotifcationScreen extends StatelessWidget {
  const NotifcationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("وصفاتك"),  
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeLoadedState) {
            if (state.recipes.isEmpty) {
              return const Center(child: Text("لا توجد وصفات حتى الآن. ابدأ بالرفع!"));
            }
             return GridView.builder(
              padding: const EdgeInsets.all(8.0),  
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                crossAxisSpacing: 10.0, 
                mainAxisSpacing: 10.0,  
                childAspectRatio: 0.75,  
              ),
              itemCount: state.recipes.length,
              itemBuilder: (context, index) {
                final recipe = state.recipes[index];
                return Card(
                  elevation: 2.0,  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),  
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Expanded( 
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                          child: recipe.recipeImage.isNotEmpty
                              ? Image.file(
                                  File(recipe.recipeImage),  
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                     return Image.asset(
                                      recipe.recipeImage,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Center(child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey)),
                                    );
                                  },
                                )
                              : const Center(child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,  
                              overflow: TextOverflow.ellipsis,  
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "بواسطة: ${recipe.name}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Align(
                              alignment: Alignment.bottomRight, 
                              child: IconButton(
                                icon: Icon(
                                  recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: recipe.isFavorite ? Colors.red : Colors.grey,
                                  size: 20,  
                                ),
                                onPressed: () {
                                  context.read<RecipeBloc>().add(ToggleFavoriteEvent(recipe.id));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
           } else if (state is RecipeErrorState) {
            return Center(child: Text('خطأ: ${state.message}'));
          }
          return const Center(child: Text('مرحباً بك!'));
        },
      ),
    );
  }
}