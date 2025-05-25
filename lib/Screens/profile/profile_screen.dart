import 'package:blocrecipes/CustomWidgets/ProfileScreen/profile_recipe_card.dart';
import 'package:blocrecipes/CustomWidgets/ProfileScreen/stat.dart';
import 'package:blocrecipes/Repo/data.dart';
import 'package:blocrecipes/Screens/profile/bloc/profile_bloc.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
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
              CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage(uploaded[0].profileImagePath),
              ),

              const SizedBox(height: 24),

              // Name
              Text(
                recipes[0].userName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: mainText,
                ),
              ),

              const SizedBox(height: 32),

              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stat(label: "Recipes", value: 5),
                  Stat(label: "Following", value: 7),
                  Stat(label: "Followers", value: 8),
                ],
              ),

              const SizedBox(height: 32),

              // Follow Button
              SizedBox(
                width: 263,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: Theme.of(context).elevatedButtonTheme.style,
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
              Container(width: double.infinity, height: 8, color: background),

              const SizedBox(height: 32),

              // Tabs (Recipes / Liked)
              // Tabs and content
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: primaryColor,
                        labelColor: primaryColor,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            child: Text(
                              "Recipes",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Liked",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Recipes Grid
                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) {
                                var bloc = context.read<ProfileBloc>();
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.571,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 8,
                                        ),
                                    itemCount: uploaded.length,
                                    itemBuilder: (context, index) {
                                      final recipe = uploaded[index];
                                      return BlocProvider.value(
                                        value: bloc,
                                        child: ProfileRecipeCard(
                                          recipe: recipe,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            // Liked Grid
                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) {
                                var bloc = context.read<ProfileBloc>();
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.571,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 8,
                                        ),
                                    itemCount: liked.length,
                                    itemBuilder: (context, index) {
                                      final recipe = liked[index];
                                      return BlocProvider.value(
                                        value: bloc,
                                        child: ProfileRecipeCard(
                                          recipe: recipe,
                                        ),
                                      );
                                    },
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
