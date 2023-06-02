import 'package:flutter/material.dart';

enum WeatherLocationType {
  current,
  custom,
}

extension UI on WeatherLocationType {
  IconData get icon => switch (this) {
        WeatherLocationType.current => Icons.home_rounded,
        WeatherLocationType.custom => Icons.pin_drop_rounded,
      };

  String get label => switch (this) {
        WeatherLocationType.current => "Current Location",
        WeatherLocationType.custom => "Custom Location",
      };
}
