import 'package:blocrecipes/Screens/home/home_screen.dart';
import 'package:blocrecipes/Screens/profile/profile_screen.dart';
import 'package:blocrecipes/Screens/upload/upload_screen.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  List<ItemConfig> items = [
    ItemConfig(
      icon: Image.asset(
        "assets/images/home.png",
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        color: primaryColor,
      ),
      title: "Home",
      activeForegroundColor: primaryColor,
    ),
    ItemConfig(
      icon: Image.asset(
        "assets/images/upload.png",
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      title: "Upload",
      activeForegroundColor: primaryColor,
    ),
    ItemConfig(
      icon: Image.asset(
        "assets/images/scan.png",
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        color: Colors.white,
      ),
      title: "Scan",
      activeForegroundColor: primaryColor,
    ),
    ItemConfig(
      icon: Image.asset(
        "assets/images/notifications.png",
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      title: "Notifications",
      activeForegroundColor: primaryColor,
    ),
    ItemConfig(
      icon: Image.asset(
        "assets/images/profile.png",
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      title: "Profile",
      activeForegroundColor: primaryColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(screen: HomeScreen(), item: items[0]),
        PersistentTabConfig(screen: UploadScreen(), item: items[1]),
        PersistentTabConfig(screen: Placeholder(), item: items[2]),
        PersistentTabConfig(screen: Placeholder(), item: items[3]),
        PersistentTabConfig(screen: ProfileScreen(), item: items[4]),
      ],
      navBarBuilder:
          (navBarConfig) => Style13BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
