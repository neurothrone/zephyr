import 'package:flutter/material.dart';

import '../features/current_weather/presentation/current_weather_type.dart';

class CustomSegmentedButton extends StatefulWidget {
  const CustomSegmentedButton({
    super.key,
    required this.onSelectionChanged,
  });

  final Function(CurrentWeatherType type) onSelectionChanged;

  @override
  State<CustomSegmentedButton> createState() => _CustomSegmentedButtonState();
}

class _CustomSegmentedButtonState extends State<CustomSegmentedButton> {
  CurrentWeatherType _locationType = CurrentWeatherType.local;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<CurrentWeatherType>(
      segments: CurrentWeatherType.values
          .map(
            (type) => ButtonSegment(
              value: type,
              label: Text(type.label),
              icon: Icon(type.icon),
            ),
          )
          .toList(),
      selected: <CurrentWeatherType>{_locationType},
      onSelectionChanged: (Set<CurrentWeatherType> newSelection) {
        setState(() => _locationType = newSelection.first);
        widget.onSelectionChanged(_locationType);
      },
    );
  }
}
