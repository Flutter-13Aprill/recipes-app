import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipes_app/Models/Food_Model.dart';
import 'package:flutter_recipes_app/Screen/bloc/FoodLike/bloc/food_like_bloc.dart';
import 'package:flutter_recipes_app/Screen/bloc/FoodLike/bloc/food_like_event.dart';
import 'package:flutter_recipes_app/Screen/bloc/FoodLike/bloc/food_like_state.dart';
import 'package:flutter_recipes_app/Widget/Food_Card_NoUser_Widget.dart';
class ProfileScreen extends StatelessWidget {
  final String profileImage;
  final String name;
  final int recipes;
  final int following;
  final int followers;
  final List<FoodItem> foodItems;

  const ProfileScreen({
    super.key,
    required this.profileImage,
    required this.name,
    required this.recipes,
    required this.following,
    required this.followers,
    required this.foodItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FoodLikeBloc(foodItems),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Back and Share buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Icon(Icons.arrow_back_ios, size: 20),
                      onTap: () => Navigator.pop(context),
                    ),
                    const Icon(Icons.share, size: 20),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Profile Image
              CircleAvatar(radius: 48, backgroundImage: AssetImage(profileImage)),

              const SizedBox(height: 24),

              // Name
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E5481),
                ),
              ),

              const SizedBox(height: 32),

              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat("Recipes", recipes),
                  _buildStat("Following", following),
                  _buildStat("Followers", followers),
                ],
              ),

              const SizedBox(height: 32),

              // Follow Button
              SizedBox(
                width: 263,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF34C47C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 8,
                color: const Color(0xFFF4F5F7),
              ),

              const SizedBox(height: 32),

              BlocBuilder<FoodLikeBloc, FoodLikeState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.read<FoodLikeBloc>().add(ChangeTabEvent(0));
                          },
                          child: Column(
                            children: [
                              Text(
                                "Recipes",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: state.selectedTabIndex == 0
                                      ? const Color(0xFF3E5481)
                                      : const Color(0xFF9FA5C0),
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Divider(
                                thickness: state.selectedTabIndex == 0 ? 3 : 1,
                                color: state.selectedTabIndex == 0
                                    ? const Color(0xFF34C47C)
                                    : Colors.grey,
                                height: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.read<FoodLikeBloc>().add(ChangeTabEvent(1));
                          },
                          child: Column(
                            children: [
                              Text(
                                "Liked",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: state.selectedTabIndex == 1
                                      ? const Color(0xFF3E5481)
                                      : const Color(0xFF9FA5C0),
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Divider(
                                thickness: state.selectedTabIndex == 1 ? 3 : 1,
                                color: state.selectedTabIndex == 1
                                    ? const Color(0xFF34C47C)
                                    : Colors.grey,
                                height: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),

              Expanded(
                child: BlocBuilder<FoodLikeBloc, FoodLikeState>(
                  builder: (context, state) {
                    final itemsToShow = state.selectedTabIndex == 0
                        ? state.foodItems
                        : state.foodItems.where((item) => item.isSelected).toList();

                    if (itemsToShow.isEmpty) {
                      return Center(
                        child: Text(
                          state.selectedTabIndex == 0
                              ? "No recipes found."
                              : "No liked recipes yet.",
                          style: const TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      itemCount: itemsToShow.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final item = itemsToShow[index];
                        final originalIndex = state.foodItems.indexOf(item);

                        return FoodCardNoUserWidget(
                          image: item.image,
                          title: item.title,
                          isSelected: item.isSelected,
                          onLikeToggle: () {
                            context.read<FoodLikeBloc>().add(ToggleLikeEvent(originalIndex));
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color(0xFF3E5481),
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF9FA5C0), fontSize: 13),
        ),
      ],
    );
  }
}
