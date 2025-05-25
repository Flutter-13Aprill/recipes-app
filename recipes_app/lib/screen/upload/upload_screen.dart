import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/theme/app_colors.dart';
import 'package:recipes_app/widget/upload/upload_form.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: Color(0xffFF6464),
                        ),
                      ),
                    ),
                    Text(
                      "1/2",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: AppColors.mainText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                UploadForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
