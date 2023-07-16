import 'package:intl/intl.dart';

String dateFormat(String dateString) {
  DateTime dateFormat = DateFormat('yyyy-MM-dd').parse(dateString);
  return '${dateFormat.day.toString().padLeft(2, '0')}.${dateFormat.month.toString().padLeft(2, '0')}.${dateFormat.year}';
}
