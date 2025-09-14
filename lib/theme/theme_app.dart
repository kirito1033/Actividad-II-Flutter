import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xFFFF9800), // Primary color
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF9800),       // Primary
      primaryContainer: Color(0xFFFFE0B2), // Light primary
      secondary: Color(0xFFFF5722),     // Accent
      onPrimary: Color(0xFF212121),     // Text/Icons on primary
      onSecondary: Color(0xFF212121),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF57C00), // Dark primary
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFF9800),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF212121), // Primary text
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFF757575), // Secondary text
      ),
    ),
    dividerColor: const Color(0xFFBDBDBD),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xFFF57C00),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFF57C00),
      secondary: Color(0xFFFF5722),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFF212121),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF212121),
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFF9800),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFFBDBDBD),
      ),
    ),
    dividerColor: const Color(0xFF757575),
  );
}
