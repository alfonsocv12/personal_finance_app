import 'package:flutter/material.dart';
import 'package:personal_finance_app/router.dart';

class BasePage extends StatelessWidget {
  const BasePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _selectRoute(context);
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.add_to_photos_outlined
        ),
      ),
    );
  }

  void _selectRoute(BuildContext context) {
    routerClass.tokenMiddleWear(context);
    
  }
}