import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/conestant.dart';
import 'package:recipes_app/core/extensions/navigation/navigation.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';
import 'package:recipes_app/features/onboarding/onboarding_controller.dart';
import 'package:recipes_app/features/splash/bloc/splash_bloc.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(StartSplashEvent()), 
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          
          if (state is MoveState) {
            context.replacement(OnboardingController());
          }
          
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.getWidth(per: 10),
                  height: context.getShortest(per: 8.5),
                  child: Image.asset("${iP}splash.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
