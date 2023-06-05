import 'package:flutter/material.dart';

import '../../../common_widgets/weather_image.dart';
import '../../../utils/datetime_extensions.dart';
import '../../../utils/string_extensions.dart';
import '../domain/forecast_weather.dart';

class WeatherForecastRow extends StatelessWidget {
  const WeatherForecastRow({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final ForecastWeather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WeatherImage(
          iconName: weather.icon,
          width: 65.0,
          height: 65.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${weather.temperature} °C"),
            Text(weather.description.capitalized),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(weather.datetime.formattedShort),
            Text(weather.datetime.time),
          ],
        ),
      ],
    );
  }
}
