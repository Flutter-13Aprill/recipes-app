import 'package:flutter/material.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';


class FloatActionButton extends StatelessWidget {
  const FloatActionButton({super.key, required this.containerColor, required this.icon, required this.iconColor});
  final Color containerColor;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              height: context.getShortest(per: 0.70),
                              width: context.getShortest(per: 1.90),
                            ),
                            Positioned(
                              bottom: context.getShortest(per: 0.20),
                              right: 0,
                              left: 0,
                              child: Container(
                                clipBehavior: Clip.none,
                                width: context.getShortest(per: 1.44),
                                height: context.getShortest(per: 1.44),
                                decoration: BoxDecoration(
                                  color: containerColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: context.getShortest(per: 0.65),
                              left: 0,
                              right: 0,
                              child: Icon(icon,color: iconColor,),
                            ),
                          ],
                        );
  }
}