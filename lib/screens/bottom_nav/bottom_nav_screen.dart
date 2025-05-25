import 'package:flutter/material.dart';

// -- BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re/screens/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:re/screens/home/bloc/post_bloc.dart';
import 'package:re/screens/upload_recipe/bloc/recipe_bloc.dart';

// -- Screens
import 'package:re/screens/home/home_screen.dart';
import 'package:re/screens/profile/profile_screen.dart';
import 'package:re/screens/upload_recipe/upload_recipe_screen.dart';

// -- Utilities & Theming
import 'package:flutter_svg/flutter_svg.dart';
import 'package:re/app_theming/app_colors.dart';


class BottomNavScreen extends StatelessWidget {
  /// [BottomNavScreen] manages main app navigation with a BottomNavigationBar.
  /// Uses multiple BLoCs to handle navigation, posts, and recipe states.
  /// Includes a floating action button to navigate to the Scan screen.
  /// Updates the displayed screen based on the selected tab index.
  BottomNavScreen({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    UploadRecipeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(create: (context) => PostBloc()..add(InitialPostEvent())),
        BlocProvider(create: (context) => RecipeBloc())
      ],
      child: Builder(
        builder: (context) {
          final bottomNavBloc = context.read<BottomNavBloc>();

          return BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              return Scaffold(
                floatingActionButton: Container(
                  
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    shape: BoxShape.circle
                  ),
                  child: InkWell(
                    onTap: () => bottomNavBloc.add(ChangeScreenEvent(index: 2)),
                    child: Image.asset('assets/bottom_nav/Scan.png')
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: BottomNavigationBar(

                  type: BottomNavigationBarType.fixed,
                  currentIndex: bottomNavBloc.currentIndex,
                  onTap: (value) {bottomNavBloc.add(ChangeScreenEvent(index: value));},
                  selectedItemColor: AppColors.selectedBottomTabColor,
                  unselectedItemColor: AppColors.unselectedBottomTabColor,
                  items: [
                    BottomNavigationBarItem(label: 'Home',icon: SvgPicture.asset('assets/bottom_nav/Home.svg',color: bottomNavBloc.currentIndex == 0 ? AppColors.selectedBottomTabColor : AppColors.unselectedBottomTabColor  ,),),
                    BottomNavigationBarItem(label: 'Upload',icon: SvgPicture.asset('assets/bottom_nav/Edit.svg', color: bottomNavBloc.currentIndex == 1 ? AppColors.selectedBottomTabColor : AppColors.unselectedBottomTabColor  ,),),
                    BottomNavigationBarItem(label: 'Scan',icon: Icon(Icons.qr_code_scanner)),
                    BottomNavigationBarItem(label: 'Notification',icon: SvgPicture.asset('assets/bottom_nav/Notification.svg', color: bottomNavBloc.currentIndex == 3 ? AppColors.selectedBottomTabColor: AppColors.unselectedBottomTabColor)),
                    BottomNavigationBarItem(label: 'Profile',icon: SvgPicture.asset('assets/bottom_nav/Profile.svg',color: bottomNavBloc.currentIndex == 4 ? AppColors.selectedBottomTabColor : AppColors.unselectedBottomTabColor ))
                  ],
                ),
                body: screens.elementAt(bottomNavBloc.currentIndex),
              );
            },
          );
        },
      ),
    );
  }
}
