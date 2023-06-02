import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/app.dart';

Future<void> main() async {
  // Attempt to load in environment variables from .env file
  await dotenv.load(fileName: ".env");

  runApp(const MainApp());
}
