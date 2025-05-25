import 'package:flutter/material.dart';
import 'package:recipes_app/core/extensions/navigation/navigation.dart';
import 'package:recipes_app/core/text/app_text.dart';
import 'package:recipes_app/core/widget/custom_elevated_button.dart';
import 'package:recipes_app/features/auth/pages/login_page.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';

class OnboardingController extends StatelessWidget {
  const OnboardingController({super.key});

  @override
  Widget build(BuildContext context) {
    
    final content = AppText.onboardingContent;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: context.getShortest(per: 1)),
            child: Column(
              children: [
                SizedBox(height: context.getShortest(per: 0.01),width: context.getWidth(),),

       
                SizedBox(
                  height: context.getHeight(per: 6.8), 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        content[0]['image']!,
                        height: context.getHeight(per: 5.5),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: context.getShortest(per: 0.08)),
                      Text(
                        content[0]['title']!,
                        style: TextStyle(fontSize: context.getShortest(per: 0.38), fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        content[0]['subtitle']!,
                        style: TextStyle(fontSize: context.getShortest(per: 0.28), color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: context.getShortest(per: 0.01)), 

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.getWidth(per: 0.19)),
                  child: CustomElevatedButton(
                    width: context.getShortest(per: 8),
                    height: context.getShortest(per: 1),
                    text: 'Get Started',
                    onPressed: () {
                      context.replacement(LoginPage());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
