import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project5/extensions/theme_text.dart';
import 'package:project5/screens/home/bloc/likes_bloc.dart';
import 'package:project5/screens/home/home_screen.dart';
import 'package:project5/screens/profile/bloc/profile_bloc.dart';
import 'package:project5/screens/profile/profile_screen.dart';
import 'package:project5/screens/recipe/add_recipe.dart';
import 'package:project5/screens/recipe/bloc/recpie_bloc.dart';
import 'package:project5/theme/app_colors.dart';
import 'package:project5/widgets/bottom_nav/bloc/handler_bloc.dart';

class BottomNavHandler extends StatelessWidget {
  const BottomNavHandler({super.key});

  @override
  Widget build(BuildContext context) {
    RecpieBloc;
    List<Widget> pages = [
      HomeScreen(),
      AddRecipe(),
      HomeScreen(),
      HomeScreen(),
      ProfileScreen(),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HandlerBloc()),
        BlocProvider(create: (context) => LikesBloc()),
        BlocProvider(create: (context) => RecpieBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
      ],
      child: BlocBuilder<HandlerBloc, HandlerState>(
        builder: (context, state) {
          final bloc = context.read<HandlerBloc>();
          return Scaffold(
            body: pages[bloc.currentIndex],

            floatingActionButton: UnconstrainedBox(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(),
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.buttonsColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/icons/scan.png'),
                    ),
                    Text(
                      '',
                      style: context.bodyM()!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: bloc.currentIndex,

              onTap: (value) {
                bloc.add(ClickEvent(currentIndex: value));
              },
              selectedItemColor: AppColors.buttonsColor,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/home.png',
                    color:
                        bloc.currentIndex == 0
                            ? AppColors.buttonsColor
                            : AppColors.unselected,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/edit.png',
                    color:
                        bloc.currentIndex == 1
                            ? AppColors.buttonsColor
                            : AppColors.unselected,
                  ),
                  label: 'Upload',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code_scanner,
                    color:
                        bloc.currentIndex == 0
                            ? AppColors.buttonsColor
                            : AppColors.unselected,
                  ),
                  label: 'Scan',
                ),

                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/notification.png',
                    color:
                        bloc.currentIndex == 3
                            ? AppColors.buttonsColor
                            : AppColors.unselected,
                  ),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/profile.png',
                    color:
                        bloc.currentIndex == 4
                            ? AppColors.buttonsColor
                            : AppColors.unselected,
                  ),
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
