import 'package:flutter/material.dart';

part 'colors.dart';

abstract class AppTheme {
  static BorderRadius br = BorderRadius.circular(12.0);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.color003057,
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.color003057,
  );
}
