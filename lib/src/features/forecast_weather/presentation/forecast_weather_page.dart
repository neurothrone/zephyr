import 'package:flutter/material.dart';

import '../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../common_widgets/refresh_icon_button.dart';
import '../../../core/constants.dart';
import '../../../services/location_service.dart';
import '../../../services/weather_service.dart';
import '../domain/forecast_weather.dart';
import 'forecast_weather_content.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  State<ForecastWeatherPage> createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  final _locationService = LocationService();
  final _weatherService = WeatherService();

  List<ForecastWeather> _forecastList = [];

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        actions: [
          RefreshIconButton(
            onPressed: _getForecastsForCurrentLocation,
            tooltip: "Refresh Forecast Weather for Current Location",
          ),
        ],
      ),
      body: _isLoading
          ? const CustomCircularProgressIndicator()
          : _forecastList.isNotEmpty
              ? ForecastWeatherContent(forecastList: _forecastList)
              : const Center(
                  child: Text(
                    "No forecasts yet",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
    );
  }

  Future<void> _getForecastsForCurrentLocation() async {
    setState(() => _isLoading = true);

    final location = await _locationService.getCurrentLocation();
    if (location == null) {
      setState(() => _isLoading = false);
      // TODO: show alert
      return;
    }

    final newForecastList = await _weatherService.getForecastWeatherByPosition(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    _forecastList = newForecastList;

    setState(() => _isLoading = false);
  }
}
