import '../../../core/domain/weather.dart';

class ForecastWeather extends Weather {
  const ForecastWeather({
    required int temperature,
    required String description,
    required String icon,
    required DateTime datetime,
  }) : super(
          temperature: temperature,
          description: description,
          icon: icon,
          datetime: datetime,
        );

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    Weather baseWeather = Weather.fromJson(json);
    return ForecastWeather(
      temperature: baseWeather.temperature,
      description: baseWeather.description,
      icon: baseWeather.icon,
      datetime: baseWeather.datetime,
    );
  }
}
