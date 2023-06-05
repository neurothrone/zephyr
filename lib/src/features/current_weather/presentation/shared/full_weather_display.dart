import 'package:flutter/material.dart';

import '../../../forecast_weather/domain/forecast_weather.dart';
import '../../domain/location_weather.dart';
import 'location_forecast_weather_display.dart';
import 'current_weather_display.dart';

class FullWeatherDisplay extends StatelessWidget {
  const FullWeatherDisplay({
    super.key,
    required this.weather,
    required this.forecastList,
  });

  final LocationWeather weather;
  final List<ForecastWeather> forecastList;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CurrentWeatherDisplay(weather: weather),
        // This fixes the spacing that is lost in landscape mode
        if (mediaQuery.orientation == Orientation.landscape)
          SizedBox(height: mediaQuery.size.height * 0.1),
        LocationForecastWeatherDisplay(
          forecastList: forecastList,
        ),
      ],
    );
  }
}
