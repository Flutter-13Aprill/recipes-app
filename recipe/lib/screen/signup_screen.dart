import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:recipe/screen/bottom_nav_bar.dart';
import 'package:recipe/screen/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final FancyPasswordController _passwordController =
        FancyPasswordController();

    return Scaffold(
      appBar: AppBar(toolbarHeight: 100, automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Welcome!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Please enter your account here",
              style: TextStyle(fontSize: 16, color: Color(0xFF9FA5C0)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                enabled: true,
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Color(0xFFF2F2F2),
                  prefixIcon: Icon(Icons.email),
                  hintText: "  Email or phone number",
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: SizedBox.shrink(),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),

                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                ),

                //  ),
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,

                child: FancyPasswordField(
                  passwordController: _passwordController,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "  Password",
                    hintStyle: TextStyle(color: Colors.grey),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),

                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                  ),
                  validationRules: {
                    DigitValidationRule(),
                    UppercaseValidationRule(),
                    LowercaseValidationRule(),
                    SpecialCharacterValidationRule(),
                    MinCharactersValidationRule(6),
                    MaxCharactersValidationRule(12),
                  },
                  strengthIndicatorBuilder:
                      (strength) => Text(strength.toString()),
                  validationRuleBuilder: (rules, value) {
                    if (value.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return ListView(
                      shrinkWrap: true,
                      children:
                          rules
                              .map(
                                (rule) =>
                                    rule.validate(value)
                                        ? Row(
                                          children: [
                                            const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              rule.name,
                                              style: const TextStyle(
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        )
                                        : Row(
                                          children: [
                                            const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              rule.name,
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                              )
                              .toList(),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 230.0),
              child: Text("Forgot Password?"),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1FCC79),
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    _passwordController.areAllRulesValidated) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                  );
                }
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),

            RichText(
              //to add two texts, one of them is clickable
              text: TextSpan(
                text: "You have an account already?",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 10, 104, 94),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "   Login",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 86, 142, 130),
                    ),

                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
