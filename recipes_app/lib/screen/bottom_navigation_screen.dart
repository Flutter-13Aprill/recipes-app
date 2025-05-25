import 'package:flutter/material.dart';
import 'package:recipes_app/screen/home/home_screen.dart';
import 'package:recipes_app/screen/profile_screen.dart';
import 'package:recipes_app/screen/upload_main_screen.dart';
import 'package:recipes_app/theme/app_colors.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;
  List<Widget> listWidget = [
    HomeScreen(),
    UploadMainScreen(),
    Text(""),
    Text(""),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),

        child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 14,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Color(0xff9FA5C0),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Upload"),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 1),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifiction",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: "Profile",
          ),
        ],
      ),
      body: SafeArea(child: listWidget[currentIndex]),
    );
  }
}
