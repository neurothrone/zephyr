import 'package:flutter/material.dart';

import 'current_weather_page_tab_bar.dart';
import 'custom_location_weather.dart';
import 'local_location_weather.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          bottom: const CurrentWeatherPageTabBar(),
        ),
        body: const TabBarView(
          children: [
            LocalLocationWeather(),
            CustomLocationWeather(),
          ],
        ),
      ),
    );
  }
}
