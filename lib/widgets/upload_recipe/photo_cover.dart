import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:re/app_theming/app_colors.dart';
import 'package:re/utilities/screens/screen_sizes.dart';


class PhotoCover extends StatelessWidget {
  const PhotoCover({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      height: context.getHeight(multiplied: 0.2),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 3],
          strokeWidth: 2,
          radius: Radius.circular(16),
          color: AppColors.outlineColor,
        ),
        child: SizedBox(
          width: context.getWidth(),
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/upload_recipe/Image.svg'),

              Text('Add Cover Photo',style: Theme.of(context,).textTheme.displaySmall!.copyWith(color: AppColors.uploadSectionText),),

              Text('(up to 12 Mb)',style: Theme.of(context,).textTheme.displaySmall!.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
