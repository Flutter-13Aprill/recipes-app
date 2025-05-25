import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:recipes_app/features/auth/pages/widget/bloc/checked_bloc.dart';

class CheckedRule extends StatelessWidget {
   const CheckedRule({
    super.key,
    required this.condtion,
    required this.text, required this.controller,
  });
  final String? Function(String?) condtion;
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) {
      final bloc = CheckedBloc();
      controller.addListener(() {
        bloc.add(CheckRuleEvent(controller, condtion));
      });
      return bloc..add(CheckRuleEvent(controller, condtion));
    },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.getShortest(per: 0.7),
        ),
        child: BlocBuilder<CheckedBloc, CheckedState>(
          builder: (context, state) {
            Color containerColor;
            Color iconColor;
            if(state is TrueState){
              containerColor = AppPalette.whiteGreen;
              iconColor = AppPalette.green;
            }else{
              containerColor = AppPalette.greylight;
              iconColor = AppPalette.greydark;
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: context.getShortest(per: 0.6),
                        height: context.getShortest(per: 0.6),
                        decoration: BoxDecoration(
                          color: containerColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Icon(
                        Icons.check_rounded,
                        size: context.getShortest(per: 0.57),
                        color: iconColor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.getShortest(per: 0.3),
                    ),
                    child: Text(text),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
