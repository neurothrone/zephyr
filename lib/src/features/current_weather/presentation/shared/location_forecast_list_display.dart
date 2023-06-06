import 'package:flutter/material.dart';

import '../../../../common_widgets/weather_image.dart';
import '../../../../utils/datetime_extensions.dart';
import '../../../forecast_weather/domain/forecast_weather.dart';

class LocationForecastListDisplay extends StatelessWidget {
  const LocationForecastListDisplay({
    super.key,
    required this.forecastList,
  });

  final List<ForecastWeather> forecastList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: forecastList
          .map((weather) => LocationForecastWeatherItem(weather: weather))
          .toList(),
    );
  }
}

class LocationForecastWeatherItem extends StatelessWidget {
  const LocationForecastWeatherItem({
    super.key,
    required this.weather,
  });

  final ForecastWeather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.datetime.timeFormatted,
          style: const TextStyle(color: Colors.white60),
        ),
        WeatherImage(
          iconName: weather.icon,
          width: 40.0,
          height: 40.0,
        ),
        Text(
          "${weather.temperature} °C",
          style: const TextStyle(),
        ),
      ],
    );
  }
}
