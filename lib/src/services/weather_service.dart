import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../features/current_weather/domain/location_weather.dart';
import '../features/forecast_weather/domain/forecast_weather.dart';

const _baseUrl = "https://api.openweathermap.org/data/2.5";

class WeatherService {
  WeatherService() {
    final apiKey = dotenv.env["OPEN_WEATHER_API_KEY"];
    if (apiKey == null) {
      throw Exception("❌ -> No API key found for OpenWeatherMap.");
    }

    _apiKey = apiKey;
  }

  late final String _apiKey;

  // Source: https://openweathermap.org/current
  Future<http.Response> _requestCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await http.get(
      Uri.parse(
        "$_baseUrl/weather?"
        "lat=$latitude&"
        "lon=$longitude&"
        "appid=$_apiKey&"
        "units=metric",
      ),
    );
    return response;
  }

  // Source: https://openweathermap.org/forecast5
  Future<http.Response> _requestForecastWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await http.get(
      Uri.parse(
        "$_baseUrl/forecast?"
        "lat=$latitude&"
        "lon=$longitude&"
        "appid=$_apiKey&"
        "units=metric",
      ),
    );
    return response;
  }

  Future<LocationWeather?> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _requestCurrentWeather(
      latitude: latitude,
      longitude: longitude,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final weather = LocationWeather.fromJson(json);
      return weather;
    } else {
      return null;
    }
  }

  Future<List<ForecastWeather>> getForecastWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _requestForecastWeather(
      latitude: latitude,
      longitude: longitude,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      List<ForecastWeather> forecastList = (decodedResponse["list"] as List)
          .map((json) => ForecastWeather.fromJson(json))
          .toList();

      return forecastList;
    } else {
      return [];
    }
  }
}
