import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'weather.dart';

const _baseUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherService {
  WeatherService() {
    final apiKey = dotenv.env["OPEN_WEATHER_API_KEY"];
    if (apiKey == null) {
      throw Exception("❌ -> No API key found for OpenWeatherMap.");
    }

    _apiKey = apiKey;
  }

  late final String _apiKey;

  Future<http.Response> requestCurrentWeather(
    double latitude,
    double longitude,
  ) async {
    final response = await http.get(
      Uri.parse(
        "$_baseUrl?"
        "lat=$latitude&"
        "lon=$longitude&"
        "appid=$_apiKey&"
        "units=metric",
      ),
    );
    return response;
  }

  Future<Weather?> getCurrentWeather(
    double latitude,
    double longitude,
  ) async {
    final response = await requestCurrentWeather(
      latitude,
      longitude,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final weather = Weather.fromJson(json);
      return weather;
    } else {
      return null;
    }
  }
}
