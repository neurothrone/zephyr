import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../features/current_weather/domain/location_weather.dart';
import '../features/forecast_weather/domain/forecast_weather.dart';

const _host = "api.openweathermap.org";

enum PathEndpoint { weather, forecast }

class WeatherService {
  WeatherService() {
    final apiKey = dotenv.env["OPEN_WEATHER_API_KEY"];
    if (apiKey == null) {
      throw Exception("❌ -> No API key found for OpenWeatherMap.");
    }

    _apiKey = apiKey;
  }

  late final String _apiKey;

  Future<http.Response> _sendRequestToOpenWeatherMapAPI({
    required Map<String, dynamic> params,
    required PathEndpoint pathEndpoint,
  }) async {
    final uri = Uri.https(
      _host,
      "/data/2.5/${pathEndpoint.name}",
      params
        ..addAll({
          "appid": _apiKey,
          "units": "metric",
        }),
    );
    final response = await http.get(uri);
    return response;
  }

  LocationWeather? _processCurrentWeatherResponse({
    required http.Response response,
  }) {
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final weather = LocationWeather.fromJson(json);
      return weather;
    } else {
      return null;
    }
  }

  List<ForecastWeather> _processForecastWeatherResponse({
    required http.Response response,
  }) {
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      final jsonList = decodedResponse["list"] as List;
      List<ForecastWeather> forecastList =
          jsonList.map((json) => ForecastWeather.fromJson(json)).toList();

      return forecastList;
    } else {
      return [];
    }
  }

  Future<LocationWeather?> getCurrentWeatherByPosition({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _sendRequestToOpenWeatherMapAPI(
      params: {
        "lat": latitude.toString(),
        "lon": longitude.toString(),
      },
      pathEndpoint: PathEndpoint.weather,
    );
    return _processCurrentWeatherResponse(response: response);
  }

  Future<LocationWeather?> getCurrentWeatherByCity({
    required String city,
  }) async {
    final response = await _sendRequestToOpenWeatherMapAPI(
      params: {"q": city},
      pathEndpoint: PathEndpoint.weather,
    );
    return _processCurrentWeatherResponse(response: response);
  }

  Future<List<ForecastWeather>> getForecastWeatherByPosition({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _sendRequestToOpenWeatherMapAPI(
      params: {
        "lat": latitude.toString(),
        "lon": longitude.toString(),
      },
      pathEndpoint: PathEndpoint.forecast,
    );
    return _processForecastWeatherResponse(response: response);
  }

  Future<List<ForecastWeather>> getForecastWeatherByCity({
    required String city,
  }) async {
    final response = await _sendRequestToOpenWeatherMapAPI(
      params: {"q": city},
      pathEndpoint: PathEndpoint.forecast,
    );
    return _processForecastWeatherResponse(response: response);
  }
}
