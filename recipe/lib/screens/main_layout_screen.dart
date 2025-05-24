import 'package:flutter/material.dart';
import 'package:recipe/screens/home/home_screen.dart';
import 'package:recipe/screens/like/profile/profile_screen.dart';
import 'package:recipe/screens/upload/upload_screen.dart';
import 'package:recipe/screens/notification/notification_screen.dart';

final ValueNotifier<int> selectedIndex = ValueNotifier(0);

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final List<Widget> pages = [
    const HomeScreen(),
    const UploadScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, index, _) => pages[index],
      ),

      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, index, _) {
          return BottomAppBar(
            height: 70,
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ⬅️ Home + Upload
                  Row(
                    children: [
                      _NavItem(
                        icon: Icons.home,
                        label: "Home",
                        selected: index == 0,
                        onTap: () => selectedIndex.value = 0,
                      ),
                      const SizedBox(width: 20),
                      _NavItem(
                        icon: Icons.file_upload,
                        label: "Upload",
                        selected: index == 1,
                        onTap: () => selectedIndex.value = 1,
                      ),
                    ],
                  ),

                  // ➡️ Notification + Profile
                  Row(
                    children: [
                      _NavItem(
                        icon: Icons.notifications,
                        label: "Notification",
                        selected: index == 2,
                        onTap: () => selectedIndex.value = 2,
                      ),
                      const SizedBox(width: 20),
                      _NavItem(
                        icon: Icons.person,
                        label: "Profile",
                        selected: index == 3,
                        onTap: () => selectedIndex.value = 3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF21CE77),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 60,
          height: 56,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: selected ? Colors.green : Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: selected ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
