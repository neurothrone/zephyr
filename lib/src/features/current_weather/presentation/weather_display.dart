import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/palette.dart';
import '../../../utils/datetime_extensions.dart';
import '../../../utils/string_extensions.dart';
import '../data/location_weather.dart';

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final LocationWeather weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Palette.mediumBlue.withOpacity(0.5),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kPadding20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kPadding20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sunny,
                  color: Palette.lightOrange,
                  size: 40.0,
                ),
                const SizedBox(height: 10.0),
                Text(
                  "${weather.temperature} °C",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${weather.city}, ${weather.country}"),
                  Text(weather.datetime.formattedShort),
                  Text(weather.description.capitalized),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
