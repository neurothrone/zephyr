import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/palette.dart';

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

class CurrentWeatherPageTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CurrentWeatherPageTabBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 5.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white24, width: 0.5),
          ),
        ),
        child: TabBar(
          indicatorColor: Palette.darkOrange,
          tabs: LocationWeatherType.values
              .map((tab) => Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(tab.icon),
                        const SizedBox(width: kPadding10),
                        Text(tab.label),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
