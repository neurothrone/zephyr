class WeatherForecast {
  WeatherForecast({
    required this.temperature,
    required this.description,
    required this.datetime,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      temperature: json["main"]["temp"],
      description: json["weather"][0]["description"],
      datetime: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
    );
  }

  final double temperature;
  final String description;
  final DateTime datetime;
}
