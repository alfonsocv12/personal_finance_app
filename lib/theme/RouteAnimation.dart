import 'package:flutter/material.dart';

class RouteAnimations {

  PageRouteBuilder _baseAnimation(settings, routeWidget, animationCallback) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, __, ___) => routeWidget(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child)
        => animationCallback(context, animation, secondaryAnimation, child)
    );
  }


  PageRouteBuilder fadeAnimation(
    BuildContext context, settings, routeWidget
  ) {
    // ignore: prefer_function_declarations_over_variables
    Function animation = (context, animation, sAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    };

    return _baseAnimation(settings, routeWidget, animation);
  }

  PageRouteBuilder noAnimation(BuildContext context, settings, routeWidget) {
    return _baseAnimation(
      settings, routeWidget, (_, __, ___, child) => child
    );
  }
}

RouteAnimations routeAnimations = RouteAnimations();