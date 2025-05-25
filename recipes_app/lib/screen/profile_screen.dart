import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/theme/app_colors.dart';
import 'package:recipes_app/widget/profile/card/likes_container.dart';
import 'package:recipes_app/widget/profile/card/recipes_container.dart';
import 'package:recipes_app/widget/profile/profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          ProfileInfo(),
          SizedBox(height: 24),
          Container(
            height: 8,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffF4F5F7),
          ),
          SizedBox(height: 10),
          TabBar(
            padding: EdgeInsets.only(bottom: 20),
            indicatorColor: AppColors.primary,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: Text(
                  "Recipes",
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
                  "Liked",
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
            child: TabBarView(children: [RecipesContainer(), LikesContainer()]),
          ),
        ],
      ),
    );
  }
}
