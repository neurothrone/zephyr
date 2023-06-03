import 'package:flutter/material.dart';

enum WeatherLocation {
  current,
  custom,
}

extension UI on WeatherLocation {
  IconData get icon => switch (this) {
        WeatherLocation.current => Icons.home_rounded,
        WeatherLocation.custom => Icons.pin_drop_rounded,
      };

  String get label => switch (this) {
        WeatherLocation.current => "Current Location",
        WeatherLocation.custom => "Custom Location",
      };
}
