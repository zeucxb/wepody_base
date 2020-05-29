import 'package:flutter/material.dart';

import 'package:wepody/screens/initial/initial_screen.dart';
import 'package:wepody/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SetUp().init();

  runApp(InitialScreen());
}
