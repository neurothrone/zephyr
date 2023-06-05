import 'package:flutter/material.dart';

import '../../domain/location_weather.dart';
import '../location_weather_display.dart';

class CustomLocationWeatherDisplay extends StatelessWidget {
  const CustomLocationWeatherDisplay({
    super.key,
    this.weather,
    this.errorMessage,
  });

  final LocationWeather? weather;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (weather != null)
          LocationWeatherDisplay(weather: weather!)
        else if (weather == null && errorMessage != null)
          Center(
            child: Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          )
        else
          const Center(
            child: Text(
              "No weather yet",
            ),
          ),
      ],
    );
  }
}
