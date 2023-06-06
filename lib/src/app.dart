import 'package:flutter/material.dart';

import 'core/constants.dart';
import 'core/theme/palette.dart';
import 'core/theme/theme.dart';
import 'features/page_switcher.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const PageSwitcher(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Palette.darkBlue),
        scaffoldBackgroundColor: Palette.darkBlue.withOpacity(0.5),
        bottomNavigationBarTheme: kCustomBottomNavigationBarThemeData,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: customElevatedButtonThemeData,
        segmentedButtonTheme: customSegmentedButtonThemeData,
      ),
    );
  }
}
