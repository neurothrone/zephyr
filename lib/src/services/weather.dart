class Weather {
  Weather({
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.temperature,
    required this.city,
    required this.country,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: json["coord"]["lat"],
      longitude: json["coord"]["lon"],
      description: json["weather"][0]["description"],
      temperature: json["main"]["temp"],
      city: json["name"],
      country: json["sys"]["country"],
    );
  }

  final double latitude;
  final double longitude;
  final String description;
  final int temperature;
  final String city;
  final String country;
  final DateTime createdAt = DateTime.now();
}
