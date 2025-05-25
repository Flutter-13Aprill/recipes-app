import 'package:flutter/material.dart';
import 'package:recpie_app/theme/colors_app.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: ColorsApp.secondryText),
        fillColor: ColorsApp.fillColor,
        filled: true,
        prefixIcon: Icon(Icons.search, color: ColorsApp.mainText),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.fillColor),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
