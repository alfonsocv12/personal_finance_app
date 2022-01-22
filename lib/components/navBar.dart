import 'package:flutter/material.dart';
import 'package:personal_finance_app/theme/RouteAnimation.dart';
import 'package:personal_finance_app/router.dart';
import 'package:personal_finance_app/theme/baseTheme.dart';

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

    return Container(
      decoration: const BoxDecoration(
        boxShadow:  [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2
          )
        ]
      ),
      child: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            activeIcon: Icon(Icons.settings),
          )
        ],
        currentIndex: tabIndex,
        selectedItemColor: Colors.blueGrey.shade500,
        onTap: _onTab,
      ),
    );
  }
}

NavBar navBar = NavBar();