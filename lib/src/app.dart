import 'package:flutter/material.dart';

import 'core/palette.dart';
import 'features/main_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: const MainScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Palette.darkBlue,
        ),
        scaffoldBackgroundColor: Palette.darkBlue.withOpacity(0.5),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Palette.darkBlue,
          selectedItemColor: Palette.lightOrange,
          selectedIconTheme: IconThemeData(color: Palette.lightOrange),
          selectedLabelStyle: TextStyle(fontSize: 20.0),
          unselectedItemColor: Palette.darkOrange,
          unselectedIconTheme: IconThemeData(color: Palette.darkOrange),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
