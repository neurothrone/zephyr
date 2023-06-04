import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../core/constants.dart';
import '../../../services/weather_service.dart';
import '../domain/location_weather.dart';
import 'weather_display.dart';

class LocalLocationWeather extends StatefulWidget {
  const LocalLocationWeather({Key? key}) : super(key: key);

  @override
  State<LocalLocationWeather> createState() => _LocalLocationWeatherState();
}

class _LocalLocationWeatherState extends State<LocalLocationWeather> {
  final _weatherService = WeatherService();
  LocationWeather? _myLocationWeather;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _isLoading ? null : _getCurrentWeather,
          child: const Text("Get Local Weather"),
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

    final position = await _getCurrentLocation();

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
      setState(() => _myLocationWeather = weather);
    }

    setState(() => _isLoading = false);
  }

  Future<Position?> _getCurrentLocation() async {
    PermissionStatus permissionStatus = await Permission.location.request();

    if (permissionStatus.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } else {
      return null;
    }
  }
}
