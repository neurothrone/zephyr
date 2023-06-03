import 'package:flutter/material.dart';

import '../../../utils/datetime_extensions.dart';
import '../../../utils/string_extensions.dart';
import '../data/forecast_weather.dart';

class WeatherForecastRow extends StatelessWidget {
  const WeatherForecastRow({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final WeatherForecast weather;

  String get iconPath => "assets/images/${weather.icon}@2x.png";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(iconPath),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weather.datetime.formattedLong),
            Text(
              "${weather.temperature} °C"
              " - ${weather.description.capitalized}",
            ),
          ],
        ),
      ],
    );
  }
}
