import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../data/current_custom_weather_provider.dart';
import '../shared/location_alert_dialog.dart';
import 'custom_location_weather_content.dart';

class CustomLocationWeatherTabView extends StatelessWidget {
  const CustomLocationWeatherTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentCustomWeatherProvider>(
        builder: (context, CurrentCustomWeatherProvider provider, child) {
      return CustomLocationWeatherContent(
        onSearch: (String city) => _getCurrentWeatherByCity(context, city),
        isLoading: provider.isLoading,
        weather: provider.weather,
        forecastList: provider.forecastList,
        errorMessage: provider.errorMessage,
      );
    });
  }

  Future<void> _getCurrentWeatherByCity(
    BuildContext context,
    String city,
  ) async {
    final provider = context.read<CurrentCustomWeatherProvider>();
    final wasSuccessful = await provider.getCurrentWeatherByCity(city);

    if (wasSuccessful) return;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLocationAlertDialog(context);
    });
  }
}
