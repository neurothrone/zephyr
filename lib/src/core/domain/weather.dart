class Weather {
  const Weather({
    required this.temperature,
    required this.description,
    required this.icon,
    required this.datetime,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: (json["main"]["temp"] as num).toInt(),
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      datetime: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
    );
  }

  final int temperature;
  final String description;
  final String icon;
  final DateTime datetime;
}
