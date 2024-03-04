import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData of(BuildContext context) {
    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF112B44),
        foregroundColor: Colors.white,
      ),
    );
  }
}
