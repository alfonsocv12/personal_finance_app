import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:personal_finance_app/pages/basePage.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/router.dart';

Future main() async{
  await dotenv.load();
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      home: const BasePage(),
      onGenerateRoute: (settings) => routerObject.onGenerateRoute(settings)
    );
  }
}