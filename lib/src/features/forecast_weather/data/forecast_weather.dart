class WeatherForecast {
  WeatherForecast({
    required this.temperature,
    required this.description,
    required this.icon,
    required this.datetime,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      temperature: json["main"]["temp"],
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      datetime: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
    );
  }

  final double temperature;
  final String description;
  final String icon;
  final DateTime datetime;
}
