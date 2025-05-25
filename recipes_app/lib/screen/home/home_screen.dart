import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/theme/app_colors.dart';
import 'package:recipes_app/widget/home/card/card_container.dart';
import 'package:recipes_app/widget/home/category_widget.dart';
import 'package:recipes_app/widget/home/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18),
          SearchWidget(),
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Category",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Color(0xff3E5481),
              ),
            ),
          ),
          SizedBox(height: 16),

          CategoryWidget(),
          SizedBox(height: 23),
          Container(
            height: 8,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffF4F5F7),
          ),
          TabBar(
            padding: EdgeInsets.only(bottom: 20),
            indicatorColor: AppColors.primary,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 10,
                ),
                child: Text(
                  "Left",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff3E5481),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 10,
                ),
                child: Text(
                  "Right",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff3E5481),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(children: [CardContainer(), CardContainer()]),
          ),
        ],
      ),
    );
  }
}
