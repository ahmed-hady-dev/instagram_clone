import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/app_colors.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.light,
    dividerColor: Colors.black,
    colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.black),
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Helvetica',
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Helvetica',
        ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Colors.black,
      filled: true,
      contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
    ),
  );
}

//===============================================================
ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    scaffoldBackgroundColor: AppColors.mobileBackgroundColor,
    colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.grey),
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Helvetica',
        ),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Helvetica',
        ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Colors.grey,
      filled: true,
      contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
      focusedBorder:
          OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
      enabledBorder:
          OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
    ),
    brightness: Brightness.dark,
    dividerColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
