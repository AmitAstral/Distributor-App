import 'package:intl/intl.dart';

class AppDateUtils {
  static var dateFormat = 'dd MMM yyyy';

  static String get getCurrentDateStr => DateFormat(dateFormat).format(DateTime.now());

  static DateTime stringToDate(String? date) => DateFormat(dateFormat).parse(date ?? getCurrentDateStr);

  static String dateToString(DateTime? date) => DateFormat(dateFormat).format(date ?? stringToDate(null));
}
