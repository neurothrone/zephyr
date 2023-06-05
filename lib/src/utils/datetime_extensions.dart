import 'package:intl/intl.dart';

extension StringFormat on DateTime {
  String get formattedShort => DateFormat("EEE, MMM d, y").format(this);

  String get formattedLong =>
      DateFormat("EEE, MMM d, y - hh:mm a").format(this);

  String get time =>
      DateFormat("hh:mm a").format(this);
}
