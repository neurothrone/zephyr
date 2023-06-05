import 'package:flutter/material.dart';

import 'package:rounded_input_button/rounded_input_button.dart';

import '../../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../../core/constants.dart';
import '../../../../core/palette.dart';
import '../../../forecast_weather/domain/forecast_weather.dart';
import '../../domain/location_weather.dart';
import '../shared/full_weather_display.dart';

class CustomLocationWeatherContent extends StatelessWidget {
  const CustomLocationWeatherContent({
    Key? key,
    required this.onSearch,
    required this.isLoading,
    required this.weather,
    required this.forecastList,
    this.errorMessage,
  }) : super(key: key);

  final Function(String city) onSearch;
  final bool isLoading;
  final LocationWeather? weather;
  final List<ForecastWeather> forecastList;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
        builder: (context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(kPadding20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInputButton(
              onPressed: onSearch,
              hintText: "City",
              buttonText: "Search",
              buttonBackgroundColor: Palette.darkOrange,
              focusedBorderColor: Palette.darkOrange,
            ),
            if (mediaQuery.orientation == Orientation.landscape)
              const SizedBox(height: kPadding20),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: isLoading
                  ? const CustomCircularProgressIndicator()
                  : errorMessage != null
                      ? const Center(
                          child: Text(
                            "No weather found for that city",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : weather != null
                          ? FullWeatherDisplay(
                              weather: weather!,
                              forecastList: forecastList,
                            )
                          : const Center(
                              child: Text(
                                "No weather yet",
                              ),
                            ),
            ),
          ],
        ),
      );
    });
  }
}
