import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final Image avatar;

  UserModel({required this.name, required this.avatar});
}
// sample 
List<UserModel>users=[
  UserModel(name: "Calum Lewis", avatar: Image.asset(width:31 , height: 31,"assets/images/users/person1.png")),
  UserModel(name: "Eilif Sonas", avatar: Image.asset(width:31 , height: 31,"assets/images/users/person2.png")),
  UserModel(name: "Elena Shelby", avatar: Image.asset(width:31 , height: 31,"assets/images/users/person3.png")),
  UserModel(name: "John Priyadi", avatar: Image.asset(width:31 , height: 31,"assets/images/users/person4.png")),
];