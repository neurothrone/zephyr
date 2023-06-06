import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/features/current_weather/data/current_custom_weather_provider.dart';
import 'src/features/current_weather/data/current_local_weather_provider.dart';
import 'src/features/current_weather/data/current_weather_type_provider.dart';
import 'src/features/forecast_weather/data/forecast_weather_provider.dart';
import 'src/services/location_service.dart';
import 'src/services/weather_service.dart';

Future<void> main() async {
  // Attempt to load in environment variables from .env file
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        Provider<LocationService>(
          create: (_) => LocationService(),
        ),
        Provider<WeatherService>(
          create: (_) => WeatherService(),
        ),
        ChangeNotifierProvider(
          create: (_) => CurrentWeatherTypeProvider(),
        ),
        ChangeNotifierProxyProvider2<LocationService, WeatherService,
            CurrentLocalWeatherProvider>(
          create: (context) {
            final locationService = context.read<LocationService>();
            final weatherService = context.read<WeatherService>();
            return CurrentLocalWeatherProvider(
              locationService: locationService,
              weatherService: weatherService,
            );
          },
          update: (_, __, ___, currentLocalWeatherProvider) =>
              currentLocalWeatherProvider!,
        ),
        ChangeNotifierProxyProvider2<LocationService, WeatherService,
            CurrentCustomWeatherProvider>(
          create: (context) {
            final locationService = context.read<LocationService>();
            final weatherService = context.read<WeatherService>();
            return CurrentCustomWeatherProvider(
              locationService: locationService,
              weatherService: weatherService,
            );
          },
          update: (_, __, ___, currentCustomWeatherProvider) =>
              currentCustomWeatherProvider!,
        ),
        ChangeNotifierProxyProvider2<LocationService, WeatherService,
            ForecastWeatherProvider>(
          create: (context) {
            final locationService = context.read<LocationService>();
            final weatherService = context.read<WeatherService>();
            return ForecastWeatherProvider(
                locationService: locationService,
                weatherService: weatherService);
          },
          update: (_, __, ___, forecastWeatherProvider) =>
              forecastWeatherProvider!,
        ),
      ],
      child: const MainApp(),
    ),
  );
}
