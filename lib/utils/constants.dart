import 'package:intl/intl.dart';

class Constants {
  static final String mobileRegX = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  static final String emailRegX =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static final String BaseUrl = "https://admin.winable11.com/";

  static isMathchExpired(startDate) {
    var start = DateTime.parse(startDate);
    var toDay = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    if (start.difference(toDay).inDays > 0) {
      return true;
    } else {
      return false;
    }
  }
}
