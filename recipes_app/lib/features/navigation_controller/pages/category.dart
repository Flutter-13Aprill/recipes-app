import 'package:flutter/material.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';
import 'package:recipes_app/core/theme/app_palette.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.label,});
final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppPalette.green, borderRadius: BorderRadius.all(Radius.circular(context.getShortest(per: 1)))),
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.5),vertical:context.getShortest(per: 0.30) ),
        child: Text(label,style: TextStyle(color: AppPalette.whiteColor,),
      ),
     
    ));
  }
}
