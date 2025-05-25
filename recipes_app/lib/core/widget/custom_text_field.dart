import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:recipes_app/core/widget/bloc/focus_bloc.dart';
import 'package:recipes_app/core/widget/password_bloc/password_bloc.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.controllers,
    this.condition,
    this.isPassword = false,
    required this.lefticon, required this.hint,
  });

  final String text;
  final TextEditingController controllers;
  final FormFieldValidator<String>? condition;
  final bool isPassword;
  final IconData lefticon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FocusBloc(),
      child: Builder(
        builder: (context) {
          final focusBloc = context.read<FocusBloc>();

          return Padding(
            padding: EdgeInsets.symmetric(vertical: context.getShortest(per: 0.2)),
            child: BlocBuilder<FocusBloc, FocusState>(
              builder: (context, focusState) {
                final isFocused = focusState is Focused;

                return Container(
                  width: context.getShortest(per: 9),
                  height: context.getShortest(per: 1.5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isFocused ? AppPalette.lightGreen : AppPalette.greylight,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.getShortest(per: 1)),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.5)),
                    child: Row(
                      children: [
                        Icon(lefticon, color: AppPalette.greydark),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.2)),
                            child: Focus(
                              onFocusChange: (hasFocus) {
                               hasFocus ? focusBloc.add(FocusIn()): focusBloc.add(FocusOut());
                              },
                              child: isPassword
                                  ? BlocBuilder<PasswordShowBloc, PasswordState>(
                                      builder: (context, state) {
                                        final obscure = state is PasswordHidden;
                                        return TextFormField(
                                          
                                          controller: controllers,
                                          obscureText: obscure,
                                          decoration: InputDecoration( 
                                            hintText: hint,
                                            border: InputBorder.none,
                                          ),
                                          validator: condition,
                                        );
                                      },
                                    )
                                  : TextFormField(
                                      controller: controllers,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: hint
                                      ),
                                      validator: condition,
                                    ),
                            ),
                          ),
                        ),
                        isPassword
                            ? BlocBuilder<PasswordShowBloc, PasswordState>(
                                builder: (context, state) {
                                  final isHidden = state is PasswordHidden;
                                  return IconButton(
                                    icon: Icon(
                                      isHidden
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: AppPalette.grey,
                                    ),
                                    onPressed: () {
                                      context.read<PasswordShowBloc>().add(TogglePasswordShow());
                                    },
                                  );
                                },
                              )
                            : const SizedBox(width: 1),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
