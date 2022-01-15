import 'package:flutter/material.dart';
import 'package:personal_finance_app/components/navBar.dart';
import 'package:personal_finance_app/Global.dart';

Widget getLandingWidget(cls, BuildContext context) {
  return Scaffold(
    body: Center(child: Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(Global.localStorage.getString('token')!),
      )
    ])),
    bottomNavigationBar: navBar.getNavBar(cls, context, 1),
  );
}