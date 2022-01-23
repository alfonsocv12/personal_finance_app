import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_finance_app/components/navBar.dart';
import 'package:personal_finance_app/mixins/loggoutMixin.dart';

Widget settingsWidget(cls, BuildContext context) {
  return Scaffold(
    body: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 200),
            child: Column(
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Icon(
                    Icons.emoji_symbols,
                    size: 200
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(48, 15, 48, 0),
                  child: RichText(
                    text: const TextSpan(
                        text:
                            'This screen is under construction at this moment',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        )),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ElevatedButton(
                onPressed: () => loggout(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 70),
                  primary: Colors.red.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                )),
          )
        )
      ],
    ),
    bottomNavigationBar: navBar.getNavBar(cls, context, 1),
  );
}