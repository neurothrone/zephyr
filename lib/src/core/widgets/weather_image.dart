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
      semanticLabel: "Visual weather description",
      frameBuilder: (_, child, int? frame, bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;

        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
          child: child,
        );
      },
    );
  }
}
