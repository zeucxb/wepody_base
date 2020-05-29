import 'package:easy_i18n/easy_i18n.dart';
import 'package:easy_i18n/easy_i18n_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wepody/helpers/navigator_helper.dart';
import 'package:wepody/screens/initial/block_screen.dart';
import 'package:wepody/screens/initial/splash_screen.dart';
import 'package:wepody/screens/login/login_screen.dart';
import 'package:wepody/setup.dart';
import 'package:wepody/style/theme.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  // final authStore = GetIt.I<AuthStore>();
  final navigatorHelper = GetIt.I<NavigatorHelper>();
  final theme = GetIt.I<StyleTheme>();
  final easyI18nDelegate = EasyI18nDelegate(
    supportedLocales: [
      Locale('pt'),
      Locale('en'),
    ],
  );

  @override
  initState() {
    // reaction((_) => authStore.isLoggedIn, handleAuth);
    super.initState();
  }

  handleAuth(bool isLoggedIn) => isLoggedIn
      ? navigatorHelper.pushReplacement(BlockScreen())
      : navigatorHelper.pushReplacement(LoginScreen());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: easyI18nDelegate.localizationsDelegates,
      supportedLocales: easyI18nDelegate.supportedLocales,
      localeResolutionCallback: easyI18nDelegate.localeResolutionCallback,
      theme: theme.theme(),
      darkTheme: theme.darkTheme,
      themeMode: ThemeMode.system,
      navigatorKey: navigatorHelper.navigatorKey,
      home: Builder(builder: (BuildContext context) {
        try {
          GetIt.I<EasyI18n>();
        } catch (_) {
          SetUp.resgisterI18n(EasyI18n.of(context));
        }

        return SplashScreen();
      }),
    );
  }
}
