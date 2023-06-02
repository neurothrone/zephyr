import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kPadding20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Project Weather",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
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
            const SizedBox(height: kPadding10),
            const Text("Developed by Zaid Neurothrone"),
          ],
        ),
      ),
    );
  }
}
