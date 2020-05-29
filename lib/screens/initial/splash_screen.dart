import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:screens/screens.dart';
import 'package:wepody/helpers/navigator_helper.dart';
import 'package:wepody/models/config_model.dart';
import 'package:wepody/screens/initial/block_screen.dart';
import 'package:wepody/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final configStore = GetIt.I<ConfigModel>();
  final navigatorHelper = GetIt.I<NavigatorHelper>();

  @override
  initState() {
    Future.delayed(Duration(seconds: 2), handleBlock);
    super.initState();
  }

  handleBlock() => !configStore.isUpdated
      ? navigatorHelper.pushReplacement(BlockScreen())
      : navigatorHelper.pushReplacement(LoginScreen());

  @override
  Widget build(BuildContext context) {
    return GetIt.I<Screens>().widget(
      showAppBar: false,
      isAccent: true,
      isStatic: true,
      backgroundColor: Colors.purple,
      child: Center(
        child: Icon(
          Icons.battery_alert,
          color: Colors.white,
          size: 70,
        ),
      ),
    );
  }
}
