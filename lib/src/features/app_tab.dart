import 'package:flutter/material.dart';

enum AppTab { current, forecast, about }

extension UI on AppTab {
  IconData get icon => switch (this) {
        AppTab.current => Icons.wb_sunny_rounded,
        AppTab.forecast => Icons.bar_chart_rounded,
        AppTab.about => Icons.info_rounded,
      };

  String get tooltip => switch (this) {
        AppTab.current => "Current Weather",
        AppTab.forecast => "Forecast Weather",
        AppTab.about => "About the App",
      };
}
