import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/data/recipes_data.dart';
import 'package:recipes_app/screen/bottom_navigation_screen.dart';
import 'package:recipes_app/screen/home/bloc/home_bloc.dart';
import 'package:recipes_app/theme/app_colors.dart';

class RecipesCard extends StatelessWidget {
  final String profileImg;
  final String name;
  final String img;
  final String title;
  final String isFavorite;
  final int id;

  const RecipesCard({
    super.key,
    required this.profileImg,
    required this.name,
    required this.img,
    required this.title,
    required this.isFavorite,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(left: 24, bottom: 30),
            width: 155,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Image.asset(profileImg),
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.mainText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Stack(
                  children: [
                    Image.asset(img),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: InkWell(
                            onTap: () {
                              RecipesData.add(id);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder:
                                      (context) => BottomNavigationScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                color:
                                    isFavorite == "false"
                                        ? Colors.white
                                        : Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: AppColors.mainText,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Food •  >60 mins",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff9FA5C0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
