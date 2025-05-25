import 'package:flutter/material.dart';
import 'package:recpie_app/theme/colors_app.dart';
import 'package:recpie_app/widget/card.dart';
import 'package:recpie_app/widget/custom_category.dart';
import 'package:recpie_app/widget/custom_search.dart';
import 'package:recpie_app/widget/main_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsApp.white,
        appBar: AppBar(title: CustomSearch()),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ColorsApp.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(text: 'Category'),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      CustomCategoryContainer(isSelected: false, text: 'All'),
                      SizedBox(width: 16),
                      CustomCategoryContainer(isSelected: false, text: 'Food'),
                      SizedBox(width: 16),
                      CustomCategoryContainer(isSelected: false, text: 'Drink'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: ColorsApp.white,
              width: double.infinity,
              child: const TabBar(
                labelColor: Color.fromARGB(255, 62, 84, 129),
                unselectedLabelColor: Color.fromARGB(255, 159, 165, 192),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: ColorsApp.primary,
                tabs: [
                  Tab(child: Text('Left', style: TextStyle(fontSize: 15))),
                  Tab(child: Text('Right', style: TextStyle(fontSize: 15))),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: CustomCard(
                            userName: 'Calum Lewis',
                            userImage: 'assets/images/pic.png',
                            mainImage: 'assets/images/pic1.png',
                            title: 'Pancake',
                            subtitle: 'Food . >60 mins',
                            isFavorite: false,
                            onFavoritePressed: () {},
                          ),
                        );
                      }),
                    ),
                  ),

                  Center(child: Text('Tab 2 content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
