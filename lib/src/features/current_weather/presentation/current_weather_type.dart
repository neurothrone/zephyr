import 'package:flutter/material.dart';

enum CurrentWeatherType {
  local,
  custom,
}

extension UI on CurrentWeatherType {
  IconData get icon => switch (this) {
        CurrentWeatherType.local => Icons.home_rounded,
        CurrentWeatherType.custom => Icons.pin_drop_rounded,
      };

  String get label => switch (this) {
        CurrentWeatherType.local => "Current Location",
        CurrentWeatherType.custom => "Custom Location",
      };
}
