// lib/screen/navigation_bar/bottom_navigation_bar.dart

import 'package:app/screen/home_screen.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_event.dart'; // ستحتاج هذا الاستيراد لـ LoadRecipesEvent
import 'package:app/screen/navigation_bar/bloc/navigationbar_bloc.dart';
import 'package:app/screen/notifcation_screen.dart';
import 'package:app/screen/profile_screen.dart';
import 'package:app/screen/scan_screen.dart';
import 'package:app/screen/upload/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import 'package:app/screen/home_tab_bar/bloc/recipe_events_bloc.dart';

class BottomNavigationBarr extends StatelessWidget {
  const BottomNavigationBarr({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم MultiBlocProvider لتوفير كلا الـ BLoCs في مستوى واحد
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationbarBloc>(
          create: (context) => NavigationbarBloc(),
        ),
        BlocProvider<RecipeBloc>(
          create: (context) => RecipeBloc()..add(LoadRecipesEvent()), // يتم تحميل الوصفات هنا عند إنشاء البلوك
        ),
      ],
      child: BlocBuilder<NavigationbarBloc, NavigationbarState>(
        builder: (context, state) {
          int actualCurrentIndex = 0;
          if (state is NavigationbarInitial) {
            actualCurrentIndex = state.currentIndex;
          } else if (state is NavigationbarSelectionChanged) {
            actualCurrentIndex = state.currentIndex;
          }

          final navigationBloc = BlocProvider.of<NavigationbarBloc>(context);

           final List<Widget> pages = [
            const HomeScreen(), // RecipeBloc متاح الآن من المستوى الأعلى
            const UploadScreen(),
            const ScanScreen(),
            const NotifcationScreen(),
            const ProfileScreen(), // RecipeBloc متاح الآن من المستوى الأعلى
          ];

          return Scaffold(
            body: pages[actualCurrentIndex],
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              color: Colors.white,
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navigationBloc.add(NavigationItemTapped(0));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: actualCurrentIndex == 0 ? Colors.green : Colors.grey,
                          ),
                          const Text(
                            'Home',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navigationBloc.add(NavigationItemTapped(1));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.edit_note,
                            color: actualCurrentIndex == 1 ? Colors.green : Colors.grey,
                          ),
                          const Text(
                            'Upload',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 65.0),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navigationBloc.add(NavigationItemTapped(3));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.notifications,
                            color: actualCurrentIndex == 3 ? Colors.green : Colors.grey,
                          ),
                          const Text(
                            'Notification',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        navigationBloc.add(NavigationItemTapped(4));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: actualCurrentIndex == 4 ? Colors.green : Colors.grey,
                          ),
                          const Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Transform.translate(
              offset: const Offset(0.0, 19.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      navigationBloc.add(NavigationItemTapped(2));
                    },
                    child: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Scan',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}