import '../../forecast_weather/domain/forecast_weather.dart';
import '../../weather_provider.dart';
import '../domain/location_weather.dart';

class CurrentLocalWeatherProvider extends WeatherProvider {
  CurrentLocalWeatherProvider({
    required super.locationService,
    required super.weatherService,
  });

  LocationWeather? _weather;
  List<ForecastWeather> _forecastList = [];
  bool _isLoading = false;

  LocationWeather? get weather => _weather;

  List<ForecastWeather> get forecastList => _forecastList;

  bool get isLoading => _isLoading;

  Future<void> getCurrentWeather() async {
    _weather = null;
    _forecastList = [];

    _isLoading = true;
    notifyListeners();

    final position = await locationService.getCurrentLocation();

    if (position == null) {
      // TODO: show alert: location permission is required
      _isLoading = false;
      notifyListeners();
      return;
    }

    final newWeather = await weatherService.getCurrentWeatherByPosition(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    final newForecastList = await weatherService.getForecastWeatherByPosition(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    if (newWeather != null && newForecastList.isNotEmpty) {
      _weather = newWeather;
      // Only interested in the 5 next intervals
      _forecastList = newForecastList.getRange(1, 6).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}
