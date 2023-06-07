import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/theme/palette.dart';
import 'app_version.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kPadding20),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
            minWidth: viewportConstraints.maxWidth,
          ),
          child: const Center(
            child: AboutContentColumn(),
          ),
        ),
      );
    });
  }
}

class AboutContentColumn extends StatelessWidget {
  const AboutContentColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Project Weather App",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Palette.lightBlue,
          ),
        ),
        const SizedBox(height: kPadding20),
        SizedBox(
          width: mediaQuery.orientation == Orientation.portrait
              ? mediaQuery.size.width
              : mediaQuery.size.width / 2,
          child: const Text(
            "This is an app that is developed for the course 1DV535 at "
            "Linneaus University using Flutter and the OpenWeatherMap API.",
          ),
        ),
        const SizedBox(height: kPadding20),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(text: "Developed by "),
              TextSpan(
                text: "Zaid Neurothrone",
                style: TextStyle(
                  color: Palette.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: kPadding20),
        const AppVersion(),
        const SizedBox(height: kPadding20),
        // Source: https://www.svgrepo.com/svg/484984/weather
        const Text(
          "The app icon was sourced from svgrepo.",
          style: TextStyle(color: Colors.white60),
        ),
      ],
    );
  }
}
