import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/bloc/recipes_bloc.dart';
import 'package:recipes/screens/main_navigation.dart';
import 'package:recipes/widget/button_one.dart';
import 'package:recipes/widget/textfield_widget.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController Passwordcontroler = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<RecipesBloc>();
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Text(
                          "Welcome !",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Please enter your account here",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 30),
                      Form(
                        key: GlobalKey(),
                        child: Column(
                          children: [
                            TextfieldWidget(
                              hintText: "Email or phone number",
                              controller: emailcontroler,
                              iconprefix: Icons.mail_outline,
                            ),
                            SizedBox(height: 30),

                            BlocBuilder<RecipesBloc, RecipesState>(
                              builder: (context, state) {
                                bool isobscure = false;
                                if (state is visavilstate) {
                                  isobscure = state.obscureText;
                                }
                                return TextfieldWidget(
                                  hintText: "Password",
                                  obscureText: isobscure,
                                  controller: Passwordcontroler,
                                  iconprefix: Icons.lock_outline_rounded,
                                  iconsuffix: IconButton(
                                    onPressed: () {
                                      bloc.add(
                                        passwordvisibility(
                                          isobscure: isobscure,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      isobscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  onchange: (value) {
                                    bloc.add(passwordchange(password: value));
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 30),

                            Container(
                              alignment: Alignment.topLeft,
                              child: Text("Your Password must contain:"),
                            ),
                            SizedBox(height: 20),

                            BlocBuilder<RecipesBloc, RecipesState>(
                              builder: (context, state) {
                                if (state is Passwordvalidatestate) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            state.hasminlength
                                                ? Icons.check_circle
                                                : Icons.circle_outlined,
                                            color:
                                                state.hasminlength
                                                    ? Colors.green
                                                    : Colors.grey,
                                          ),

                                          Text("At least 6 characters"),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            state.hasnumber
                                                ? Icons.check_circle
                                                : Icons.circle_outlined,
                                            color:
                                                state.hasnumber
                                                    ? Colors.green
                                                    : Colors.grey,
                                          ),
                                          Text("Contains a number"),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                            SizedBox(height: 30),
                            ButtonOne(
                              text: 'Sign Up',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => MainNavigationScreen(),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
