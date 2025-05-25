import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHomeContain extends StatefulWidget {
  const CustomHomeContain({
    super.key,
    required this.title,
    required this.discrib,
    required this.imagePath,
  });

  final String title;
  final String discrib;
  final String imagePath;

  @override
  State<CustomHomeContain> createState() => _CustomHomeContainState();
}

class _CustomHomeContainState extends State<CustomHomeContain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 216.0),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(24),
                child: Image.asset(
                  "assets/images/salad.png",
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 300.0),
          child: Column(
            children: [
              Text(
                "Salad",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E5481),
                ),
              ),
              Text(
                "Food",
                style: TextStyle(fontSize: 12, color: Color(0xFF3E5481)),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 135, top: 40.0),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(81, 255, 255, 255),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.heart,
                // size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
