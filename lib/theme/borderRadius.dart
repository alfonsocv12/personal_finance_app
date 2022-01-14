import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderRadiusDecorators {
  RoundedRectangleBorder borderRadiusRaisedButton(parentColor) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: BorderSide(
          color: parentColor
      )
    );
  }
}