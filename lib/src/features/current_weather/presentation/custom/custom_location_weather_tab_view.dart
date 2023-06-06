import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../data/current_custom_weather_provider.dart';
import 'custom_location_weather_content.dart';

class CustomLocationWeatherTabView extends StatelessWidget {
  const CustomLocationWeatherTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentCustomWeatherProvider>(
        builder: (context, CurrentCustomWeatherProvider provider, child) {
      return CustomLocationWeatherContent(
        onSearch: provider.getCurrentWeatherByCity,
        isLoading: provider.isLoading,
        weather: provider.weather,
        forecastList: provider.forecastList,
        errorMessage: provider.errorMessage,
      );
    });
  }
}
