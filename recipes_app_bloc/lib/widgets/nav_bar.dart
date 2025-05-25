import 'package:flutter/material.dart';
import 'package:recipes_app_bloc/screens/home_screens/home_screen.dart';
import 'package:recipes_app_bloc/screens/notification_screen.dart';
import 'package:recipes_app_bloc/screens/profile_screens/profile_screen.dart';
import 'package:recipes_app_bloc/screens/scan_screen.dart';
import 'package:recipes_app_bloc/screens/upload_screens/upload_screen.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    UploadScreenContent(),
    ScanScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Stack(
                alignment: Alignment.topCenter,
        clipBehavior: Clip.none,

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
            
                children: [
                  SizedBox(width: 36,),
                  _buildItem(
                    index: 0,
                    label: "Home",
                    selectedIcon: 'lib/assets/images/Home.png',
                    unselectedIcon: 'lib/assets/images/Home_grey.png',
                  ),
                  SizedBox(width: 32,),
                  _buildItem(
                    index: 1,
                    label: "Upload",
                    icon: 'lib/assets/images/Edit.png',
                  ),
                   SizedBox(width: 38,),
                     _buildItem(
                      index: 2,
                      label: "Scan",
                      icon: 'lib/assets/images/Scan.png',
                              
                    ),
                      SizedBox(width: 28,),
                  _buildItem(
                    index: 3,
                    label: "Notification",
                    icon: 'lib/assets/images/Notification_grey.png',
                  ),
                   SizedBox(width: 22,),
                  _buildItem(
                    index: 4,
                    label: "Profile",
                    selectedIcon: 'lib/assets/images/Profile.png',
                    unselectedIcon: 'lib/assets/images/Profile_grey.png',
                  ),
                    SizedBox(width: 10,),
                ],
              ),
            ),
          ),
          Positioned(
              top: -28,
              left: 189,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: ColorPallete.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'lib/assets/images/Scan.png',
                    height: 28,
                    width: 28,
                  ),)) ))
        ],
       
      ),
    );
  }

  Widget _buildItem({
    required int index,
    required String label,
    String? selectedIcon,
    String? unselectedIcon,
    String? icon,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon ?? (isSelected ? selectedIcon! : unselectedIcon!),
            height: 24,
            width: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? ColorPallete.green : ColorPallete.bluishGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}





