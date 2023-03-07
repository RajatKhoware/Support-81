import 'package:flutter/material.dart';

class AppTheme {
  //
  //? LIGHT THEME
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColorFFFFFF,
    primaryColor: blackColor242424,
    primaryColorLight: blackColor303030,
    primaryColorDark: whiteColorF5F5F5,
    dividerColor: greyColorE0E0E0,
    cardColor: whiteColorFFFFFF,
    shadowColor: grayColor8A959E,
    canvasColor: Colors.red,
    buttonColor: greyColorE0E0E0,
    accentColor: whiteColorFFFFFF,
    appBarTheme: AppBarTheme(
      backgroundColor: whiteColorFFFFFF,
      elevation: 0.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: whiteColorD3D3D3,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: blackColor171717,
    ),
  );

  //? DARK THEME
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blackColor171717,
    primaryColor: whiteColorFFFFFF,
    primaryColorLight: whiteColorFFFFFF,
    primaryColorDark: whiteColorF5F5F5.withOpacity(0.1),
    dividerColor: greyColor2B2B2B,
    cardColor: greyColor1F1F1F,
    shadowColor: Colors.transparent,
    canvasColor: whiteColorFFFFFF,
    buttonColor: greyColorE0E0E0.withOpacity(0.10),
    accentColor: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: blackColor171717,
      elevation: 0.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: redPrimaryColor,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: whiteColorFFFFFF,
    ),
  );

  //? Base Colors
  static Color whiteColorFFFFFF = const Color(0xFFFFFFFF);
  static Color whiteColorF5F5F5 = const Color(0xFFF5F5F5);
  static Color whiteColorD3D3D3 = const Color.fromARGB(255, 227, 227, 227);
  static Color greyColorE0E0E0 = const Color(0xFFE0E0E0);
  static Color greyColor808080 = const Color(0xFF808080);
  static Color grayColor8A959E = const Color(0xFF8A959E);
  static Color greyColor909090 = const Color(0xFF909090);
  static Color greyColor2B2B2B = const Color(0xFF2B2B2B);
  static Color greyColor1F1F1F = const Color(0xFF1F1F1F);
  static Color blackColor242424 = const Color(0xFF242424);
  static Color blackColor303030 = const Color(0xFF303030);
  static Color blackColor000000 = const Color(0xFF000000).withOpacity(0.5);
  static Color blackColor171717 = const Color(0xFF171717);
  static Color darkBrownColor = const Color(0xFF303030);
  static Color redPrimaryColor = Colors.red;
  static Color darkRedColor = const Color(0xFFF32529);
  static Color redSecondaryText = const Color(0xFFEB5757);
  static Color greenText = const Color(0xFF27AE60);
}
