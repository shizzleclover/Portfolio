import 'package:flutter/material.dart';
import 'package:portfolio/Pages/about.dart';
import 'package:portfolio/Pages/home_page.dart';
import 'package:portfolio/Providers/theme_provider.dart';
import 'package:portfolio/Theme/app_theme.dart';
import 'package:provider/provider.dart';
 
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Portfolio',
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Light theme
      darkTheme: AppTheme.darkTheme, // Dark theme
      home: HomePage(), // Your landing page
    );
  }
}
