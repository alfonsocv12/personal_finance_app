import 'package:flutter/material.dart';
import 'package:personal_finance_app/Global.dart';

void loggout(BuildContext context) {
  Global.localStorage.remove('token');
  Navigator.pushReplacementNamed(context, '/auth');
}