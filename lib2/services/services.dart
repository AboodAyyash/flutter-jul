
import 'package:intl/intl.dart';

String replaceNumbers(value) {
  value = value.replaceAll(RegExp(r'٠'), '0');
  value = value.replaceAll(RegExp(r'١'), '1');
  value = value.replaceAll(RegExp(r'٢'), '2');
  value = value.replaceAll(RegExp(r'٣'), '3');
  value = value.replaceAll(RegExp(r'٤'), '4');
  value = value.replaceAll(RegExp(r'٥'), '5');
  value = value.replaceAll(RegExp(r'٦'), '6');
  value = value.replaceAll(RegExp(r'٧'), '7');
  value = value.replaceAll(RegExp(r'٨'), '8');
  value = value.replaceAll(RegExp(r'٩'), '9');
  return value;
}

String formattedDate(DateTime date) {
  String formatDate = DateFormat('dd-MM-yyyy hh:mm a').format(date);
  return formatDate;
}
