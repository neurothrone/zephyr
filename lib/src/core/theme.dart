import 'package:flutter/material.dart';

import 'palette.dart';

final disabledColor = Colors.grey.shade600;

const kCustomBottomNavigationBarThemeData = BottomNavigationBarThemeData(
  backgroundColor: Palette.darkBlue,
  selectedItemColor: Palette.darkOrange,
  selectedIconTheme: IconThemeData(color: Palette.darkOrange),
  selectedLabelStyle: TextStyle(fontSize: 20.0),
  unselectedItemColor: Palette.lightOrange,
  unselectedIconTheme: IconThemeData(color: Palette.lightOrange),
);

final customElevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledColor;
        }
        return Palette.darkOrange;
      },
    ),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    ),
  ),
);

final customSegmentedButtonThemeData = SegmentedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledColor;
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
);
