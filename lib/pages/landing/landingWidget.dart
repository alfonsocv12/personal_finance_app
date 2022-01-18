import 'package:flutter/material.dart';
import 'package:personal_finance_app/components/SpinningLoader.dart';
import 'package:personal_finance_app/components/navBar.dart';
import 'package:personal_finance_app/models/schoolDebtDashboard.dart';
import 'package:personal_finance_app/state/schoolDebt.dart';
import 'package:personal_finance_app/theme/baseTheme.dart';


Widget getSchoolDebtWidget(cls) {
  SchoolDebtDashboard? schoolDebt = schoolDebtState.schoolDebt;
  if (schoolDebt != null) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
              child: Row(
                children: [
                  const Text('Amount to pay: '),
                  Text(schoolDebt.amountToPay)
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: Row(
                  children: [
                    const Text('Amount paid: '),
                    Text(schoolDebt.amountPaid)
                  ],
                ),
              )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
              child: Row(
                children: [
                  const Text('next month: '),
                  Text(
                    schoolDebt.nextPaymentPay
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(5, 5, 0, 0),
              child: Row(
                children: [
                  const Text('total: '),
                  Text(schoolDebt.total)
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  return Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: spinningLoader(cls.controller),
    ),
  );
}

Widget getLandingWidget(cls, BuildContext context) {
  return Scaffold(
    body: Center(child: Stack(children: <Widget>[
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
            color: BaseTheme.cardBgLight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'School debt',
                    style: TextStyle(fontSize: 30),
                  ),
                  getSchoolDebtWidget(cls)
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