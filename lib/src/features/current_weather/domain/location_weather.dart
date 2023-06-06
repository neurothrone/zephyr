import '../../../core/domain/weather.dart';

class LocationWeather extends Weather {
  const LocationWeather({
    required int temperature,
    required String description,
    required String icon,
    required DateTime datetime,
    required this.country,
    required this.city,
  }) : super(
          temperature: temperature,
          description: description,
          icon: icon,
          datetime: datetime,
        );

  factory LocationWeather.fromJson(Map<String, dynamic> json) {
    Weather baseWeather = Weather.fromJson(json);
    return LocationWeather(
      temperature: baseWeather.temperature,
      description: baseWeather.description,
      icon: baseWeather.icon,
      datetime: baseWeather.datetime,
      country: json["sys"]["country"],
      city: json["name"],
    );
  }

  final String country;
  final String city;
}
