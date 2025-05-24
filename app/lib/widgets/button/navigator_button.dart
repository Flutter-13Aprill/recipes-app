import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  NavigatorButton({
    super.key,
    required this.page,
    required this.title,
    Null Function()? onPressed,
  });
  final String title; // Text shown on the button

  final Widget page; // The destination page to navigate to

  Null Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // Navigates to the given `page` when pressed
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        // Padding inside the button (top only)
        padding: EdgeInsets.only(top: 16),
        margin: EdgeInsets.only(top: 24), // Outer margin (top spacing)
        // Button width & height based on screen height
        width: context.getWight(),
        height: context.getHight() * .09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Color(0xff1FCC79), // Rounded green background
        ),
        child: Text(
          textAlign: TextAlign.center,
          title, // Button text styling

          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
