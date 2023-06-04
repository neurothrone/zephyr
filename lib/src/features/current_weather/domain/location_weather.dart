class LocationWeather {
  const LocationWeather({
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

final fakeLocationWeather = LocationWeather(
  latitude: 50.0,
  longitude: 50.0,
  description: "Clear sky",
  temperature: 17,
  city: "Malmo",
  country: "SE",
  icon: "04d",
  datetime: DateTime.now(),
);
