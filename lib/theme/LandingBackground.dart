import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingBackground extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    gradientTop(canvas, height, width);
    gradientBottom(canvas, height, width);
  }

  void gradientTop(Canvas canvas, final height, final width){
    Path splashPath2 = Path()
      ..moveTo(width, 0)
      ..quadraticBezierTo(
        width * .10, 0, width * 0.55, 0
      )
      ..quadraticBezierTo(
        width * .40, height * .1, width, height * .30
      );

    final tracePaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(500, 200),
        <Color>[
          Colors.blue.shade200,
          Colors.greenAccent.shade400,
        ],
        [
          0.5,
          1.0,
        ],
      );
    canvas.drawPath(splashPath2, tracePaint);
  }

  void gradientBottom(Canvas canvas, final height, final width){
    Path splashPath = Path()
      ..moveTo(0, height * 0.7)
      ..quadraticBezierTo(
          width * .45, height * .75, width * 0.35, height * 1
      )
      ..quadraticBezierTo(
          0, height * 1, width * 0, height
      );

    final shaderPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(450, 520),
        <Color>[
          Colors.greenAccent.shade400,
          Colors.blue.shade400
        ],
        [
          0.6,
          1.0
        ]
      );
    canvas.drawPath(splashPath, shaderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}