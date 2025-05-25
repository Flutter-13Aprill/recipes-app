import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';
import 'package:recipes_app/widgets/profile_info.dart';
import 'package:recipes_app/widgets/tab_bar_widget.dart';
import 'package:recipes_app/widgets/tab_one.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Image.asset('assets/share.png'),
                ),
              ],
              backgroundColor: AppColors.white,
              automaticallyImplyLeading: false,
              expandedHeight: 290,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        spacing: 24,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/Avatar.png'),
                          ),
                          Text(
                            'Choirul Syafril',
                            style: Theme.of(context).textTheme.displayMedium!
                                .copyWith(color: AppColors.mainText),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ProfileInfo(num: '32', info: 'Recipes'),
                              ProfileInfo(num: '782', info: 'Following'),
                              ProfileInfo(num: '1.287', info: 'Followers'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Divider(thickness: 10, color: AppColors.form),
            ),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  TabBarWidget(tab1: 'Recipes', tab2: 'Liked'),

                  SizedBox(
                    height: 900,
                    child: TabBarView(children: [TabOne(), TabOne()]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
