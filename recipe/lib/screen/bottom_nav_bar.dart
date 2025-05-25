import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:recipe/screen/home_screen.dart';
import 'package:recipe/screen/profile_screen.dart';
import 'package:recipe/screen/notific_screen.dart';
import 'package:recipe/screen/scan_screen.dart';
import 'package:recipe/screen/upload_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 2;
  final List<Widget> pages = [
    const HomeScreen(),
    UploadScreen(),
    const ScanScreen(),
    const NotificScreen(),

    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,

        unselectedItemColor: Color.fromARGB(255, 139, 140, 140),

        type: BottomNavigationBarType.fixed,

        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.edit, size: 35),
            label: 'Upload',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.scanner, size: 35),
            label: 'Scan',
          ),

          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 28),
            label: 'Notification',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userLarge, size: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
