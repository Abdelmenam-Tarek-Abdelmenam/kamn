import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part "color_manager.dart";
part "font_manager.dart";

ThemeData lightThemeData = ThemeData(
  appBarTheme: AppBarTheme(
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white.withOpacity(0),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark)),
  dividerColor: ColorManager.mainBlue.withOpacity(0.5),
  splashFactory: InkRipple.splashFactory,
  scaffoldBackgroundColor: ColorManager.whiteColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorManager.whiteColor,
    foregroundColor: ColorManager.foreGroundGrey,
  ),
  primaryTextTheme: _textTheme(false),
  primaryColor: ColorManager.mainBlue,
  iconTheme: const IconThemeData(color: ColorManager.mainBlue, size: 30),
  brightness: Brightness.light,
  primaryColorDark: ColorManager.mainBlue,
  primaryColorLight: ColorManager.mainBlue,
  listTileTheme: ListTileThemeData(
    tileColor: ColorManager.whiteColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(ColorManager.mainBlue),
    fixedSize: MaterialStateProperty.all(const Size(120, 30)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    )),
    textStyle: MaterialStateProperty.all(_textTheme(false).labelLarge),
    foregroundColor: MaterialStateProperty.all(ColorManager.darkWhite),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    side: MaterialStateBorderSide.resolveWith((states) =>
        BorderSide(color: Colors.grey.withOpacity(0.4), width: 2.0)),
    foregroundColor: MaterialStateProperty.all(ColorManager.mainBlue),
  )),
  textTheme: _textTheme(false),
  colorScheme: const ColorScheme(
    background: ColorManager.whiteColor,
    onSurface: ColorManager.mainYellow,
    onBackground: ColorManager.lightBlue,
    onSecondary: ColorManager.whiteColor,
    onPrimary: ColorManager.mainBlue,
    primary: ColorManager.mainBlue,
    // till here
    secondary: ColorManager.lightYellow,
    surface: ColorManager.darkWhite,
    error: ColorManager.whiteColor,
    onError: ColorManager.mainBlue,
    brightness: Brightness.light,
  ).copyWith(background: ColorManager.lightYellow),
);

ThemeData darkThemeData = ThemeData(
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black.withOpacity(0),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light)),
  dividerColor: ColorManagerDark.mainBlue.withOpacity(0.5),
  splashFactory: InkRipple.splashFactory,
  scaffoldBackgroundColor: ColorManagerDark.lightYellow,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorManagerDark.whiteColor,
    foregroundColor: ColorManagerDark.foreGroundGrey,
  ),
  primaryTextTheme: _textTheme(true),
  primaryColor: ColorManagerDark.mainBlue,
  iconTheme: const IconThemeData(color: ColorManagerDark.mainBlue, size: 30),
  brightness: Brightness.dark,
  primaryColorDark: ColorManagerDark.mainBlue,
  primaryColorLight: ColorManagerDark.mainBlue,
  listTileTheme: ListTileThemeData(
    tileColor: ColorManagerDark.whiteColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(ColorManagerDark.mainBlue),
    fixedSize: MaterialStateProperty.all(const Size(120, 30)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    )),
    textStyle: MaterialStateProperty.all(_textTheme(true).labelLarge),
    foregroundColor: MaterialStateProperty.all(ColorManagerDark.darkWhite),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    side: MaterialStateBorderSide.resolveWith((states) =>
        BorderSide(color: Colors.grey.withOpacity(0.4), width: 2.0)),
    foregroundColor: MaterialStateProperty.all(ColorManagerDark.mainBlue),
  )),
  textTheme: _textTheme(true),
  colorScheme: const ColorScheme(
    background: ColorManagerDark.lightYellow,
    onSurface: ColorManagerDark.mainYellow,
    onBackground: ColorManagerDark.lightBlue,
    onSecondary: ColorManagerDark.whiteColor,
    onPrimary: ColorManagerDark.mainBlue,
    primary: ColorManagerDark.mainBlue,
    secondary: ColorManagerDark.lightYellow,
    surface: ColorManagerDark.darkWhite,
    error: ColorManagerDark.whiteColor,
    onError: ColorManagerDark.mainBlue,
    brightness: Brightness.dark,
  ).copyWith(background: ColorManagerDark.lightYellow),
);
