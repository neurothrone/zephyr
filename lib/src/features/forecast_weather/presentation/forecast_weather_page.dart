import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../core/widgets/refresh_icon_button.dart';
import '../../../core/constants.dart';
import '../../current_weather/presentation/shared/location_alert_dialog.dart';
import '../data/forecast_weather_provider.dart';
import 'weather_forecast_list.dart';

class ForecastWeatherPage extends StatelessWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        actions: [
          RefreshIconButton(
            onPressed: () => _refreshWeatherForCurrentLocation(context),
            tooltip: "Refresh Forecast Weather for Current Location",
          ),
        ],
      ),
      body: const SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: kPadding20),
        child: ForecastWeatherContent(),
      ),
    );
  }

  Future<void> _refreshWeatherForCurrentLocation(BuildContext context) async {
    final provider = context.read<ForecastWeatherProvider>();
    final wasSuccessful = await provider.getForecastsForCurrentLocation();

    if (wasSuccessful) return;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLocationAlertDialog(context);
    });
  }
}

class ForecastWeatherContent extends StatelessWidget {
  const ForecastWeatherContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastWeatherProvider>(
        builder: (context, ForecastWeatherProvider provider, child) {
      return provider.isLoading
          ? const CustomCircularProgressIndicator()
          : provider.forecastList.isNotEmpty
              ? ForecastWeatherList(forecastList: provider.forecastList)
              : const Center(child: Text("No forecasts yet"));
    });
  }
}
