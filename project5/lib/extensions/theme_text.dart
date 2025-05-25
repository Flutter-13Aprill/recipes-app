import 'package:flutter/material.dart';
// import 'package:project5/theme/project_theme.dart';

extension ThemeText on BuildContext{


  TextStyle? titleL(){

    return Theme.of(this).textTheme.titleLarge;

  }
  TextStyle? bodyM(){

    return Theme.of(this).textTheme.bodyMedium;

  }

  TextStyle? bodyS(){

    return Theme.of(this).textTheme.bodySmall;

  }

}