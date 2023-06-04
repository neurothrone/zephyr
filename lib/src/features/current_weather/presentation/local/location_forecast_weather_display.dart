import 'package:flutter/material.dart';

import '../../domain/location_weather.dart';

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
