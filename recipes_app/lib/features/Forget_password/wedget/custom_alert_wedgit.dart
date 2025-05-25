import 'package:flutter/material.dart';
import 'package:recipes_app/core/extensions/navigation/navigation.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:recipes_app/features/auth/pages/login_page.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.title, required this.bodyText, required this.buttonText});
final String title;
final String bodyText;
final String buttonText;
  @override
  Widget build(BuildContext context) {

    return Theme(
  data: Theme.of(context).copyWith(
    textTheme: Theme.of(context).textTheme,
  ),
  child: AlertDialog(
                backgroundColor: Color.fromARGB(255, 37, 40, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                title: Text(
                  title,
                  
                  style: TextStyle(color: AppPalette.whiteColor)
                ),
                content: Text(
                  bodyText,
                  style: TextStyle(color: AppPalette.whiteColor),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.replacement(LoginPage());
                    
                    },
                    child: Text(buttonText, style:TextStyle(color: AppPalette.whiteColor)),
                  ),
                ],
              ),
    );
  }
}
