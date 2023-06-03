import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../data/location_weather_type.dart';
import 'custom_location_weather.dart';
import 'my_location_weather.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  bool _isLoading = false;

  LocationWeatherType _locationType = LocationWeatherType.current;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SegmentedButton<LocationWeatherType>(
            segments: LocationWeatherType.values
                .map(
                  (type) => ButtonSegment(
                    value: type,
                    label: Text(type.label),
                    icon: Icon(type.icon),
                  ),
                )
                .toList(),
            selected: <LocationWeatherType>{_locationType},
            onSelectionChanged: _isLoading
                ? null
                : (Set<LocationWeatherType> newSelection) {
                    setState(() => _locationType = newSelection.first);
                  },
          ),
          const SizedBox(height: kPadding20),
          _locationType == LocationWeatherType.current
              ? const MyLocationWeather()
              : const CustomLocationWeather(),
        ],
      ),
    );
  }
}
