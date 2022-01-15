import 'package:personal_finance_app/mixins/routerMixin.dart';
import 'package:personal_finance_app/pages/landing/landing.dart';
import 'package:personal_finance_app/pages/login/login.dart';
import 'package:personal_finance_app/pages/settings/settings.dart';

Map routes = {
  '/auth': (context) => const LoginScreen(),
  '/settings': (context) => const SettingsScreen(),
  '/home': (context) => const LandingScreen()
};

RouterMixin routerObject = RouterMixin(routes);