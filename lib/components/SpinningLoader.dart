import 'package:flutter/material.dart';

Widget spinningLoader(AnimationController controller) {

  return CircularProgressIndicator(
    value: controller.value ,
    semanticsLabel: 'Linear progress indicator',
  );
}