import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/pages/landing/landingWidget.dart';
import 'package:personal_finance_app/services/school.dart';
import 'package:personal_finance_app/state/schoolDebt.dart';

import 'package:device_apps/device_apps.dart';

class DebugClass {
  int statusCode = 200;
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State<LandingScreen> {
  final formatCurrency = NumberFormat("#,##0.00", "en_US");

  @override
  void initState() {
    _checkIfToken();
    _getDebtData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getLandingWidget(this, context);
  }

  Future<void> _getDebtData() async {
    if (schoolDebtState.schoolDebt == null) {
      Response resp = await SchoolService.getSchoolDebt();
      if (resp.statusCode == 200) {
        var data = json.decode(resp.body.toString());
        data['amount_number'] = data['amount'];
        data['amount'] = "\$${formatCurrency.format(double.tryParse(data['amount']))}";
        data['date'] = DateFormat("MMMM yy")
            .format(DateFormat("yyyy-MM-dd").parse(data['date']));
        setState(() {
          schoolDebtState.schoolDebt = data;
        });
      }
    }
  }

  void _checkIfToken() {
    String? token = Global.localStorage.getString('token');
    if (token == null) {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }

  Future<void> debtCardOntab(BuildContext context) async {
    Clipboard.setData(
        ClipboardData(text: schoolDebtState.schoolDebt!['amount_number']));
      
    bool bbvaInstalled =
        await DeviceApps.isAppInstalled('com.bancomer.mbanking');

    if (!bbvaInstalled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Amount copy to clipboard, default app not installed"),
      ));
    }

    DeviceApps.openApp('com.bancomer.mbanking');

    // AndroidIntent intent = const AndroidIntent(
    //     action: 'action_view',
    //     data: 'package:com.bancomer.mbanking');
    // await intent.launch();
  }
}
