import 'package:app/widgets/column/profile_column.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/container/line_conatiner.dart';
import 'package:app/widgets/tab_bar/profile_tabbr.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            // Profile image in a circular avatar
            radius: 70,
            backgroundImage: AssetImage("assets/images/17.png"),
          ),
          const SizedBox(height: 16),
          const Text(
            "Choirul Syafril", // Username display ad style

            style: TextStyle(
              color: Color(0xff3E5481),
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            // Row showing Recipes, Following, and Followers counts
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              //cutom widges
              ProfileColumn(title: "Recipes", number: 32),
              ProfileColumn(title: "Following", number: 782),
              ProfileColumn(title: "Followers", number: 1.287),
            ],
          ),
          const SizedBox(height: 8), //space
          const LineConatiner(
            // Horizontal line separator
            color: Color(0xffF4F5F7),
            size: 1,
            leftMargin: 0,
            rigthMargin: 0,
          ),

          // Profile tabs  
          Expanded(child: const ProfileTabBar()),
        ],
      ),
    );
  }
}
