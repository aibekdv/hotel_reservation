import 'package:flutter/material.dart';
import 'package:reservation/config/config.dart';

final themeData = ThemeData(
  useMaterial3: true,
  primaryColor: AppColors.blue,
  fontFamily: "SF Pro Display",
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 22.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 22.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 30.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  ),
);
