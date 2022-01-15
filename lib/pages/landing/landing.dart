import 'package:flutter/material.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/pages/landing/landingWidget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State<LandingScreen> {

  @override
  Widget build(BuildContext context) {
    _checkIfToken();

    return getLandingWidget(this, context);
  }

  void _checkIfToken() {
    String? token = Global.localStorage.getString('token');
    if(token == null) {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }
}