import 'package:flutter/material.dart';
import 'package:personal_finance_app/router.dart';

class NavBar {

  late BuildContext _context;
  dynamic cls;

  Map indexToRoute = {
    0: '/',
    1: '/settings'
  };

  void _onTab(int tabIndex) {
    cls.setState(() {
      cls.navBarIndex = tabIndex;
      routerClass.currentRoute = ModalRoute.of(_context)!.settings.name!;
      Navigator.pushNamedAndRemoveUntil(
        _context, indexToRoute[tabIndex], (route) => false
      );
      // Navigator.of(_context)R.pop();
    });
  }

  Widget getNavBar(cls, context) {
    this.cls = cls;
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
      currentIndex: cls.navBarIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onTab,
    );
  }
}