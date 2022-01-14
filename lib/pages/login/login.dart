import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/pages/login/loginForm/loginForm.dart';
import 'package:personal_finance_app/services/auth.dart';
import 'loginWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {

  bool login = true;
  final LoginForm _loginForm = LoginForm();

  @override
  void dispose() {
    _loginForm.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getLoginWidget(
      this, context, selectForm(context)
    );
  }

  Widget selectForm(BuildContext context) {
    return _loginForm.getLoginForm(this, context);
  }

  void forgotPasswordPressed() {
    debugPrint('Forgot password pressed');
  }

  void loginPressed() async {
    StreamedResponse streamedResponse = await AuthService.login(
      _loginForm.signInTexts['email']!.text,
      _loginForm.signInTexts['password']!.text
    );

    if(streamedResponse.statusCode == 200) {
      var resp = json.decode(
        await streamedResponse.stream.bytesToString()
      );

      Global.localStorage.setString('token', resp['access_token']);
      Global.localStorage.setString('exp', resp['exp']);
    } else {

    }
  }

  void signUpPressed() {
    login = false;
  }
}