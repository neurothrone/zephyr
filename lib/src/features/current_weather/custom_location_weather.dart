import 'package:flutter/material.dart';

class CustomLocationWeather extends StatefulWidget {
  const CustomLocationWeather({Key? key}) : super(key: key);

  @override
  State<CustomLocationWeather> createState() => _CustomLocationWeatherState();
}

class _CustomLocationWeatherState extends State<CustomLocationWeather> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Custom Location Weather"),
    );
  }
}
