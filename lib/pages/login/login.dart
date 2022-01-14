import 'package:flutter/material.dart';
import 'loginWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  String whoIAm = 'login state';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getLoginWidget(this, context);
  }
}