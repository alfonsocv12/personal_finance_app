import 'package:flutter/material.dart';
import 'package:personal_finance_app/router.dart';

class BasePage extends StatelessWidget {
  const BasePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getCurrentRoute(context);
    return const Scaffold(
      
    );
  }

  Future<void> _getCurrentRoute(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (routerObject.tokenMiddleWear(context)) {
        routerObject.pushRemove(context, '/home');
      }
    });
  }
}