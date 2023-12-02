import 'package:intl/intl.dart';

class DayName {
  static String getDayName() {
    final dateTime = DateTime.now();
    final formattedDayOfWeek = DateFormat.EEEE().format(dateTime);
    return formattedDayOfWeek;
  }
}
