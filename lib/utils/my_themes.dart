import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/my_colors.dart';

class MyThemes {
  static ThemeData dark = ThemeData(
    fontFamily: "SF-Pro",
    scaffoldBackgroundColor: MyColors.scaffoldBg,
    primaryColor: MyColors.primary,
    //primaryColor: Colors.black,
    brightness: Brightness.dark,
    secondaryHeaderColor: const Color(0xFF33363C),
    bottomAppBarColor: MyColors.black,
    toggleableActiveColor: MyColors.primary,
    buttonTheme: const ButtonThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minWidth: 10,
        height: 10),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        headline1: const TextStyle(
            fontSize: 50,
            height: 1.2,
            fontWeight: FontWeight.w700,
            color: Colors.white),
        headline6: TextStyle(
            color: Colors.white.withOpacity(
              0.8,
            ),
            height: 1.6,
            fontSize: 12),
        headline4: TextStyle(
            color: Colors.white.withOpacity(
              0.8,
            ),
            decoration: TextDecoration.underline,
            height: 1.6,
            fontSize: 12),
        headline5: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            color: Colors.white),
        bodyText1: const TextStyle(
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        button: TextStyle(
          color: Colors.white.withOpacity(
            0.8,
          ),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        headline2: const TextStyle(
            fontSize: 32,
            height: 1.25,
            fontWeight: FontWeight.w700,
            color: Colors.white)),
  );

  static ThemeData light = ThemeData(
    fontFamily: "SF-Pro",
    scaffoldBackgroundColor: Colors.white,
    disabledColor: MyColors.myGray,
    brightness: Brightness.light,
    primaryColor: MyColors.blue1,
    secondaryHeaderColor: const Color(0xFFFFFAF6),
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.topAppBarBackgroundColor,
    ),
    bottomAppBarColor: Colors.white,
    toggleableActiveColor: MyColors.blueButtonColor,
    splashColor: MyColors.yellow.withOpacity(0.1),
    highlightColor: MyColors.yellow,
    hoverColor: MyColors.yellow.withOpacity(0.1),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      contentPadding: const EdgeInsets.only(top: 8, left: 8),
      fillColor: MyColors.scaffoldBg,
    ),
    buttonTheme: const ButtonThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minWidth: 10,
        height: 10),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1: const TextStyle(
          fontSize: 50,
          height: 1.2,
          fontWeight: FontWeight.w700,
          color: MyColors.black),
      headline3: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: MyColors.scaffoldBg,
      ),
      button: TextStyle(
        color: const Color(0xFF1F232A).withOpacity(
          0.8,
        ),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      headline4: const TextStyle(
          color: MyColors.scaffoldBg,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      headline6: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: MyColors.blue2,
      ),
      headline5: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: MyColors.black),
      bodyText1: const TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.w600,
          color: MyColors.black),
      bodyText2: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: MyColors.scaffoldBg),
      headline2: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: MyColors.scaffoldBg),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: MyColors.blue2.withOpacity(0.6),
      ),
    ),
  );
}
