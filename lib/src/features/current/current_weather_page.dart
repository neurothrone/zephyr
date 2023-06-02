import 'package:flutter/material.dart';

import '../../common_widgets/custom_circular_progress_indicator.dart';
import '../../core/constants.dart';
import '../../services/weather.dart';
import '../../services/weather_service.dart';
import 'current_weather_display.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final _weatherService = WeatherService();
  bool _isLoading = false;

  Weather? _currentWeather;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CustomCircularProgressIndicator()
        : SingleChildScrollView(
            padding: const EdgeInsets.all(kPadding20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: _getCurrentWeather,
                  child: const Text("Get Current Weather"),
                ),
                const SizedBox(height: kPadding20),
                _currentWeather != null
                    ? CurrentWeatherDisplay(weather: _currentWeather!)
                    : const Text(
                        "No data yet",
                        textAlign: TextAlign.center,
                      ),
              ],
            ),
          );
  }

  // 55.61234260391604, 12.980266915343263
  Future<void> _getCurrentWeather() async {
    _currentWeather = null;

    setState(() => _isLoading = true);

    // await Future.delayed(const Duration(seconds: 2));
    final weather = await _weatherService.getCurrentWeather(
      55.61234260391604,
      12.980266915343263,
    );

    if (weather != null) {
      setState(() => _currentWeather = weather);
    }

    setState(() => _isLoading = false);
  }
}
