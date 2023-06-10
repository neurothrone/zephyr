import '../../weather_provider.dart';
import '../domain/forecast_weather.dart';

class ForecastWeatherProvider extends WeatherProvider {
  ForecastWeatherProvider({
    required super.locationService,
    required super.weatherService,
  });

  List<ForecastWeather> _forecastList = [];

  bool _isLoading = false;

  List<ForecastWeather> get forecastList => _forecastList;

  bool get isLoading => _isLoading;

  Future<bool> getForecastsForCurrentLocation() async {
    _isLoading = true;
    notifyListeners();

    final location = await locationService.getCurrentLocation();
    if (location == null) {
      _isLoading = false;
      notifyListeners();
      // TODO: show alert
      return false;
    }

    final newForecastList = await weatherService.getForecastWeatherByPosition(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    _forecastList = newForecastList;

    _isLoading = false;
    notifyListeners();
    return true;
  }
}
