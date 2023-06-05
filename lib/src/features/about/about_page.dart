import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'about_content.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const AboutContent(),
    );
  }
}
