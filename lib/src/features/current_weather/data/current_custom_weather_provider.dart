import '../../forecast_weather/domain/forecast_weather.dart';
import '../../weather_provider.dart';
import '../domain/location_weather.dart';

class CurrentCustomWeatherProvider extends WeatherProvider {
  CurrentCustomWeatherProvider({
    required super.locationService,
    required super.weatherService,
  });

  LocationWeather? _weather;
  List<ForecastWeather> _forecastList = [];
  String? _errorMessage;
  bool _isLoading = false;

  LocationWeather? get weather => _weather;

  List<ForecastWeather> get forecastList => _forecastList;

  String? get errorMessage => _errorMessage;

  bool get isLoading => _isLoading;

  Future<void> getCurrentWeatherByCity(String city) async {
    _errorMessage = null;
    _weather = null;
    _forecastList = [];

    _isLoading = true;
    notifyListeners();

    final newWeather = await weatherService.getCurrentWeatherByCity(
      city: city,
    );
    final newForecastList = await weatherService.getForecastWeatherByCity(
      city: city,
    );

    if (newWeather != null) {
      _weather = newWeather;
      // Only interested in the 5 next intervals
      _forecastList = newForecastList.getRange(1, 6).toList();
    } else {
      _errorMessage = "No weather found for that city";
    }

    _isLoading = false;
    notifyListeners();
  }
}
