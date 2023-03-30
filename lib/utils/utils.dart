
import 'package:intl/intl.dart';

class Utils{
  static String getTimeLeft(DateTime dateTime ){
    // final dateTime = DateFormat('MMM dd, hh:mm a').parse("inputString");
    final _timeLeft = dateTime.difference(DateTime.now());
    if(_timeLeft.isNegative) return "completed";
    if(_timeLeft.inDays>0)
      return "${_timeLeft.inDays} days left";
    if(_timeLeft.inHours>0)
      return "${_timeLeft.inHours.remainder(24)} Hrs ${_timeLeft.inMinutes.remainder(60)} min left";
    if(_timeLeft.inMinutes>0)
      return "${_timeLeft.inMinutes.remainder(60)} min ${_timeLeft.inSeconds.remainder(60)} sec left";
    if(_timeLeft.inSeconds>0)
      return "${_timeLeft.inSeconds.remainder(60)} sec left";
    return "";
  }


  static String convertToIndianCurrency(int amount) {
    if (amount >= 10000000) {
      return '${(amount / 10000000).toStringAsFixed(1)} Crore';
    } else if (amount >= 100000) {
      return '${(amount / 100000).toStringAsFixed(1)} Lakh';
    } else {
      return amount.toString();
    }
  }






}
