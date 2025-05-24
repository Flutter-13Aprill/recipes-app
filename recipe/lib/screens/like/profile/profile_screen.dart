import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/cusom_widget/profile_header.dart';
import 'package:recipe/cusom_widget/recipes_tab.dart';
import 'package:recipe/screens/like/bloc/liked_bloc.dart';
import 'package:recipe/screens/like/liked_tab.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LikedBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: const [Icon(Icons.share, color: Colors.black)],
        ),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: const [
                ProfileHeader(),
                SizedBox(height: 16),
                TabBar(
                  labelColor: Color(0xFF21CE77),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Color(0xFF21CE77),
                  tabs: [
                    Tab(text: "Recipes"),
                    Tab(text: "Liked"),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [RecipesTab(), LikedTab()]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
