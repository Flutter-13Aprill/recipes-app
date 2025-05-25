import 'package:flutter/material.dart';
import 'package:recipes/screens/main_navigation.dart';
import 'package:recipes/widget/button_one.dart';
import 'package:recipes/widget/textfield_widget.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController Passwordcontroler = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Please enter your account here",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextfieldWidget(
                      hintText: "Email or phone number",
                      controller: emailcontroler,
                      iconprefix: Icons.mail_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),

                    TextfieldWidget(
                      hintText: "Password",
                      controller: Passwordcontroler,
                      iconprefix: Icons.lock_outline_rounded,
                      iconsuffix: Icon(Icons.visibility),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.topRight,
                      child: Text("Forgot password?"),
                    ),
                    SizedBox(height: 50),
                    ButtonOne(
                      text: 'Login',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainNavigationScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
