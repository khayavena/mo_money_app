import 'dart:math';

import 'package:intl/intl.dart';

class AppHelper {
  static var currencyRegExp = RegExp(r'\B(?=(\d{3})+(?!\d))');

  static int generateAmount() {
    return (5 + Random().nextInt(100000000 - 5));
  }

  static String moneyFormat(String price) {
    if (price.length > 2) {
      String value =
          "${price.substring(0, price.length - 2)}.${price.substring(price.length - 3, price.length - 1)}";
      value = value.replaceAll(currencyRegExp, ' ');
      return 'R $value';
    }
    return "";
  }

  static String formdate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat.yMEd().add_jms().format(dateTime);
  }

  static DateTime formTodate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat.yMEd().add_jms().parse(date);
  }
}
