import 'package:flutter/material.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:recipe/widget/custom_home_contain.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, //tabbar length

      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 300,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,

          title: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40, left: 340.0),
                  child: Icon(Icons.share),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: const Color.fromARGB(65, 209, 206, 206),
                    ),
                    child: AnimatedSearchBar(
                      label: "  Search",

                      labelStyle: TextStyle(color: Colors.grey, fontSize: 16),

                      // ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(right: 280.0),
                  child: Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3E5481),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 160.0),
                  child: ButtonsTabBar(
                    height: 50,
                    // width: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF1FCC79),
                      borderRadius: BorderRadius.circular(32),
                    ),

                    unselectedBackgroundColor: Color(0xFFF4F5F7),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

                    // backgroundColor: Color(0xFF1FCC79),
                    unselectedLabelStyle: TextStyle(color: Color(0xFF9FA5C0)),

                    radius: 36,
                    tabs: [
                      const Tab(text: 'All'),
                      const Tab(text: 'Food'),
                      const Tab(text: 'Drinks'),
                    ],

                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24.0,
                        top: 10,
                        bottom: 16,
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/person.png"),
                          Text("   Alex Mike"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: CustomHomeContain(
                        title: "Salad",
                        discrib: "Food",
                        imagePath: "assets/images/salad.png",
                      ),
                    ),
                  ],
                ),
              ],
            ),

            ListView(
              // Food section
              children: [Text("Food section")],
            ),

            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Column(
                    children: [
                      //Drinks section
                      Text("drinks section"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
