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

  Widget selectedIconElipse({required Icon icon}) {
    return Container(
      width: 65,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: icon,
      ),
    );
  }

  Widget getNavBar(cls, context, tabIndex) {
    _context = context;

    return BottomNavigationBar(
      backgroundColor: Colors.blue.shade50,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      currentIndex: tabIndex,
      onTap: _onTab,
      items: [
        BottomNavigationBarItem(
          icon: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.home_outlined)
          ),
          label: 'Home',
          activeIcon: selectedIconElipse(
            icon: const Icon(Icons.home_filled)
          ),
        ),
        BottomNavigationBarItem(
          icon: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.settings_outlined)
          ),
          label: 'Settings',
          activeIcon: selectedIconElipse(
            icon: const Icon(Icons.settings)
          ),
        )
      ],
    );
  }
}

NavBar navBar = NavBar();