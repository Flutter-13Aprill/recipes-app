import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
// A custom widget to display a category label inside a styled container

class CategoryContaner extends StatelessWidget {
  CategoryContaner({
    super.key,
    required this.title,
    required this.backgrouncolor,
    required this.titelColor,
  });
  //  Color color = Color(0xff1FCC79);
  final Color backgrouncolor; // Background color of the container
  final Color titelColor; // Text color of the title
  final String title; // The category title to display
  double cotainerWidth =
      0; // Container width will be set based on title condition

  @override
  Widget build(BuildContext context) {
    if (title == "All") {
      // Set container width based on whether the category is "All"
      cotainerWidth = context.getWight() * .25;
    } else {
      cotainerWidth = context.getWight() * .3;
    }
    return Container(
      //give syle accourdng to it 
      padding: EdgeInsets.only(left: 36, top: 16),
      margin: EdgeInsets.only(left: 16),
      width: cotainerWidth,
      height: context.getHight() * .07,
      decoration: BoxDecoration(
        color: backgrouncolor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        title,//dispal text 
        style: TextStyle(
          color: titelColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
