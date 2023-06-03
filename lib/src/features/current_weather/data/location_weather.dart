class LocationWeather {
  LocationWeather({
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.temperature,
    required this.city,
    required this.country,
    required this.icon,
    required this.datetime,
  });

  factory LocationWeather.fromJson(Map<String, dynamic> json) {
    return LocationWeather(
      latitude: json["coord"]["lat"],
      longitude: json["coord"]["lon"],
      description: json["weather"][0]["description"],
      temperature: (json["main"]["temp"] as num).toInt(),
      city: json["name"],
      country: json["sys"]["country"],
      icon: json["weather"][0]["icon"],
      datetime: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
    );
  }

  final double latitude;
  final double longitude;
  final String description;
  final int temperature;
  final String city;
  final String country;
  final String icon;
  final DateTime datetime;
}
