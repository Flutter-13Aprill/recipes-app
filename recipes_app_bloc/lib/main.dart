import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_bloc.dart';

import 'package:recipes_app_bloc/screens/onboardingscreens/on_boarding_screen.dart';
import 'package:recipes_app_bloc/screens/sign_in_screens/sign_in.dart';
import 'package:recipes_app_bloc/screens/upload_screens/bloc/upload_bloc.dart';
import 'package:recipes_app_bloc/widgets/nav_bar.dart';


void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UploadBloc()),
        BlocProvider(create: (_) => MyRecipesBloc()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {

const MyApp({super.key});



@override

Widget build(BuildContext context) {

return MaterialApp(

debugShowCheckedModeBanner: false,

initialRoute: '/',
routes: {
'/': (context) => OnBoardingScreen(),
'/signin': (context) => SignIn(),
'/home': (context) => NavBarScreen(),


},

);

}

}
