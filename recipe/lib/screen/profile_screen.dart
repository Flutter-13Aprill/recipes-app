import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  static String title = '';
  static String? imagePath;
  static String descrption = '';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,

        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 340.0),
              child: Icon(Icons.share),
            ),
            Image.asset("assets/images/Avatar.png"),
            SizedBox(height: 16),
            Text(
              'Choirul Syafril',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 56),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        " 32     ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Recipes    ", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 90),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "782    ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Following    ", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 90),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "1,287   ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Followers   ", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 90),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (imagePath != null)
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(24),
                    //  BorderRadius.circular(32),
                    child: Image.file(
                      File(imagePath!),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
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
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E5481),
                ),
              ),
              Text(
                descrption + " >60 mins",
                style: TextStyle(fontSize: 12, color: Color(0xFF3E5481)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
