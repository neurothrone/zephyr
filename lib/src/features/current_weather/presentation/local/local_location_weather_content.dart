import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/constants.dart';
import '../../../forecast_weather/domain/forecast_weather.dart';
import '../../domain/location_weather.dart';
import '../shared/complete_weather_display.dart';

class LocalLocationWeatherContent extends StatelessWidget {
  const LocalLocationWeatherContent({
    Key? key,
    required this.isLoading,
    required this.weather,
    required this.forecastList,
  }) : super(key: key);

  final bool isLoading;
  final LocationWeather? weather;
  final List<ForecastWeather> forecastList;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return isLoading
          ? const Center(
              child: CustomCircularProgressIndicator(),
            )
          : weather == null
              ? const Center(child: Text("No weather yet"))
              : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: kPadding20,
                    vertical: orientation == Orientation.landscape
                        ? kPadding20
                        : kPadding0,
                  ),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Center(
                      child: CompleteWeatherDisplay(
                        weather: weather!,
                        forecastList: forecastList,
                      ),
                    ),
                  ),
                );
    });
  }
}
