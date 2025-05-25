import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';

//password package

final FancyPasswordController _passwordController = FancyPasswordController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400,
              child: FancyPasswordField(
                passwordController: _passwordController,
                validationRules: {
                  DigitValidationRule(),
                  UppercaseValidationRule(),
                },
                validator: (value) {
                  return _passwordController.areAllRulesValidated
                      ? null
                      : 'Not Validated';
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
