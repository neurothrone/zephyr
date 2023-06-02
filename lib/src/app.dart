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
          selectedItemColor: Palette.darkOrange,
          selectedIconTheme: IconThemeData(color: Palette.darkOrange),
          selectedLabelStyle: TextStyle(fontSize: 20.0),
          unselectedItemColor: Palette.lightOrange,
          unselectedIconTheme: IconThemeData(color: Palette.lightOrange),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return Palette.darkOrange;
              },
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ),
        segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                } else if (states.contains(MaterialState.selected)) {
                  return Palette.darkOrange;
                }
                return Palette.darkOrange.withOpacity(0.5);
              },
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            side: MaterialStateProperty.all(
              const BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
