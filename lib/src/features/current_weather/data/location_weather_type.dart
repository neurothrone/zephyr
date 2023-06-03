import 'package:flutter/material.dart';

enum LocationWeatherType {
  current,
  custom,
}

extension UI on LocationWeatherType {
  IconData get icon => switch (this) {
        LocationWeatherType.current => Icons.home_rounded,
        LocationWeatherType.custom => Icons.pin_drop_rounded,
      };

  String get label => switch (this) {
        LocationWeatherType.current => "Current Location",
        LocationWeatherType.custom => "Custom Location",
      };
}
