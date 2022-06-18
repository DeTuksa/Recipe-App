import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static const primarySwatch = MaterialColor(0xff058762, <int, Color> {
    50: Color(0xFFEE8B8B),
    100: Color(0xFFE86565),
    200: Color(0xFFE23E3E),
    300: Color(0xFFCB3838),
    400: Color(0xFFB53232),
    500: Color(0xFF9E2B2B),
    600: Color(0xFF882525),
    700: Color(0xFF711F1F),
  });

  static const primaryRed = Color(0xFFE23E3E);
  static const appGrey6 = Color(0xFFF2F2F7);
  static const notificationBackground = Color(0xFFF1F1F1);
  static const notificationIcon = Color(0xFF31B057);
  static const iconBackground = Color(0xFFCEECD7);
  static const notificationText = Color(0XFFA9A9A9);

  static const fontFamily = 'Poppins';

  static ThemeData theme = ThemeData(
    primarySwatch: primarySwatch,
    fontFamily: fontFamily
  );
}