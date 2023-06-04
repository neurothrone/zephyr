import 'package:flutter/material.dart';

import '../features/current_weather/domain/location_weather_type.dart';

class CustomSegmentedButton extends StatefulWidget {
  const CustomSegmentedButton({
    super.key,
    required this.onSelectionChanged,
  });

  final Function(LocationWeatherType type) onSelectionChanged;

  @override
  State<CustomSegmentedButton> createState() => _CustomSegmentedButtonState();
}

class _CustomSegmentedButtonState extends State<CustomSegmentedButton> {
  LocationWeatherType _locationType = LocationWeatherType.current;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<LocationWeatherType>(
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
      onSelectionChanged: (Set<LocationWeatherType> newSelection) {
        setState(() => _locationType = newSelection.first);
        widget.onSelectionChanged(_locationType);
      },
    );
  }
}
