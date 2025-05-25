import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/Screen/MyProfile_Screen.dart';
import 'package:flutter_recipes_app/Screen/Upload_Screen.dart';
import 'home_screen.dart';

class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  final Color selectedColor = const Color(0xFF3FD28B);
  final Color unselectedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);
          return Scaffold(
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                UploadScreen(),
                const Center(child: Text("Scan")),
                const Center(child: Text("Notification")),
                MyProfileScreen(
                  profileImage: 'assets/profile.png',
                  name: 'Choirul Syafril',
                 
                  following: 782,
                  followers: 1287,
                 
                ),
              ],
            ),
            bottomNavigationBar: AnimatedBuilder(
              animation: tabController,
              builder: (context, _) {
                return BottomNavigationBar(
                  currentIndex: tabController.index,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: selectedColor,
                  unselectedItemColor: unselectedColor,
                  onTap: (index) => tabController.animateTo(index),
                  items: [
                    BottomNavigationBarItem(
                      icon: Transform.translate(
                        offset: const Offset(0, -12),
                        child: const Icon(Icons.home, size: 28),
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Transform.translate(
                        offset: const Offset(0, -14),
                        child: const Icon(Icons.cloud_upload, size: 28),
                      ),
                      label: "Upload",
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Text(
                              "Scan",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color:
                                    tabController.index == 2
                                        ? selectedColor
                                        : Colors.grey,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -30),
                            child: Container(
                              width: 66,
                              height: 66,
                              decoration: BoxDecoration(
                                color: selectedColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.document_scanner_rounded,
                                color:
                                    tabController.index == 2
                                        ? Colors.white
                                        : Colors.white70,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Transform.translate(
                        offset: const Offset(0, -14),
                        child: const Icon(Icons.notifications, size: 28),
                      ),
                      label: "Notification",
                    ),
                    BottomNavigationBarItem(
                      icon: Transform.translate(
                        offset: const Offset(0, -14),
                        child: const Icon(Icons.person, size: 28),
                      ),
                      label: "Profile",
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
