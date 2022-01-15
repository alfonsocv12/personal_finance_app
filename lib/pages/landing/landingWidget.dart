import 'package:flutter/material.dart';
import 'package:personal_finance_app/components/navBar.dart';
import 'package:personal_finance_app/Global.dart';

Widget getLandingWidget(cls, BuildContext context) {
  return Scaffold(
    body: Center(child: Stack(children: <Widget>[
      Card(
        child: Column(children: const <Widget>[
          Text(
            'School debt', 
            style: TextStyle(
              fontSize: 40
            ),
          ),
        ])
      )
    ])),
    bottomNavigationBar: navBar.getNavBar(cls, context, 0),
  );
}