import 'package:flutter/material.dart';
import 'package:personal_finance_app/theme/LandingBackground.dart';

Widget getLoginWidget(
  cls, BuildContext context, Widget selectedForm
) {
  return  Scaffold(
    body: Stack(children: <Widget>[
      SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: CustomPaint(
            painter: LandingBackground(),
            child: Container(
              height: MediaQuery.of(context).size.height,
            )),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: selectedForm
      )
    ])
  );
}