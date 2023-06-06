import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/palette.dart';
import 'current_weather_type.dart';

class CurrentWeatherPageTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CurrentWeatherPageTabBar({
    super.key,
    required this.controller,
  });

  final TabController controller;

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
          controller: controller,
          indicatorColor: Palette.darkOrange,
          tabs: CurrentWeatherType.values
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
