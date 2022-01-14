import 'package:flutter/material.dart';

class BaseTheme {

  static Color primarySwatch = Colors.blue;
  static Color primaryColor = Colors.blue.shade300;
  static Color secundaryColor = Colors.blueGrey.shade400;
  static Color primaryColorText = Colors.white;

  Color? operator[](attribute) {
    Color?  response;
    switch(attribute) {
      case "primaryColor":
      response = primaryColor;
      break;
      case "secundaryColor":
      response = secundaryColor;
      break;
      case "primaryColorText":
      response = primaryColorText;
      break;
    }
    return response;
  }
}