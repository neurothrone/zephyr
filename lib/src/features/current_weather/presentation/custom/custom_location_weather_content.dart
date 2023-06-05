import 'package:flutter/material.dart';

import 'package:rounded_input_button/rounded_input_button.dart';

import '../../../../common_widgets/custom_circular_progress_indicator.dart';
import '../../../../core/constants.dart';
import '../../../../core/palette.dart';
import '../../../../services/weather_service.dart';
import '../../domain/location_weather.dart';
import '../location_weather_display.dart';

class CustomLocationWeatherContent extends StatefulWidget {
  const CustomLocationWeatherContent({Key? key}) : super(key: key);

  @override
  State<CustomLocationWeatherContent> createState() =>
      _CustomLocationWeatherContentState();
}

class _CustomLocationWeatherContentState
    extends State<CustomLocationWeatherContent> {
  final _weatherService = WeatherService();

  LocationWeather? _weather;
  late final TextEditingController _controller;

  String? _errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoundedInputButton(
            controller: _controller,
            onPressed: _getCurrentWeatherByCity,
            hintText: "City",
            buttonText: "Search",
            buttonBackgroundColor: Palette.darkOrange,
            focusedBorderColor: Palette.darkOrange,
          ),
          const SizedBox(height: kPadding40),
          if (_isLoading) ...[
            const CustomCircularProgressIndicator()
          ] else ...[
            if (_weather != null)
              LocationWeatherDisplay(weather: _weather!)
            else if (_weather == null && _errorMessage != null)
              Center(
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            else
              const Center(
                child: Text(
                  "No weather yet",
                ),
              ),
          ],
        ],
      ),
    );
  }

  Future<void> _getCurrentWeatherByCity() async {
    _weather = null;
    _errorMessage = null;

    setState(() => _isLoading = true);

    final weather = await _weatherService.getCurrentWeatherByCity(
      city: _controller.text,
    );

    if (weather != null) {
      _weather = weather;
    } else {
      _errorMessage = "No weather found for that city";
    }

    setState(() => _isLoading = false);
  }
}
