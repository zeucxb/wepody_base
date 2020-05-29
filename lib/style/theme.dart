import 'package:flutter/material.dart';
import 'package:wepody/style/color.dart';

class StyleTheme {
  final bool isDark;

  StyleTheme({this.isDark = false});

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: StyleColors.PRIMARY,
    accentColor: StyleColors.ACCENT,
  );

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: StyleColors.PRIMARY,
    accentColor: StyleColors.ACCENT,
  );

  theme() => isDark ? darkTheme : lightTheme;
}
