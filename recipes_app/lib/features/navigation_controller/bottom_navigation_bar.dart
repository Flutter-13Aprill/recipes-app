import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipes_app/core/text/app_text.dart';
import 'package:recipes_app/features/navigation_controller/bloc/navigation_bloc.dart';
import 'package:recipes_app/features/navigation_controller/float_action_button.dart';
import 'package:recipes_app/features/navigation_controller/pages/scan_content.dart';
import 'package:recipes_app/features/navigation_controller/pages/home_content.dart';
import 'package:recipes_app/features/navigation_controller/pages/update_content.dart';
import 'package:recipes_app/features/navigation_controller/pages/profile_content.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class BottomNavigationController extends StatelessWidget {
  BottomNavigationController({super.key});


  // pages
  final List<Widget> _pages = [
    HomeContent(),
    CoursesContent(),
    CerteficatesContent(),
    ProfileContent(),
      ProfileContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex=0;
          if (state is MoveIndexState){
            currentIndex =state.index;
          }
          return Scaffold(
                  backgroundColor: AppPalette.whiteColor,
          
                  //start with current index home page
                  body: _pages[currentIndex],
                  //coustmaize bottom navigation bar
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: AppPalette.whiteColor,
                    selectedItemColor: AppPalette.green,
                    unselectedItemColor: AppPalette.greydark,
                    currentIndex: currentIndex,
                    onTap: (index) {
                        context.read<NavigationBloc>().add(MoveIndexEvent(index));
                        },
                    //elemants of navigation bar
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_rounded),
                        label: AppText.navigationHome,
                      ),
                      BottomNavigationBarItem(
                        activeIcon: Icon(Icons.edit,),
                        icon: Icon(Icons.edit),
                        label: 'Upload',
                      ),
                      BottomNavigationBarItem(
                        icon: FloatActionButton(containerColor: AppPalette.green, icon: Icons.qr_code_scanner_rounded, iconColor: AppPalette.whiteColor),
                        
                        label: 'Scan',
                        activeIcon: FloatActionButton(containerColor: AppPalette.green, icon: Icons.qr_code_scanner_rounded, iconColor: AppPalette.greydark),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: 'Notification',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                );
        },
      ),
    
    );
  }
}
