import 'package:flutter/foundation.dart';

import '../presentation/current_weather_type.dart';

class CurrentWeatherTypeProvider extends ChangeNotifier {
  CurrentWeatherType _currentWeatherType = CurrentWeatherType.local;

  CurrentWeatherType get currentWeatherType => _currentWeatherType;

  void changeTab(CurrentWeatherType type) {
    _currentWeatherType = type;
    notifyListeners();
  }
}
