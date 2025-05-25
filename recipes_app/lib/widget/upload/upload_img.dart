import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadImg extends StatelessWidget {
  const UploadImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 161,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Color(0xffD0DBEA)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              SizedBox(height: 17),
              Image.asset("images/Image.png"),
              SizedBox(height: 16),

              Text(
                "Add Cover Photo",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xff3E5481),
                ),
              ),
              Text(
                "(up to 12 Mb)",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff9FA5C0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
