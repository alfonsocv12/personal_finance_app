import 'package:flutter/material.dart';

class BaseTheme {

  static Color primarySwatch = Colors.blue;
  static Color primaryColor = Colors.blue.shade300;
  static Color secundaryColor = Colors.blueGrey.shade400;
  static Color primaryColorText = Colors.white;

  static Color cardBgLight = Colors.blueGrey.shade100;

  static Color navBarBgLight = Colors.blueGrey.shade100;

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