// lib/widgets/button/navigator_button.dart
import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title; // Button label text
  final VoidCallback?
  onPressed; // Optional function to execute when the button is pressed

  const LoginButton({Key? key, required this.title, this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Adds spacing above the button
      padding: EdgeInsets.only(top: 16),
      margin: EdgeInsets.only(
        top: 24,
        left: 16,
        right: 16,
      ), // Adds margin around the button

      width: context.getWight(), // Sets button width to match screen width
      height: context.getHight() * .09,

      // Button style: rounded corners and green background
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: Color(0xff1FCC79),
      ),

      // MaterialButton inside the styled container
      child: MaterialButton(
        onPressed: onPressed, // Executes the passed-in function if not null

        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
