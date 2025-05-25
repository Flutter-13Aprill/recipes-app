import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  // Custom tab bar widget showing a cancel button on the left 
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        ),
        Row(
          children: [
            Text('1/', style: Theme.of(context).textTheme.bodyLarge),
            Text('2', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
