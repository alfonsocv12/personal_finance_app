import 'package:flutter/material.dart';
import 'package:personal_finance_app/theme/LandingBackground.dart';
import 'package:personal_finance_app/theme/borderRadius.dart';

Widget getLoginWidget(cls, context) {
  debugPrint(cls.whoIAm);

  return  Scaffold(
    body: Stack(children: <Widget>[
      SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: CustomPaint(
            painter: LandingBackground(),
            child: Container(
              height: MediaQuery.of(context).size.height,
            )),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ListView(
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
                    child: const TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: const TextField(
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    )),
                FlatButton(
                    onPressed: null,
                    textColor: Colors.blueGrey.shade400,
                    child: const Text('Forgot password')),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: RaisedButton(
                      shape: BorderRadiusDecorators()
                          .borderRadiusRaisedButton(Colors.blue.shade300),
                      textColor: Colors.white,
                      color: Colors.blue.shade300,
                      child: const Text('Login'),
                      onPressed: () async {
                        var error = false;
                        // setState(() {
                        //   // signInTexts.forEach((key, value) {
                        //   //   if(value.text.isEmpty){
                        //   //     signInValidate[key] = true;
                        //   //     error = true;
                        //   //   }else{
                        //   //     signInValidate[key] = false;
                        //   //   }
                        //   // });
                        // });
                        if (!error) {
                          // await _login.login(
                          //     context, signInTexts
                          // );
                        }
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.blue.shade300,
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        // setState(() {
                        //   signInTexts = _defaultSignInText();
                        //   signInValidate = _defaultSignInValidate();
                        //   selectedWidgetMarker = WidgetMarker.signUp;
                        // });
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ]))
    ])
  );
}