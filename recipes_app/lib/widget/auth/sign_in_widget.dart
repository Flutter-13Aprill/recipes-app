import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/screen/bottom_navigation_screen.dart';
import 'package:recipes_app/theme/app_colors.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "eamil is empty";
                } else if (!value.contains(
                  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$'),
                )) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Email or phone number",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0xff9FA5C0),
                ),
                contentPadding: EdgeInsets.all(3),
                prefixIcon: Icon(
                  Icons.mark_email_unread_outlined,
                  color: AppColors.mainText,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD0DBEA)),
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is Empty";
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters long. Please try again";
                } else if (!value.contains(RegExp(r'\d'))) {
                  return "not Contains a number";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0xff9FA5C0),
                ),
                contentPadding: EdgeInsets.all(3),
                prefixIcon: Icon(
                  Icons.lock_open_outlined,
                  color: AppColors.mainText,
                ),

                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color(0xff9FA5C0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD0DBEA)),
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              alignment: Alignment.centerRight,
              child: Text("Forgot password?", textAlign: TextAlign.right),
            ),
            SizedBox(height: 72),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationScreen(),
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 24),
                height: 56,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColors.primary,
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
