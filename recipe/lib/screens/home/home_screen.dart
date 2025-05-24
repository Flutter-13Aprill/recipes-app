// START: screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/screens/home/bloc/home_bloc.dart';
import 'package:recipe/screens/home/bloc/home_event.dart';
import 'package:recipe/screens/home/bloc/home_state.dart';
import 'package:recipe/screens/like/bloc/liked_bloc.dart';
import 'package:recipe/screens/like/bloc/liked_event.dart';
import 'package:recipe/screens/like/bloc/liked_state.dart';
import 'package:recipe/cusom_widget/recipe_ticket.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..add(LoadRecipes())),
        BlocProvider(create: (_) => LikedBloc()),
      ],
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    final likedBloc = context.read<LikedBloc>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFFF6F6F6),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E2B4D),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: ["All", "Food", "Drink"].map((cat) {
                  final selected =
                      context.watch<HomeBloc>().state.selectedCategory == cat;
                  return GestureDetector(
                    onTap: () => homeBloc.add(ChangeCategory(cat)),
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF21CE77)
                            : const Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["Left", "Right"].map((tab) {
                  final isSelected =
                      context.watch<HomeBloc>().state.selectedTab == tab;
                  return GestureDetector(
                    onTap: () => homeBloc.add(ChangeTab(tab)),
                    child: Column(
                      children: [
                        Text(
                          tab,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: isSelected
                                ? const Color(0xFF1E2B4D)
                                : Colors.grey,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 140,
                            color: const Color(0xFF21CE77),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return BlocBuilder<LikedBloc, LikedState>(
                      builder: (context, likedState) {
                        final recipes = state.recipes.take(4).toList();
                        return GridView.builder(
                          itemCount: recipes.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.68,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 8,
                              ),
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
                            final isLiked = likedState.likedRecipes.contains(
                              recipe,
                            );
                            return RecipeTicket(
                              recipe: recipe,
                              isLiked: isLiked,
                              onLikeToggle: () =>
                                  likedBloc.add(ToggleLikeRecipe(recipe)),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
