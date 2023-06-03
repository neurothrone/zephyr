import 'package:flutter/material.dart';

import 'constants.dart';
import 'palette.dart';

final customElevatedButtonThemeData = ElevatedButtonThemeData(
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
);

final customSegmentedButtonThemeData = SegmentedButtonThemeData(
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
);

final customInputDecorationTheme = InputDecorationTheme(
  border: kOutlineInputBorder,
  enabledBorder: kOutlineInputBorder,
  focusedBorder: kOutlineInputBorder,
  labelStyle: TextStyle(
    color: Palette.darkOrange.withOpacity(0.65),
  ),
  floatingLabelStyle: const TextStyle(
    color: Palette.darkOrange,
    fontWeight: FontWeight.bold,
  ),
);
