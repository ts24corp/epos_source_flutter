import 'package:intl/intl.dart';

class Common {
  Common();
  static String formatMoney(int number) {
    final oCcy = new NumberFormat("#,##0");
    return oCcy.format(number);
  }
}
