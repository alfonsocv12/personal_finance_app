import 'package:flutter/material.dart';
import 'package:personal_finance_app/Global.dart';
import 'package:personal_finance_app/theme/RouteAnimation.dart';

class RouterMixin {
  final Map _routes;

  RouterMixin(this._routes);
  
  String? currentRoute;
  Function _animationCallback = routeAnimations.noAnimation;

  void pushRemove(
    BuildContext context, String routeName, navigationWidget
  ) {
    currentRoute = ModalRoute.of(context)!.settings.name!;
    animationCallback = navigationWidget;
    Navigator.pushNamedAndRemoveUntil(
      context, routeName, (route) => false
    );
  }

  Route<dynamic>? onGenerateRoute(settings) {
    if (currentRoute == null || settings.name != currentRoute) {
      Function route = _routes[settings.name];
      Function currentAnimation = animationCallback;

      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, __, ___) => route(context),
        transitionsBuilder: (context, animation, __, child)
          => child
      );
    }
  }

  Function get animationCallback {
    Function currentAnimation = _animationCallback;
    _animationCallback = routeAnimations.noAnimation;
    return currentAnimation;
  }

  set animationCallback(Function payload) {
    _animationCallback = payload;
  }

  void tokenMiddleWear(BuildContext context) {
    String? token = Global.localStorage.getString('token');
    if (token == null) {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }

  void add(key, value) {
    _routes[key] = value;
  }
}