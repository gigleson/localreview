import 'package:flutter/material.dart';

class AppTheme {
  
  static Color primary = const Color(0xFF4B39EF);
  static Color secondaryBackground = const Color(0xFFFFFFFF);
  static Color tertiary = const Color(0xFFFAFAFA);
  static Color lineGray = const Color(0xFFBDBDBD);
  static Color grayIcon = const Color(0xFF757575);

  static TextStyle displaySmall = const TextStyle(
    fontFamily: 'Readex Pro',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.0,
  );

  static TextStyle titleSmall = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.0,
  );

  static TextStyle titleMedium = const TextStyle(
    fontFamily: 'Lexend Deca',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.0,
  );

  static TextStyle bodyMedium = TextStyle(
    fontFamily: 'Lexend Deca',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: grayIcon,
  );
}
