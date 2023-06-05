import 'package:flutter/material.dart';

import '../../../forecast_weather/domain/forecast_weather.dart';
import '../../domain/location_weather.dart';
import '../shared/current_weather_display.dart';

class CustomLocationWeatherDisplay extends StatelessWidget {
  const CustomLocationWeatherDisplay({
    super.key,
    required this.weather,
    required this.forecastList,
    required this.errorMessage,
  });

  final LocationWeather? weather;
  final List<ForecastWeather> forecastList;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (weather != null)
          CurrentWeatherDisplay(weather: weather!)
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
