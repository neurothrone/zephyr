import 'package:flutter/foundation.dart';

import '../services/location_service.dart';
import '../services/weather_service.dart';

abstract class WeatherProvider extends ChangeNotifier {
  WeatherProvider({
    required this.locationService,
    required this.weatherService,
  });

  final LocationService locationService;
  final WeatherService weatherService;
}
