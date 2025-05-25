import 'package:flutter/material.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/extensions/theme_text.dart';
import 'package:project5/theme/app_colors.dart';
import 'package:project5/widgets/tab_bar_view/liked_page.dart';
import 'package:project5/widgets/tab_bar_view/recpies_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 25),
            child: Icon(Icons.share, color: Colors.black),
          ),
        ],
      ),

      body: SafeArea(
        child: Container(
          width: context.getWidth(),
          height: context.getHeight() * 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: 100,
                height: 100,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  'assets/images/profile5.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Choirul Syafril',
                style: context.titleL()!.copyWith(fontSize: 17),
              ),

              // SizedBox(height: 25),
              Container(
                width: context.getWidth() * 0.65,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '32',
                          style: context.titleL()!.copyWith(fontSize: 17),
                        ),
                        Text('Recipes', style: context.bodyS()),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '782',
                          style: context.titleL()!.copyWith(fontSize: 17),
                        ),
                        Text('Following', style: context.bodyS()),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '1287',
                          style: context.titleL()!.copyWith(fontSize: 17),
                        ),
                        Text('Followers', style: context.bodyS()),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: context.getWidth() * 0.66,
                height: context.getHeight() * 0.058,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColors.buttonsColor,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              DefaultTabController(
                length: 2,
                child: UnconstrainedBox(
                  child: Container(
                    width: context.getWidth(),
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Color.fromARGB(255, 62, 84, 129),
                          unselectedLabelColor: Color.fromARGB(
                            255,
                            159,
                            165,
                            192,
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: AppColors.buttonsColor,
                          tabs: [
                            Container(
                              height: 37,
                              child: Text(
                                'Recpiecs',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Container(
                              height: 37,
                              child: Text(
                                'Lkied',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: context.getWidth() * 0.85,
                          height: context.getHeight() * 0.399,
                          child: TabBarView(
                            children: [RecpiesPage(), LikedPage()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
