import 'package:flutter/material.dart';

import '../../../../common_widgets/weather_image.dart';
import '../../../../core/constants.dart';
import '../../../../utils/datetime_extensions.dart';
import '../../../../utils/string_extensions.dart';
import '../../domain/location_weather.dart';

class CurrentWeatherDisplay extends StatelessWidget {
  const CurrentWeatherDisplay({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final LocationWeather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${weather.city}, ${weather.country}",
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: kPadding20),
        Text(
          weather.datetime.dateAndTimeFormatted,
          style: const TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: kPadding10),
        Text(
          weather.description.capitalized,
          style: const TextStyle(color: Colors.white60),
        ),
        WeatherImage(iconName: weather.icon),
        Text(
          "${weather.temperature} °C",
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
