import 'dart:io';

import 'package:easy_i18n/easy_i18n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:screens/screens.dart';

class BlockScreen extends StatelessWidget {
  final easyI18n = GetIt.I<EasyI18n>();

  @override
  Widget build(BuildContext context) {
    final store = Platform.isIOS ? 'App Store' : 'Google Play';

    return GetIt.I<Screens>().widget(
      statusBarBrightness: Brightness.dark,
      backgroundColor: Colors.red,
      isStatic: true,
      child: Center(
        child: Text(
          easyI18n.populate(easyI18n.trans('block_message'), {'store': store}),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
