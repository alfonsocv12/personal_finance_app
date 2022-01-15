import 'package:flutter/material.dart';
import 'package:personal_finance_app/router.dart';

class BasePage extends StatelessWidget {
  const BasePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getCurrentRoute(context);
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.add_to_photos_outlined
        ),
      ),
    );
  }

  Future<void> _getCurrentRoute(BuildContext context) async {
    routerObject.tokenMiddleWear(context);
    Navigator.pushNamedAndRemoveUntil(
      context, '/home', (route) => false
    );
  }
}