import 'package:flutter/material.dart';

// -- BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re/screens/home/bloc/post_bloc.dart';
import 'package:re/screens/upload_recipe/bloc/recipe_bloc.dart';

// -- Widgets
import 'package:re/widgets/home/post_card.dart';
import 'package:re/widgets/profile/profile_statistics.dart';
import 'package:re/widgets/upload_recipe/recipe_card.dart';

// -- App Theming
import 'package:re/app_theming/app_colors.dart';

// -- Utilities
import 'package:re/utilities/screens/screen_sizes.dart';

class ProfileScreen extends StatelessWidget {

  /// [ProfileScreen] shows user profile with statistics and tabbed views for Recipes and Liked posts.
  /// Uses RecipeBloc and PostBloc to fetch and display recipes and liked posts respectively.
  /// Displays content in grids with option to like/unlike posts.
  /// Custom widgets ProfileStatistics, RecipeCard, and PostCard are used for layout.
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: Image.asset('assets/profile/go_back.png'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Image.asset('assets/profile/share.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ProfileStatistics(),

      
            SizedBox(
              height: context.getHeight(multiplied: 0.6),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelPadding: EdgeInsets.symmetric(vertical: 16),
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelStyle:Theme.of(context).textTheme.displaySmall,
                      indicatorColor: AppColors.selectedTabBarColor,
                      dividerColor: Colors.transparent,
                      labelStyle: Theme.of(context,).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w700,color: AppColors.mainTextColor,
                      ),
                      tabs: [Text('Recipes'), Text('Liked')],
                    ),
      
                    SizedBox(
                      width: context.getWidth(),
                      height: context.getHeight(multiplied: 0.5),
                      child: TabBarView(
                        children: [
                          BlocBuilder<RecipeBloc, RecipeState>(
                            builder: (context, state) {

                              if(state is SuccessAddedRecipeState){

                                final recipesList = state.recipes;

                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: recipesList.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 0.6
                                  ), 
                                  itemBuilder: (context, index){
                                    return RecipeCard(recipe: recipesList[index]);
                                  }
                                  );
                              }
                              return Center(child: Text('There are no recipe') );
                            },
                          ),
      
                          BlocBuilder<PostBloc, PostState>(
                            builder: (context, state) {
      
                              if(state is LikedPostedState){
                                final likedPosts = state.likePosts;
                                return GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: likedPosts.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 0.6
                                  ) , 
                                  itemBuilder:(context, index){
                                    return PostCard(
                                      post: likedPosts[index],
                                      onPressed: () {
                                        if(likedPosts.contains(likedPosts[index])){
                                          postBloc.add(DeletePostFromLikedPostsEvent(post: likedPosts[index]));
                                        }else{
                                          postBloc.add(LikedPostEvent(post: likedPosts[index],),
                                          );
      
                                        }
                                      },
                                    );
                                  }
                                  );
                              }
      
                              return Center(child: Text('There are no liked posts'),);
                        
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
    );
  }
}
