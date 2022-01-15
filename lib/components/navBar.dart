import 'package:flutter/material.dart';
import 'package:personal_finance_app/theme/RouteAnimation.dart';
import 'package:personal_finance_app/router.dart';

class NavBar {

  late BuildContext _context;

  Map indexToRoute = {
    0: '/home',
    1: '/settings'
  };

  void _onTab(int tabIndex) {
    routerObject.pushRemove(
      _context, indexToRoute[tabIndex], routeAnimations.noAnimation
    );
  }

  Widget getNavBar(cls, context, tabIndex) {
    _context = context;

    return BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings')
      ],
      currentIndex: tabIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onTab,
    );
  }
}

NavBar navBar = NavBar();