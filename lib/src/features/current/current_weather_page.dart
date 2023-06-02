import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/palette.dart';
import '../../services/weather.dart';
import '../../services/weather_service.dart';
import '../../utils/datetime_extensions.dart';
import '../../utils/string_extensions.dart';

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
        ? const Center(
            child: CircularProgressIndicator(
              color: Palette.lightOrange,
            ),
          )
        : SingleChildScrollView(
            padding: const EdgeInsets.all(kPadding20),
            child: Column(
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

class CurrentWeatherDisplay extends StatelessWidget {
  const CurrentWeatherDisplay({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.sunny,
          color: Palette.lightOrange,
        ),
        Text("${weather.city}, ${weather.country}"),
        Text(weather.createdAt.formatted),
        Text(weather.description.capitalized),
        Text(
          "${weather.temperature.toInt()} °C",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
