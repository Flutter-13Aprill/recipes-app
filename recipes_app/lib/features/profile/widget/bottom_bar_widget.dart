import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  /// A widget that displays a user profile summary with avatar, name,
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/ChoirulSyafril.png'),
          radius: 60,
        ),
        Text(
          'Choirul Syafril',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('32', style: Theme.of(context).textTheme.headlineMedium),
                Text(
                  'Recipes',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            Column(
              children: [
                Text('782', style: Theme.of(context).textTheme.headlineMedium),
                Text(
                  'Following',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '1.287',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Followers',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ],
        ),
        Divider(thickness: 8, color: Color(0xFFF4F5F7)),
        TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [Tab(text: 'Recipes'), Tab(text: 'Liked')],
        ),
      ],
    );
  }
}
