import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../common_widgets/refresh_icon_button.dart';
import '../../../core/constants.dart';
import '../data/forecast_weather_provider.dart';
import 'forecast_weather_content.dart';

class ForecastWeatherPage extends StatelessWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastWeatherProvider>(
        builder: (context, ForecastWeatherProvider provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          actions: [
            RefreshIconButton(
              onPressed: provider.getForecastsForCurrentLocation,
              tooltip: "Refresh Forecast Weather for Current Location",
            ),
          ],
        ),
        body: provider.isLoading
            ? const CustomCircularProgressIndicator()
            : provider.forecastList.isNotEmpty
                ? ForecastWeatherContent(forecastList: provider.forecastList)
                : const Center(child: Text("No forecasts yet")),
      );
    });
  }
}
