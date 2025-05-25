import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/bloc/liked_bloc.dart';
import 'package:recipes_app/features/navigation/bloc/navigation_bloc.dart';
import 'package:recipes_app/features/home/screens/home_screen.dart';
import 'package:recipes_app/features/notification/screen/notification_screen.dart';
import 'package:recipes_app/features/profile/screens/profile_screen.dart';
import 'package:recipes_app/features/upload/bloc/uplaod_bloc.dart';
import 'package:recipes_app/features/upload/screens/uploud_form_screen.dart';
import 'package:recipes_app/style/style_color.dart';

/// Main navigation screen with bottom navigation bar and floating action button.
///
/// Provides navigation between Home, Upload, Notification, and Profile screens.
/// The middle navigation item (index 2) is disabled and replaced by a floating action button.
class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  final List<Widget> screens = const [
    HomeScreen(),
    UploadFormScreen(),
    SizedBox(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationBloc()),
        BlocProvider(create: (_) => LikedBloc()),
        BlocProvider(create: (_) => UplaodBloc()),
      ],
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is! NavigationBarState) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            body: screens[state.selectedIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: StyleColor.primary,
              shape: CircleBorder(),
              child: Icon(Icons.qr_code_scanner, size: 30, color: Colors.white),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,

              currentIndex: state.selectedIndex,
              onTap: (value) {
                if (value == 2) return;
                context.read<NavigationBloc>().add(
                  NavigationItemSelected(value),
                );
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.edit),
                  label: "Upload",
                ),
                BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "Notification",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
