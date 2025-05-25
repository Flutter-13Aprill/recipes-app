import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/screens/profile/bloc/profile_bloc.dart';
import 'package:recipes_app/style/app_buttons.dart';
import 'package:recipes_app/style/app_colors.dart';
import 'package:recipes_app/screens/bottomnavbar/bloc/upload_bloc.dart'
    as upload;
import 'package:recipes_app/style/app_spacing.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // ProfileScreen displays user profile info with avatar, stats, and a follow button.
  // It uses Bloc to manage profile state and shows two tabs:
  // 'Recipes' (user's own) and 'Liked' (favorited recipes).
  // Recipes are displayed in a grid with image, name, description, and favorite toggle.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.share),
                      ),
                      CircleAvatar(
                        maxRadius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                      AppSpacing.h16,

                      Text(
                        "Choirul Syafril",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      AppSpacing.h16,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "32",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),

                              Text(
                                "Recipes",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Text(
                                "782",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),

                              Text(
                                "Following",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Text(
                                "1.287",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),

                              Text(
                                "Followers",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      AppSpacing.h32,

                      ElevatedButton(
                        style: AppButtons.primarySm(context),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AppSpacing.h16,
                    ],
                  ),
                ),

                Divider(thickness: 10, color: AppColors.extraLightSecondary),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: PreferredSize(
                        preferredSize: const Size.fromHeight(kToolbarHeight),
                        child: TabBarWidget(),
                      ),
                      body: BlocBuilder<upload.UploadBloc, upload.UploadState>(
                        builder: (context, uploadState) {
                          if (uploadState is upload.SuccessState) {
                            final recipes = uploadState.savedRecipes;

                            if (recipes.isEmpty) {
                              return const Center(
                                child: Text('No recipes found'),
                              );
                            }

                            return BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, tabState) {
                                int selectedIndex = 0;
                                if (tabState is SuccessState) {
                                  selectedIndex = tabState.selectedIndex;
                                }

                                final filteredRecipes =
                                    selectedIndex == 0
                                        ? recipes
                                            .where((r) => r.isMine)
                                            .toList()
                                        : recipes
                                            .where((r) => r.isFavorite)
                                            .toList();

                                if (filteredRecipes.isEmpty) {
                                  return const Center(
                                    child: Text('No recipes found'),
                                  );
                                }

                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: GridView.builder(
                                    itemCount: filteredRecipes.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 16,
                                          childAspectRatio: 0.7,
                                        ),
                                    itemBuilder: (context, index) {
                                      final recipe = filteredRecipes[index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                    child: Image.file(
                                                      File(recipe.imagePath),
                                                      fit: BoxFit.cover,
                                                      width: double.infinity,
                                                      height: 140,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 8,
                                                    right: 8,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                              upload.UploadBloc
                                                            >()
                                                            .add(
                                                              upload.ToggleFavoriteRecipeEvent(
                                                                index,
                                                              ),
                                                            );
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              6,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              AppColors
                                                                  .lightSecondary,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                        child: Icon(
                                                          recipe.isFavorite
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color:
                                                              recipe.isFavorite
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                recipe.name,
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.bodyLarge,
                                              ),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: [
                                                  Text(
                                                    recipe.desc,
                                                    style:
                                                        Theme.of(
                                                          context,
                                                        ).textTheme.bodyMedium,
                                                  ),
                                                  const SizedBox(width: 6),
                                                  const Text(
                                                    '•',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Text(
                                                    '> ${recipe.minutes.round()} mins',
                                                    style:
                                                        Theme.of(
                                                          context,
                                                        ).textTheme.bodyMedium,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is SuccessState) {
          currentIndex = state.selectedIndex;
        }

        return Container(
          color: Colors.white,
          child: TabBar(
            onTap: (index) {
              context.read<ProfileBloc>().add(TabChangedEvent(index));
            },
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: AppColors.buttonColor),
              insets: EdgeInsets.zero,
            ),
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.secondary,
            tabs: const [Tab(text: 'Recipes'), Tab(text: 'Liked')],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
