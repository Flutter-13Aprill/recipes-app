import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class LineConatiner extends StatelessWidget {
  //class take varibles and init in constarctor 
  const LineConatiner({super.key ,this.color= Colors.black, this.size=.5, this.leftMargin=90,this.rigthMargin=90});
 final  Color color;
  final double size;
  final double leftMargin;
  final double rigthMargin;
  @override
  Widget build(BuildContext context) {
    return Container(
      //conatier with spapicic margin & width &alignment
      margin: EdgeInsets.only(left:leftMargin, right: rigthMargin),
      alignment: Alignment.center,
      width: context.getHight() * size,
      decoration: BoxDecoration(
        color:color,//color it 
        //make border rounded  nd give it color with size 
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 5),
      ),
    );
  }
}
