import 'package:flutter/material.dart';

import 'palette.dart';

const kPadding0 = 0.0;
const kPadding10 = 10.0;
const kPadding20 = 20.0;
const kPadding40 = 40.0;

const kCustomBottomNavigationBarThemeData = BottomNavigationBarThemeData(
  backgroundColor: Palette.darkBlue,
  selectedItemColor: Palette.darkOrange,
  selectedIconTheme: IconThemeData(color: Palette.darkOrange),
  selectedLabelStyle: TextStyle(fontSize: 20.0),
  unselectedItemColor: Palette.lightOrange,
  unselectedIconTheme: IconThemeData(color: Palette.lightOrange),
);
