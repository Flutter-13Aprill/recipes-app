import 'package:blocrecipes/CustomWidgets/HomeScreen/categories.dart';
import 'package:blocrecipes/CustomWidgets/HomeScreen/recipe_card.dart';
import 'package:blocrecipes/Helper/screen_extension.dart';
import 'package:blocrecipes/Repo/data.dart';
import 'package:blocrecipes/Screens/home/bloc/home_bloc.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          var bloc = context.read<HomeBloc>();
          bloc.add(RefreshScreen());
          return Scaffold(
            appBar: AppBar(
              title: Text('Home'),
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: context.screenWidth * 0.04,
                    bottom: context.screenHeight * 0.01,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: mainText,
                      ),
                    ),
                  ),
                ),
                // Category tabs
                BlocProvider.value(value: bloc, child: Categories()),
                SizedBox(
                  height: context.screenHeight * 0.05,
                  width: context.screenWidth,

                  child: DefaultTabController(
                    length: 2,

                    child: TabBar(
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      tabs: [
                        Tab(
                          child: Text("Left", style: TextStyle(fontSize: 16)),
                        ),
                        Tab(
                          child: Text("Right", style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
                // Recipes grid
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
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
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
                            return BlocProvider.value(
                              value: bloc,
                              child: RecipeCard(recipe: recipe),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
