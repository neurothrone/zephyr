import 'package:flutter/material.dart';

import '../../core/palette.dart';
import '../../services/weather.dart';
import '../../utils/datetime_extensions.dart';
import '../../utils/string_extensions.dart';

class CurrentWeatherDisplay extends StatelessWidget {
  const CurrentWeatherDisplay({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.sunny,
          color: Palette.lightOrange,
        ),
        Text("${weather.city}, ${weather.country}"),
        Text(weather.createdAt.formatted),
        Text(weather.description.capitalized),
        Text(
          "${weather.temperature.toInt()} °C",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
