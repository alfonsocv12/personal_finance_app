import 'package:flutter/material.dart';
import 'package:personal_finance_app/components/navBar.dart';
import 'package:personal_finance_app/theme/baseTheme.dart';

Widget getLandingWidget(cls, BuildContext context) {
  return Scaffold(
    body: Center(child: Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: BaseTheme.cardBgLight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'School debt',
                    style: TextStyle(fontSize: 30),
                  ),
                ]
              ),
            )
          )
        ),
      )
    ])),
    bottomNavigationBar: navBar.getNavBar(cls, context, 0),
  );
}