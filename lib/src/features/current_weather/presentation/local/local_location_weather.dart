import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../../core/constants.dart';
import '../../../../services/location_service.dart';
import '../../../../services/weather_service.dart';
import '../../domain/location_weather.dart';
import '../location_weather_display.dart';

class LocalLocationWeather extends StatefulWidget {
  const LocalLocationWeather({Key? key}) : super(key: key);

  @override
  State<LocalLocationWeather> createState() => _LocalLocationWeatherState();
}

class _LocalLocationWeatherState extends State<LocalLocationWeather> {
  final _weatherService = WeatherService();
  final _locationService = LocationService();

  LocationWeather? _weather;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ElevatedButton(
          //   onPressed: _isLoading ? null : _getCurrentWeather,
          //   child: const Text("Get Local Weather"),
          // ),
          const SizedBox(height: kPadding40 * 2),
          LocationWeatherDisplay(weather: fakeLocationWeather),
          const SizedBox(height: kPadding40 * 2),
          const LocationForecastWeatherDisplay(),

          // if (_isLoading) ...[
          //   const CustomCircularProgressIndicator()
          // ] else ...[
          //   if (_myLocationWeather != null)
          //     WeatherDisplay(weather: _weather!)
          // ],
        ],
      ),
    );
  }

  Future<void> _getCurrentWeather() async {
    _weather = null;

    setState(() => _isLoading = true);

    final position = await _locationService.getCurrentLocation();

    if (position == null) {
      // TODO: show alert: location permission is required
      setState(() => _isLoading = false);
      return;
    }

    final weather = await _weatherService.getCurrentWeather(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    if (weather != null) {
      setState(() => _weather = weather);
    }

    setState(() => _isLoading = false);
  }
}

class LocationForecastWeatherDisplay extends StatelessWidget {
  const LocationForecastWeatherDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (_) => const LocationForecastWeatherItem(),
      ),
    );
  }
}

class LocationForecastWeatherItem extends StatelessWidget {
  const LocationForecastWeatherItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Fri",
          style: TextStyle(color: Colors.white60),
        ),
        Image.asset(
          "assets/images/${fakeLocationWeather.icon}@2x.png",
          width: 40.0,
          height: 40.0,
        ),
        // const SizedBox(height: 10.0),
        Text(
          "${fakeLocationWeather.temperature} °C",
          style: const TextStyle(),
        ),
        // const Text("H: 15 °C L: 15 °C"),
      ],
    );
  }
}
