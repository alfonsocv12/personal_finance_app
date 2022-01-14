import 'package:flutter/material.dart';
import 'package:personal_finance_app/theme/borderRadius.dart';

import 'baseTheme.dart';

BaseTheme baseTheme = BaseTheme();
typedef VoidCallback = void Function();

class Buttons {

  static ElevatedButton btn({
      required String text,
      VoidCallback? onPressed,
      double fontSize = 14
  }) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: BaseTheme.primaryColor,
        shape: BorderRadiusDecorators().borderRadiusRaisedButton(
          BaseTheme.primaryColor
        )
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: BaseTheme.primaryColorText,
          fontSize: fontSize
        ),
      )
    );
  }

  static TextButton btnLink({
    required String text,
    VoidCallback? onPressed,
    String color = 'primary',
    double fontSize = 14
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text, style: TextStyle(
          color: baseTheme['${color}Color'],
          fontSize: fontSize
        ),
      )
    );
  }
}