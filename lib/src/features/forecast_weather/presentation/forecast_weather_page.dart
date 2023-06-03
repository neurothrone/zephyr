import 'package:flutter/material.dart';

import '../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../core/constants.dart';
import '../../../services/weather_service.dart';
import '../../../utils/datetime_extensions.dart';
import '../data/forecast_weather.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({Key? key}) : super(key: key);

  @override
  State<ForecastWeatherPage> createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  final _weatherService = WeatherService();
  bool _isLoading = false;

  List<WeatherForecast> _myForecastWeatherList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _isLoading ? null : _getForecastWeather,
            child: const Text("Get Forecast Weather"),
          ),
          const SizedBox(height: kPadding20),
          if (_isLoading) ...[
            const CustomCircularProgressIndicator()
          ] else ...[
            if (_myForecastWeatherList.isNotEmpty)
              for (WeatherForecast weatherData in _myForecastWeatherList) ...[
                Text(weatherData.datetime.formattedLong),
              ],
          ],
        ],
      ),
    );
  }

  Future<void> _getForecastWeather() async {
    _myForecastWeatherList = [];

    setState(() => _isLoading = true);

    final forecastWeather = await _weatherService.getForecastWeather(
      latitude: 55.61234260391604,
      longitude: 12.980266915343263,
    );

    if (forecastWeather.isNotEmpty) {
      setState(() => _myForecastWeatherList = forecastWeather);
    }

    setState(() => _isLoading = false);
  }
}
