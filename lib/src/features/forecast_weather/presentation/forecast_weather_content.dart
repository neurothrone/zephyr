import 'package:flutter/material.dart';

import '../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../core/constants.dart';
import '../../../services/location_service.dart';
import '../../../services/weather_service.dart';
import '../domain/forecast_weather.dart';
import 'weather_forecast_row.dart';

class ForecastWeatherContent extends StatefulWidget {
  const ForecastWeatherContent({Key? key}) : super(key: key);

  @override
  State<ForecastWeatherContent> createState() => _ForecastWeatherContentState();
}

class _ForecastWeatherContentState extends State<ForecastWeatherContent> {
  final _locationService = LocationService();
  final _weatherService = WeatherService();

  List<ForecastWeather> _forecastList = [];

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CustomCircularProgressIndicator()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: _getForecastsForCurrentLocation,
                child: const Text("Get Forecast Weather"),
              ),
              const SizedBox(height: kPadding20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 1500),
                child: _forecastList.isNotEmpty
                    ? ListView.builder(
                        key: ValueKey(_forecastList),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _forecastList.length,
                        itemBuilder: (context, index) {
                          return WeatherForecastRow(
                            weather: _forecastList[index],
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          "No forecasts yet.",
                          key: ValueKey("noForecasts"),
                        ),
                      ),
              ),
            ],
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
