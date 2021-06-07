import 'package:intl/intl.dart';

class Helper {
  static write(String text) {
    try {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
      String formatted = formatter.format(now);
      print('$formatted - $text');
    } catch (e) {
      print(e);
    }
  }
}
