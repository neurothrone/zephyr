import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/palette.dart';
import '../domain/location_weather_type.dart';
import 'custom_location_weather.dart';
import 'my_location_weather.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          bottom: TabBar(
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
        body: const TabBarView(
          children: [
            MyLocationWeather(),
            CustomLocationWeather(),
          ],
        ),
      ),
    );
  }
}
