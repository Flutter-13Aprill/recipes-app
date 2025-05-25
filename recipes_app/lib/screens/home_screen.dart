import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';
import 'package:recipes_app/widgets/category_widget.dart';
import 'package:recipes_app/widgets/food_field_widget.dart';
import 'package:recipes_app/widgets/tab_bar_widget.dart';
import 'package:recipes_app/widgets/tab_one.dart';
import 'package:recipes_app/widgets/text_field_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.white,
              automaticallyImplyLeading: false,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 24,
                      children: [
                        FoodFieldWidget(
                          width: 0.8,
                          img: Image.asset('assets/Vector.png'),
                          lable: 'Search',
                          color: AppColors.form,
                        ),
                        Text(
                          'Category',
                          style: Theme.of(context).textTheme.displayMedium!
                              .copyWith(color: AppColors.mainText),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 16,
                            children: [
                              CategoryWidget(
                                lable: 'All',
                                bgColor: AppColors.primary,
                                txtColor: AppColors.white,
                              ),
                              CategoryWidget(
                                lable: 'Food',
                                bgColor: AppColors.form,
                                txtColor: AppColors.secondaryText,
                              ),
                              CategoryWidget(
                                lable: 'Drink',
                                bgColor: AppColors.form,
                                txtColor: AppColors.secondaryText,
                              ),
                            ],
                          ),
                        ),
                      ],
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
                  TabBarWidget(tab1: 'Left', tab2: 'Right'),

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
