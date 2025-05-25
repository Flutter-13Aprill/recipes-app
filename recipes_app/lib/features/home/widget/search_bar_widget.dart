import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  /// Search bar widget with filter buttons and tabs.

  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(234, 234, 245, 1),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            // SearchBar
            child: SearchBar(
              leading: Icon(Icons.search),
              elevation: WidgetStateProperty.all(0.0),
              backgroundColor: WidgetStateProperty.all(Colors.grey.shade200),
              hintText: 'Search',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('All')),
              ElevatedButton(onPressed: () {}, child: Text('Food')),
              ElevatedButton(onPressed: () {}, child: Text('Drink')),
            ],
          ),
        ),

        Divider(thickness: 8, color: Color(0xFFF4F5F7)),
        TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [Tab(text: 'Left'), Tab(text: 'Right')],
        ),
      ],
    );
  }
}
