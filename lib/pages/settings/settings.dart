import 'package:flutter/material.dart';
import 'package:personal_finance_app/pages/settings/settingsWidget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return settingsWidget(this, context);
  }
}