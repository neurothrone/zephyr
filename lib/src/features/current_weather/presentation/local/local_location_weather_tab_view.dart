import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../data/current_local_weather_provider.dart';
import 'local_location_weather_content.dart';

class LocalLocationWeatherTabView extends StatelessWidget {
  const LocalLocationWeatherTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentLocalWeatherProvider>(
      builder: (context, CurrentLocalWeatherProvider provider, child) {
        return LocalLocationWeatherContent(
          isLoading: provider.isLoading,
          weather: provider.weather,
          forecastList: provider.forecastList,
        );
      },
    );
  }
}
