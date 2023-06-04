import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../../core/constants.dart';
import '../../domain/location_weather.dart';
import '../location_weather_display.dart';
import 'location_forecast_weather_display.dart';

class LocalLocationWeatherContent extends StatelessWidget {
  const LocalLocationWeatherContent({
    Key? key,
    required this.isLoading,
    required this.weather,
  }) : super(key: key);

  final bool isLoading;
  final LocationWeather? weather;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
        builder: (context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: kPadding20,
          vertical:
              mediaQuery.orientation == Orientation.landscape ? kPadding20 : 0,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: isLoading
              ? const Center(child: CustomCircularProgressIndicator())
              : weather != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LocationWeatherDisplay(weather: weather!),
                        // This fixes the spacing that is lost in landscape mode
                        if (mediaQuery.orientation == Orientation.landscape)
                          SizedBox(height: mediaQuery.size.height * 0.1),
                        const LocationForecastWeatherDisplay(),
                      ],
                    )
                  : const Center(child: Text("No weather yet")),
        ),
      );
    });
  }
}
