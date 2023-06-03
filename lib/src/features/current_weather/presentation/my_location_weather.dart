import 'package:flutter/material.dart';

import '../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../core/constants.dart';
import '../../../services/weather_service.dart';
import '../data/location_weather.dart';
import 'weather_display.dart';

class MyLocationWeather extends StatefulWidget {
  const MyLocationWeather({Key? key}) : super(key: key);

  @override
  State<MyLocationWeather> createState() => _MyLocationWeatherState();
}

class _MyLocationWeatherState extends State<MyLocationWeather> {
  final _weatherService = WeatherService();
  LocationWeather? _myLocationWeather;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _isLoading ? null : _getCurrentWeather,
          child: const Text("Get Current Weather"),
        ),
        const SizedBox(height: kPadding20),
        if (_isLoading) ...[
          const CustomCircularProgressIndicator()
        ] else ...[
          if (_myLocationWeather != null)
            WeatherDisplay(weather: _myLocationWeather!)
        ],
      ],
    );
  }

  Future<void> _getCurrentWeather() async {
    _myLocationWeather = null;

    setState(() => _isLoading = true);

    final weather = await _weatherService.getCurrentWeather(
      55.61234260391604,
      12.980266915343263,
    );

    if (weather != null) {
      setState(() => _myLocationWeather = weather);
    }

    setState(() => _isLoading = false);
  }
}
