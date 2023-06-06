import 'package:flutter/material.dart';

import '../../../core/widgets/weather_image.dart';
import '../../../core/constants.dart';
import '../../../utils/datetime_extensions.dart';
import '../../../utils/string_extensions.dart';
import '../domain/forecast_weather.dart';

class ForecastWeatherList extends StatelessWidget {
  const ForecastWeatherList({
    Key? key,
    required this.forecastList,
  }) : super(key: key);

  final List<ForecastWeather> forecastList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: kPadding10, right: kPadding20),
      itemCount: forecastList.length,
      itemBuilder: (_, index) {
        return WeatherForecastRow(weather: forecastList[index]);
      },
      separatorBuilder: (_, __) => const Padding(
        padding: EdgeInsets.only(left: kPadding10),
        child: Divider(color: Colors.white60),
      ),
    );
  }
}

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
            Text(weather.datetime.dateFormatted),
            Text(weather.datetime.timeFormatted),
          ],
        ),
      ],
    );
  }
}
