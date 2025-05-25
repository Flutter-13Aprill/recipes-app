import 'package:flutter/material.dart';
import 'package:re/widgets/home/category_tab_bar.dart';

// -- Widgets 
import 'package:re/widgets/home/home_search_bar.dart';
import 'package:re/widgets/home/left_and_right_tab_bar.dart';
import 'package:re/widgets/home/post_card.dart';

// -- BLoC
import 'package:re/screens/home/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// -- App Theming
import 'package:re/app_theming/app_colors.dart';

// Utilities
import 'package:re/utilities/screens/screen_sizes.dart';



class HomeScreen extends StatelessWidget {
  /// [HomeScreen] displays the main home UI with search, categories, and posts.
  /// Uses PostBloc to manage and display posts and liked posts.
  /// Includes custom widgets for search bar, category tabs, and post cards.
  /// Layout uses scrollable column with grid of posts supporting like/unlike actions.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchBarController = TextEditingController();
    final postBloc = BlocProvider.of<PostBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.getWidth(),
          height: context.getHeight(),
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.getHeight(multiplied: 0.016)),

                HomeSearchBar(controller: searchBarController),

                SizedBox(height: context.getHeight(multiplied: 0.024)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ),

                SizedBox(height: context.getHeight(multiplied: 0.016)),

                CategoryTabBar(),

                SizedBox(height: context.getHeight(multiplied: 0.024)),

                Divider(color: AppColors.dividerColor, thickness: 4),

                SizedBox(height: context.getHeight(multiplied: 0.024)),

                LeftAndRightTabBar(),

                SizedBox(height: context.getHeight(multiplied: 0.03)),

                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: postBloc.posts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    return BlocBuilder<PostBloc, PostState>(
                      builder: (context, state) {
                        return PostCard(
                          post: postBloc.posts[index],
                          onPressed: () {
                            if(postBloc.likedPosts.contains(postBloc.posts[index])){
                              postBloc.add(DeletePostFromLikedPostsEvent(post: postBloc.posts[index]));
                            }else{
                              postBloc.add(LikedPostEvent(post: postBloc.posts[index]),);
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
