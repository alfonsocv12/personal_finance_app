import 'package:flutter/material.dart';
import 'package:personal_finance_app/theme/buttons.dart';

class LoginForm{

  final Map<String, TextEditingController> signInTexts = {
    'email': TextEditingController(text: ''),
    'password': TextEditingController(text: '')
  };

  void dispose() {
    signInTexts.forEach((key, value) {
      value.dispose();
    });
  }

  Widget getLoginForm(cls, context) {
    
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(80, 80, 80, 70),
              child: const Text('Pfinance',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 40))),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: signInTexts['email'],
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                controller: signInTexts['password'],
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              )),
          Buttons.btnLink(
              text: 'Forgot Password',
              onPressed: cls.forgotPasswordPressed,
              color: 'secundary'),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Buttons.btn(text: 'Login', onPressed: cls.loginPressed),
          ),
          Row(
            children: <Widget>[
              const Text('Does not have account?'),
              Buttons.btnLink(
                  text: 'Sign up',
                  onPressed: cls.signUpPressed,
                  color: 'primary',
                  fontSize: 20)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ]);
  }

}