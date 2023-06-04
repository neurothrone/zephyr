import 'package:flutter/material.dart';

enum LocationWeatherType {
  local,
  custom,
}

extension UI on LocationWeatherType {
  IconData get icon => switch (this) {
        LocationWeatherType.local => Icons.home_rounded,
        LocationWeatherType.custom => Icons.pin_drop_rounded,
      };

  String get label => switch (this) {
        LocationWeatherType.local => "Current Location",
        LocationWeatherType.custom => "Custom Location",
      };
}
