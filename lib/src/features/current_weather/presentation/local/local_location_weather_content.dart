import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../../core/constants.dart';
import '../../../forecast_weather/domain/forecast_weather.dart';
import '../../domain/location_weather.dart';
import '../shared/full_weather_display.dart';

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
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: kPadding20,
          vertical: mediaQuery.orientation == Orientation.landscape
              ? kPadding20
              : kPadding0,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: isLoading
                ? const CustomCircularProgressIndicator()
                : weather != null
                    ? FullWeatherDisplay(
                        weather: weather!,
                        forecastList: forecastList,
                      )
                    : const Text("No weather yet"),
          ),
        ),
      );
    });
  }
}
