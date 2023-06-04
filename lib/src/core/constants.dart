import 'package:flutter/material.dart';

import 'palette.dart';

const kPadding0 = 0.0;
const kPadding10 = 10.0;
const kPadding20 = 20.0;
const kPadding40 = 40.0;

const kInputHeight = 50.0;

const kBorderRadiusValue = 20.0;
const kBorderRadius = BorderRadius.all(
  Radius.circular(kBorderRadiusValue),
);
const kLeftBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(20.0),
  bottomLeft: Radius.circular(20.0),
);
const kRightBorderRadius = BorderRadius.only(
  topRight: Radius.circular(kBorderRadiusValue),
  bottomRight: Radius.circular(kBorderRadiusValue),
);

const kOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Palette.darkOrange),
  borderRadius: kBorderRadius,
);

const kCustomBottomNavigationBarThemeData = BottomNavigationBarThemeData(
  backgroundColor: Palette.darkBlue,
  selectedItemColor: Palette.darkOrange,
  selectedIconTheme: IconThemeData(color: Palette.darkOrange),
  selectedLabelStyle: TextStyle(fontSize: 20.0),
  unselectedItemColor: Palette.lightOrange,
  unselectedIconTheme: IconThemeData(color: Palette.lightOrange),
);
