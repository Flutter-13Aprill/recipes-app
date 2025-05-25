import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/screens/bottomnavbar/bloc/upload_bloc.dart'
    as upload;
import 'package:recipes_app/screens/home/bloc/home_bloc.dart';
import 'package:recipes_app/style/app_colors.dart';
import 'package:recipes_app/style/app_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // This Flutter widget defines the main HomeScreen for a recipes app.
  // Uses Bloc pattern to manage state for home and upload features.
  // Includes a search bar, category filters, and a tabbed interface to switch views.
  // Recipes are shown in a grid with images, user info, and favorite toggling.

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    SearchBar(
                      padding: WidgetStatePropertyAll(
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      ),
                      elevation: WidgetStatePropertyAll(0),
                      hintText: 'Search',
                      hintStyle: WidgetStatePropertyAll(
                        Theme.of(context).textTheme.bodyMedium,
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.extraLightSecondary,
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Icon(
                          Icons.search,
                          color: AppColors.primary,
                          size: 30,
                        ),
                      ),
                    ),
                    AppSpacing.h16,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Category",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    AppSpacing.h16,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            child: Text(
                              "All",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.w16,
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.extraLightSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            child: Text(
                              "Food",
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.w16,
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.extraLightSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            child: Text(
                              "Drink",
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

                          return BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, tabState) {
                              final filteredRecipes = recipes;

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
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Image.asset(
                                                    'assets/images/profile.png',
                                                    width: 28,
                                                    height: 28,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Text(
                                                    recipe.username,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.blueGrey[900],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
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
                                                                : Colors.white,
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

                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
              ),
            ],
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: TabBar(
            onTap: (index) {
              context.read<HomeBloc>().add(TabChangedEvent(index));
            },
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: AppColors.buttonColor),
              insets: EdgeInsets.zero,
            ),
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.secondary,
            tabs: const [Tab(text: 'Left'), Tab(text: 'Right')],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
