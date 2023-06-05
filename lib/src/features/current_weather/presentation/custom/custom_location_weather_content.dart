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
    final orientation = MediaQuery.of(context).orientation;

    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return isLoading
          ? const CustomCircularProgressIndicator()
          : SingleChildScrollView(
              padding: orientation == Orientation.portrait
                  ? const EdgeInsets.symmetric(horizontal: kPadding20)
                  : const EdgeInsets.all(kPadding20),
              child: orientation == Orientation.portrait
                  ? Stack(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: kPadding20),
                            RoundedInputButton(
                              onPressed: onSearch,
                              hintText: "City",
                              buttonText: "Search",
                              buttonBackgroundColor: Palette.darkOrange,
                              focusedBorderColor: Palette.darkOrange,
                            ),
                          ],
                        ),
                        ConstrainedBox(
                          constraints: constraints,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (weather != null)
                                FullWeatherDisplay(
                                  weather: weather!,
                                  forecastList: forecastList,
                                )
                              else if (errorMessage != null)
                                const Text(
                                  "No weather found for that city",
                                  style: TextStyle(color: Colors.red),
                                ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        RoundedInputButton(
                          onPressed: onSearch,
                          hintText: "City",
                          buttonText: "Search",
                          buttonBackgroundColor: Palette.darkOrange,
                          focusedBorderColor: Palette.darkOrange,
                        ),
                        const SizedBox(height: kPadding20),
                        if (weather != null)
                          FullWeatherDisplay(
                            weather: weather!,
                            forecastList: forecastList,
                          )
                        else if (errorMessage != null)
                          const Text(
                            "No weather found for that city",
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
            );
    });
  }
}
