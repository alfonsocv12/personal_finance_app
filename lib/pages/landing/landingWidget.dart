import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:personal_finance_app/components/SpinningLoader.dart';
import 'package:personal_finance_app/components/navBar.dart';
import 'package:personal_finance_app/models/schoolDebtDashboard.dart';
import 'package:personal_finance_app/state/schoolDebt.dart';
import 'package:personal_finance_app/theme/baseTheme.dart';

Widget getColumn(String title, String data) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        data,
        textScaleFactor: 1.8,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      Text(
        title,
        textScaleFactor: 1.8,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    ],
  );
}


Widget getSchoolDebtWidget(cls) {
  SchoolDebtDashboard? schoolDebt = schoolDebtState.schoolDebt;
  if (schoolDebt != null) {
    List<Map<String, String>> columns = [
      {
        'text': 'next month',
        'objectKey': 'nextPaymentPay'
      },
      {
        'text': 'amount',
        'objectKey': 'amountToPay'
      }
    ];
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for(Map column in columns)
          getColumn(column['text'], schoolDebt.getProp(column['objectKey'])!)
      ],
    );
  }

  return Center(
    child: spinningLoader,
  );
}

Widget getLandingWidget(cls, BuildContext context) {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'School debt',
            textScaleFactor: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              color: BaseTheme.cardBgPink,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: getSchoolDebtWidget(cls)
              )
            )
          ),
        )
     ]
    ),
    bottomNavigationBar: navBar.getNavBar(cls, context, 0),
  );
}