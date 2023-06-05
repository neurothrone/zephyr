import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    super.key,
    required this.iconName,
    this.width,
    this.height,
  });

  final String iconName;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$iconName@2x.png",
      width: width,
      height: height,
    );
  }
}
