import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/bloc/liked_bloc.dart';
import 'package:recipes_app/features/home/models/recipe_data.dart';
import 'package:recipes_app/features/home/widget/search_bar_widget.dart';

/// HomeScreen
///
/// Displays a grid of recipes with chef info and images.
/// Integrates with [LikedBloc] to allow liking/unliking recipes.
/// Uses [SearchBarWidget] in the AppBar for searching functionality.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 180),
            child: SearchBarWidget(),
          ),
        ),
        body: Center(
          child: BlocBuilder<LikedBloc, LikedState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: dummyRecipes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final item = dummyRecipes[index];
                    final bloc = context.read<LikedBloc>();
                    return Center(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    item.chefAvatarUrl,
                                  ),
                                  radius: 20,
                                ),
                                Text(
                                  item.chefName,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset(
                                  item.imageUrl,
                                  width: 160,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color:
                                          state is LikeLoaded &&
                                                  state.recipes.contains(item)
                                              ? Colors.red
                                              : Colors.grey,
                                    ),
                                    onPressed: () {
                                      if (state is LikeLoaded &&
                                          state.recipes.contains(item)) {
                                        bloc.add(UnlikeRecipeEvent(item));
                                      } else {
                                        bloc.add(LikeRecipeEvent(item));
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            item.recipeName,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            item.preparationTime,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
