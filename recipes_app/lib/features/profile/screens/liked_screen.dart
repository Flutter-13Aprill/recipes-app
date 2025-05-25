import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/bloc/liked_bloc.dart';

/// Screen that displays the list of liked recipes.
class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedBloc, LikedState>(
      builder: (context, state) {
        if (state is LikeLoaded && state.recipes.isNotEmpty) {
          return ListView.builder(
            itemCount: state.recipes.length,
            itemBuilder: (context, index) {
              final recipe = state.recipes[index];
              return ListTile(
                leading: Image.asset(recipe.imageUrl),
                title: Text(recipe.recipeName),
                subtitle: Text(recipe.preparationTime),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<LikedBloc>().add(UnlikeRecipeEvent(recipe));
                  },
                ),
              );
            },
          );
        } else {
          return Center(child: Text("No liked recipes yet."));
        }
      },
    );
  }
}
