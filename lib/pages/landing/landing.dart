import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/models/schoolDebtDashboard.dart';
import 'package:personal_finance_app/pages/landing/landingWidget.dart';
import 'package:personal_finance_app/services/school.dart';
import 'package:personal_finance_app/state/schoolDebt.dart';

class DebugClass {
  int statusCode = 200;
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State<LandingScreen> with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    _checkIfToken();
    _getDebtData();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getLandingWidget(this, context);
  }

  Future<void> _getDebtData() async {
    debugPrint('here');
    if (schoolDebtState.schoolDebt == null) {
      debugPrint('here');
      Response resp = await SchoolService.getSchoolDebt();
      // var resp = DebugClass();
      if (resp.statusCode == 200) {
        schoolDebtState.schoolDebt = schoolDebtDashboard(
          json.decode(resp.body.toString())
        );
      }
    }
  }

  void _checkIfToken() {
    String? token = Global.localStorage.getString('token');
    if(token == null) {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }
}