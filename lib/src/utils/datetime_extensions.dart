import 'package:intl/intl.dart';

extension StringFormat on DateTime {
  String get formatted => DateFormat("EEE, MMM d, y").format(this);
}
