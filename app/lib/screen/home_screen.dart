import 'package:app/screen/home_tab_bar/bloc/recipe_events_bloc.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_event.dart';
import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:app/widgets/container/category_contaner.dart';
import 'package:app/widgets/container/line_conatiner.dart';
import 'package:app/widgets/tab_bar/tab_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // Search bar widget with custom padding and no elevation
            margin: const EdgeInsets.all(20),
            child: SearchBar(
              elevation: WidgetStateProperty.all<double>(0),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.only(left: 20),
              ),
              hintText: "Search",
              leading: const Icon(Icons.search, size: 29),
            ),
          ), // "Category" title text

          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Category",
              style: TextStyle(
                color: Color(0xff3E5481),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            // Row of category filters
            children: [
              // "All" category - highlighted
              CategoryContaner(
                titelColor: Colors.white,
                title: "All",
                backgrouncolor: Color(0xff1FCC79),
              ),
              CategoryContaner(
                // "Food" category - unselected style
                titelColor: Color(0xff9FA5C0),
                title: "Food",
                backgrouncolor: Color.fromARGB(15, 116, 121, 131),
              ),
              CategoryContaner(
                // "Drink" category - unselected style
                titelColor: Color(0xff9FA5C0),
                title: "Drink",
                backgrouncolor: Color.fromARGB(15, 116, 121, 131),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const LineConatiner(
            // Divider line
            color: Color(0xffF4F5F7),
            size: 1,
            leftMargin: 0,
            rigthMargin: 0,
          ),

          Expanded(child: TabBarHome()),
        ],          // Expanded tab bar section to show recipe content

      ),
    );
  }
}
