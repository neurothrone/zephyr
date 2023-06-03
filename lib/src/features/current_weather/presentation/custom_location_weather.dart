import 'package:flutter/material.dart';

import '../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../core/constants.dart';
import '../../../services/weather_service.dart';
import '../data/location_weather.dart';
import 'weather_display.dart';

class CustomLocationWeather extends StatefulWidget {
  const CustomLocationWeather({Key? key}) : super(key: key);

  @override
  State<CustomLocationWeather> createState() => _CustomLocationWeatherState();
}

class _CustomLocationWeatherState extends State<CustomLocationWeather> {
  final _weatherService = WeatherService();
  LocationWeather? _myLocationWeather;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _isLoading ? null : _getCurrentWeather,
          child: const Text("Get Custom Weather"),
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
      latitude: 55.61234260391604,
      longitude: 12.980266915343263,
    );

    if (weather != null) {
      setState(() => _myLocationWeather = weather);
    }

    setState(() => _isLoading = false);
  }
}
