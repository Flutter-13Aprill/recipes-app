import 'package:flutter/material.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/widgets/mainButton_widget.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext contextDialog) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/icons/happy.png"),
          Text(
            "Upload Success",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Your recipe has been uploaded,\nyou can see it on your profile",
            style: TextStyle(
              color: AppColors.textHint,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          MainButtonWidget(
            onTap: () {
              Navigator.of(contextDialog).pop();
              // contextDialog.read<LayoutBloc>().add(ChangePage(index: 0));
            },
            text: "Back to Home",
          ),
        ],
      ),
    );
  }
}
