import 'package:flutter/material.dart';
import 'package:personal_finance_app/components/navBar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Settings'),),
      bottomNavigationBar: navBar.getNavBar(this, context, 1),
    );
  }
}