import 'package:intl/intl.dart';

String formatDate(String date) => DateFormat('MMMM d, y').format(DateTime.parse(date));
