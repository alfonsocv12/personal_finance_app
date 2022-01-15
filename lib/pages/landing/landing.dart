import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/pages/landing/landingWidget.dart';
import 'package:personal_finance_app/services/school.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State<LandingScreen> {

  @override
  Widget build(BuildContext context) {
    _checkIfToken();
    _getDebtData();
    return getLandingWidget(this, context);
  }

  Future<void> _getDebtData() async {
    var resp = await SchoolService.getSchoolDebt();
    debugPrint(resp.body.toString());
  }

  void _checkIfToken() {
    String? token = Global.localStorage.getString('token');
    if(token == null) {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }
}