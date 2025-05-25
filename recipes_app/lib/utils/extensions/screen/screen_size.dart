import 'package:flutter/material.dart';

extension ScreenSize on BuildContext{
  getHeight ({double factor=1}){
    return MediaQuery.sizeOf(this).height*factor;

  }

  getWidth({double factor=1}){
    return MediaQuery.sizeOf(this).width*factor;
  }
}