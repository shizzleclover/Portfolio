import 'package:flutter/material.dart';
import 'package:portfolio/Utils/constants.dart';  // Assuming AppColors are defined in this file

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightmode,
    scaffoldBackgroundColor: AppColors.lightmode,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightmode,
      elevation: 0,
    ),
    // Customizing the TextTheme
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24, // You can adjust the size as needed
        fontWeight: FontWeight.bold,
        color: Colors.black, // Text color for light mode
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black, // Text color for medium titles
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black, // Text color for small titles
      ),
    ),
    colorScheme: const ColorScheme.light(),
  );

  //! Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkmode,
    scaffoldBackgroundColor: AppColors.darkmode,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkmode,
      elevation: 0,
    ),
    // Customizing the TextTheme for dark mode
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24, // Large text in dark mode
        fontWeight: FontWeight.bold,
        color: Colors.white, // Text color for dark mode
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white, // Medium text in dark mode
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white, // Small text in dark mode
      ),
    ),
    colorScheme: const ColorScheme.dark(),
  );
}
