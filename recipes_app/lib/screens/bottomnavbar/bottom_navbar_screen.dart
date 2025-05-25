import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/screens/bottomnavbar/bloc/upload_bloc.dart';
import 'package:recipes_app/screens/bottomnavbar/bottomnavbarbloc/navigation_bloc.dart'
    as navbar;
import 'package:recipes_app/screens/bottomnavbar/bottomnavbarbloc/navigation_bloc.dart';
import 'package:recipes_app/screens/home/home_screen.dart';
import 'package:recipes_app/screens/profile/profile_screen.dart';
import 'package:recipes_app/screens/upload/upload_screen.dart';
import 'package:recipes_app/style/app_colors.dart';
import 'package:recipes_app/widgets/bottom_nav_item_widget.dart';

class BottomNavbarScreen extends StatelessWidget {
  final int initialIndex;

  BottomNavbarScreen({super.key, this.initialIndex = 0});
  final uploadBloc = UploadBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
        BlocProvider<UploadBloc>.value(value: uploadBloc),
      ],
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          final currentIndex =
              (state is navbar.SuccessState) ? state.selectedIndex : 0;

          final pages = [
            BlocProvider.value(value: uploadBloc, child: HomeScreen()),
            BlocProvider.value(value: uploadBloc, child: UploadScreen()),
            Center(child: Text("Scan")),
            Center(child: Text("Notifications")),

            BlocProvider.value(value: uploadBloc, child: ProfileScreen()),
          ];

          return Scaffold(
            body: pages[currentIndex],

            floatingActionButton: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                onPressed:
                    () =>
                        context.read<NavigationBloc>().add(PageTappedEvent(2)),
                backgroundColor: AppColors.buttonColor,
                elevation: 4,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItemWidget(
                      icon: Icons.home_filled,
                      index: 0,
                      label: 'Home',
                      selectedIndex: currentIndex,
                      onTap:
                          (index) => context.read<NavigationBloc>().add(
                            PageTappedEvent(index),
                          ),
                    ),
                    BottomNavItemWidget(
                      icon: Icons.edit,
                      index: 1,
                      label: 'Upload',
                      selectedIndex: currentIndex,
                      onTap:
                          (index) => context.read<NavigationBloc>().add(
                            PageTappedEvent(index),
                          ),
                    ),
                    const SizedBox(
                      width: 65,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 28, left: 24),
                          child: Text('Scan', textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                    BottomNavItemWidget(
                      icon: Icons.notifications_rounded,
                      index: 3,
                      label: 'Notifications',
                      selectedIndex: currentIndex,
                      onTap:
                          (index) => context.read<NavigationBloc>().add(
                            PageTappedEvent(index),
                          ),
                    ),
                    BottomNavItemWidget(
                      icon: Icons.person_sharp,
                      index: 4,
                      label: 'Profile',
                      selectedIndex: currentIndex,
                      onTap:
                          (index) => context.read<NavigationBloc>().add(
                            PageTappedEvent(index),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipes_app/screens/bottomnavbar/bloc/upload_bloc.dart';
// import 'package:recipes_app/screens/home/home_screen.dart';
// import 'package:recipes_app/screens/hometest/home_screen_test.dart';
// import 'package:recipes_app/screens/profile/profile_screen.dart';
// import 'package:recipes_app/screens/upload/upload_screen.dart';
// import 'package:recipes_app/style/app_colors.dart';
// import 'package:recipes_app/widgets/bottom_nav_item_widget.dart';

// class BottomNavbarScreen extends StatefulWidget {
//   const BottomNavbarScreen({super.key});

//   @override
//   State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
// }

// class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
//   int _selectedIndex = 0;

//   late final UploadBloc uploadBloc;

//   @override
//   void initState() {
//     super.initState();
//     uploadBloc = UploadBloc();
//   }

//   @override
//   void dispose() {
//     uploadBloc.close();
//     super.dispose();
//   }

//   final List<Widget> _pages = [];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       BlocProvider.value(value: uploadBloc, child: HomeScreen()),

//       // HomeScreen(),
//       BlocProvider.value(value: uploadBloc, child: UploadScreen()),
//       Center(child: Text("Scan")),
//       BlocProvider.value(value: uploadBloc, child: HomeScreenTest()),
//       BlocProvider.value(value: uploadBloc, child: ProfileScreen()),

//       // ProfileScreen(),
//     ];

//     return BlocProvider.value(
//       value: uploadBloc,
//       child: Scaffold(
//         body: pages[_selectedIndex],

//         floatingActionButton: SizedBox(
//           height: 70,
//           width: 70,
//           child: FloatingActionButton(
//             onPressed: () => _onItemTapped(2),
//             backgroundColor: AppColors.buttonColor,
//             elevation: 4,
//             shape: const CircleBorder(),
//             child: Icon(
//               Icons.qr_code_scanner_outlined,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//         ),

//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

//         bottomNavigationBar: BottomAppBar(
//           color: Colors.white,
//           child: SizedBox(
//             height: 60,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 BottomNavItemWidget(
//                   icon: Icons.home_filled,
//                   index: 0,
//                   label: 'Home',
//                   selectedIndex: _selectedIndex,
//                   onTap: _onItemTapped,
//                 ),

//                 BottomNavItemWidget(
//                   icon: Icons.edit,
//                   index: 1,
//                   label: 'Upload',
//                   selectedIndex: _selectedIndex,
//                   onTap: _onItemTapped,
//                 ),

//                 SizedBox(
//                   width: 65,
//                   child: Align(
//                     alignment: Alignment.topCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 24),
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           'Scan',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color:
//                                 _selectedIndex == 2
//                                     ? AppColors.buttonColor
//                                     : Colors.grey,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 BottomNavItemWidget(
//                   icon: Icons.notifications_rounded,
//                   index: 3,
//                   label: 'Notifications',
//                   selectedIndex: _selectedIndex,
//                   onTap: _onItemTapped,
//                 ),

//                 BottomNavItemWidget(
//                   icon: Icons.person_sharp,
//                   index: 4,
//                   label: 'Profile',
//                   selectedIndex: _selectedIndex,
//                   onTap: _onItemTapped,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:recipes_app/screens/home/home_screen.dart';
// import 'package:recipes_app/screens/home_screen_test.dart';
// import 'package:recipes_app/screens/profile/profile_screen.dart';
// import 'package:recipes_app/screens/upload/upload_screen.dart';
// import 'package:recipes_app/style/app_colors.dart';
// import 'package:recipes_app/widgets/bottom_nav_item_widget.dart';

// class BottomNavbarScreen extends StatefulWidget {
//   const BottomNavbarScreen({super.key});

//   @override
//   State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
// }

// class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     HomeScreen(),
//     UploadScreen(),
//     Center(child: Text("Scan")),
//     Center(child: Text("Notifications")),
//     // HomeScreenTest(),
//     ProfileScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],

//       floatingActionButton: SizedBox(
//         height: 70,
//         width: 70,
//         child: FloatingActionButton(
//           onPressed: () => _onItemTapped(2),
//           backgroundColor: AppColors.buttonColor,
//           elevation: 4,
//           shape: const CircleBorder(),
//           child: Icon(
//             Icons.qr_code_scanner_outlined,
//             color: Colors.white,
//             size: 30,
//           ),
//         ),
//       ),

//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         child: SizedBox(
//           height: 60,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               BottomNavItemWidget(
//                 icon: Icons.home_filled,
//                 index: 0,
//                 label: 'Home',
//                 selectedIndex: _selectedIndex,
//                 onTap: _onItemTapped,
//               ),

//               BottomNavItemWidget(
//                 icon: Icons.edit,
//                 index: 1,
//                 label: 'Upload',
//                 selectedIndex: _selectedIndex,
//                 onTap: _onItemTapped,
//               ),

//               SizedBox(
//                 width: 65,
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 24),
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         'Scan',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color:
//                               _selectedIndex == 2
//                                   ? AppColors.buttonColor
//                                   : Colors.grey,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               BottomNavItemWidget(
//                 icon: Icons.notifications_rounded,
//                 index: 3,
//                 label: 'Notifications',
//                 selectedIndex: _selectedIndex,
//                 onTap: _onItemTapped,
//               ),

//               BottomNavItemWidget(
//                 icon: Icons.person_sharp,
//                 index: 4,
//                 label: 'Profile',
//                 selectedIndex: _selectedIndex,
//                 onTap: _onItemTapped,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






// import 'package:recipes_app/bloc/navigation/navigation_bloc.dart';
// import 'package:recipes_app/bloc/navigation/navigation_event.dart';
// import 'package:recipes_app/bloc/navigation/navigation_state.dart';







// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipes_app/screens/bottomnavbar/bloc/navigation_bloc.dart';
// import 'package:recipes_app/screens/home/home_screen.dart';
// import 'package:recipes_app/screens/home_screen_test.dart';
// import 'package:recipes_app/screens/profile/profile_screen.dart';
// import 'package:recipes_app/screens/upload/upload_screen.dart';
// import 'package:recipes_app/style/app_colors.dart';
// import 'package:recipes_app/widgets/bottom_nav_item_widget.dart';

// class BottomNavbarScreen extends StatelessWidget {
//   BottomNavbarScreen({super.key});

//   final List<Widget> _pages = [
//     HomeScreen(),
//     UploadScreen(),
//     const Center(child: Text("Scan")),
//     const Center(child: Text("Scan")),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => NavigationBloc(),
//       child: BlocBuilder<NavigationBloc, NavigationState>(
//         builder: (context, state) {
//           return Scaffold(
//             body: _pages[(state is SuccessState) ? state.selectedIndex : 0],

//             floatingActionButton: SizedBox(
//               height: 70,
//               width: 70,
//               child: FloatingActionButton(
//                 onPressed: () {
//                   context.read<NavigationBloc>().add(PageTappedEvent(2));
//                 },
//                 backgroundColor: AppColors.buttonColor,
//                 elevation: 4,
//                 shape: const CircleBorder(),
//                 child: const Icon(
//                   Icons.qr_code_scanner_outlined,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),

//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerDocked,

//             bottomNavigationBar: BottomAppBar(
//               color: Colors.white,
//               child: SizedBox(
//                 height: 60,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     BottomNavItemWidget(
//                       icon: Icons.home_filled,
//                       index: 0,
//                       label: 'Home',
//                       selectedIndex:
//                           (state is SuccessState) ? state.selectedIndex : 0,
//                       onTap:
//                           (index) => context.read<NavigationBloc>().add(
//                             PageTappedEvent(index),
//                           ),
//                     ),
//                     BottomNavItemWidget(
//                       icon: Icons.edit,
//                       index: 1,
//                       label: 'Upload',
//                       selectedIndex:
//                           (state is SuccessState) ? state.selectedIndex : 0,
//                       onTap:
//                           (index) => context.read<NavigationBloc>().add(
//                             PageTappedEvent(index),
//                           ),
//                     ),
//                     const SizedBox(width: 65),
//                     BottomNavItemWidget(
//                       icon: Icons.notifications_rounded,
//                       index: 3,
//                       label: 'Notifications',
//                       selectedIndex:
//                           (state is SuccessState) ? state.selectedIndex : 0,
//                       onTap:
//                           (index) => context.read<NavigationBloc>().add(
//                             PageTappedEvent(index),
//                           ),
//                     ),
//                     BottomNavItemWidget(
//                       icon: Icons.person_sharp,
//                       index: 4,
//                       label: 'Profile',
//                       selectedIndex:
//                           (state is SuccessState) ? state.selectedIndex : 0,
//                       onTap:
//                           (index) => context.read<NavigationBloc>().add(
//                             PageTappedEvent(index),
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



