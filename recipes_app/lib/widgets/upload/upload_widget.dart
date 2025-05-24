import 'package:flutter/material.dart';
import 'package:recipes_app/extensions/screen_size.dart';
import 'package:widgets_easier/widgets_easier.dart';

class UploadWidget extends StatelessWidget {
  const UploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 150,
        width: context.getWight(),
        decoration: ShapeDecoration(
          shape: DashedBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(width: 54, height: 54, "assets/images/icons/Image.png"),
            Text('Add Cover Photo'),
            Text('(up to 12 Mb)'),
          ],
        ),
      ),
    );
  }
}
