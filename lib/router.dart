import 'package:flutter/material.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/pages/login/login.dart';
import 'package:personal_finance_app/pages/settings/settings.dart';

// class Router {
//   void tokenMiddleWear(BuildContext context) {
//     String? token = Global.localStorage.getString('token');
//     if (token == null) {
//       Navigator.pop(context);
//       Navigator.pushReplacementNamed(context, '/auth');
//     }
//   }

//   Map<String, Widget Function(BuildContext)> routes(context) {
//     return {
//       '/auth': (context) => const LoginScreen(),
//       '/settings': (context) {
//         tokenMiddleWear(context);
//         return const SettingsScreen();
//       }
//     };
//   }
// }

class FinalRouter {
  late String currentRoute;

  Route<dynamic>? build(settings) {
    if (settings.name != currentRoute) {
      debugPrint(settings.toString());
      var route = _routes[settings.name];
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, __, ___) => route(context),
        transitionsBuilder: (context, animation, __, child) {
          // const begin = Offset(0.0, 1.0);
          // const end = Offset.zero;
          // const curve = Curves.ease;
          // var tween =
          //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          // return SlideTransition(
          //   position: animation.drive(tween),
          //   child: child,
          // );
          return child;
        }
      );
    }
  }

  final Map _routes = {
    '/auth': (context) => const LoginScreen(),
    '/settings': (context) => const SettingsScreen()
  };


  void add(key, value) {
    _routes[key] = value;
  }
}

FinalRouter routerClass = FinalRouter();