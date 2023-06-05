import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../domain/forecast_weather.dart';
import 'weather_forecast_row.dart';

class ForecastWeatherContent extends StatelessWidget {
  const ForecastWeatherContent({
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
