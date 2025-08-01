import 'package:flutter/material.dart';

import '../../../forecast_weather/domain/forecast_weather.dart';
import '../../domain/location_weather.dart';
import 'location_forecast_list_display.dart';
import 'current_weather_display.dart';

class CompleteWeatherDisplay extends StatelessWidget {
  const CompleteWeatherDisplay({
    super.key,
    required this.weather,
    required this.forecastList,
  });

  final LocationWeather weather;
  final List<ForecastWeather> forecastList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrentWeatherDisplay(weather: weather),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        LocationForecastListDisplay(forecastList: forecastList),
      ],
    );
  }
}
