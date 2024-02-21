import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

abstract class Palette {
  static ThemeMode get themeMode => ThemeMode.light;

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(elevation: 0.7),
        fontFamily: GoogleFonts.vazirmatn().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        snackBarTheme: const SnackBarThemeData(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
        ),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.windows: ZoomPageTransitionsBuilder(),
          },
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(elevation: 0.7),
        fontFamily: GoogleFonts.vazirmatn().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        snackBarTheme: const SnackBarThemeData(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
        ),
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.windows: ZoomPageTransitionsBuilder(),
          },
        ),
      );
}
