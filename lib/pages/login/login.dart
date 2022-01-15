import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/pages/login/loginForm/loginForm.dart';
import 'package:personal_finance_app/services/auth.dart';
import 'package:personal_finance_app/components/Dialogs.dart';
import 'loginWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {

  bool login = true;
  final LoginForm _loginForm = LoginForm();
  late BuildContext context;

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
    this.context = context;
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
    Dialogs.showLoadingDialog(context, GlobalKey<State>());
    StreamedResponse streamedResponse = await AuthService.login(
      _loginForm.signInTexts['email']!.text,
      _loginForm.signInTexts['password']!.text
    );
    Navigator.of(context).pop();

    var resp = json.decode(await streamedResponse.stream.bytesToString());
    if(streamedResponse.statusCode == 200) {
      Global.localStorage.setString('token', resp['access_token']);
      Global.localStorage.setString('exp', resp['exp']);
    } else {
      Dialogs.showAlertDialog(
        context,
        'Auth error ${streamedResponse.statusCode}',
        resp['detail'].toString()
      );
    }
  }

  void signUpPressed() {
    login = false;
  }
}