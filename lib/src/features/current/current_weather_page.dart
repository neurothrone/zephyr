import 'package:flutter/material.dart';

import '../../common_widgets/custom_circular_progress_indicator.dart';
import '../../core/constants.dart';
import '../../services/weather.dart';
import '../../services/weather_service.dart';
import 'current_weather_display.dart';
import 'weather_location_type.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final _weatherService = WeatherService();
  bool _isLoading = false;

  Weather? _currentWeather;
  WeatherLocationType _locationType = WeatherLocationType.current;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SegmentedButton<WeatherLocationType>(
            segments: WeatherLocationType.values
                .map(
                  (type) => ButtonSegment(
                    value: type,
                    label: Text(type.label),
                    icon: Icon(type.icon),
                  ),
                )
                .toList(),
            selected: <WeatherLocationType>{_locationType},
            onSelectionChanged: _isLoading
                ? null
                : (Set<WeatherLocationType> newSelection) {
                    setState(() => _locationType = newSelection.first);
                  },
          ),
          const SizedBox(height: kPadding20),
          ElevatedButton(
            onPressed: _isLoading ? null : _getCurrentWeather,
            child: const Text("Get Current Weather"),
          ),
          const SizedBox(height: kPadding40),
          _isLoading
              ? const CustomCircularProgressIndicator()
              : _currentWeather != null
                  ? CurrentWeatherDisplay(weather: _currentWeather!)
                  : const SizedBox.shrink()
        ],
      ),
    );
  }

  Future<void> _getCurrentWeather() async {
    _currentWeather = null;

    setState(() => _isLoading = true);

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
