
import 'package:intl/intl.dart';

class Utils{
  static String getTimeLeft(DateTime dateTime ){
    // final dateTime = DateFormat('MMM dd, hh:mm a').parse("inputString");
    final _timeLeft = dateTime.difference(DateTime.now());
    if(_timeLeft.isNegative) return DateFormat('d MMM y').format(dateTime);
    if(_timeLeft.inDays>0)
      return "${_timeLeft.inDays} days left";
    if(_timeLeft.inHours>0)
      return "${_timeLeft.inHours.remainder(24)} H ${_timeLeft.inMinutes.remainder(60)} m";
    if(_timeLeft.inMinutes>0)
      return "${_timeLeft.inMinutes.remainder(60)} m ${_timeLeft.inSeconds.remainder(60)} s";
    if(_timeLeft.inSeconds>0)
      return "${_timeLeft.inSeconds.remainder(60)} s";
    return "";
  }


  static String getDaySpecificDate(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    if (dateTime.isAtSameMomentAs(today)) {
      return DateFormat.jm().format(dateTime); // Today 7:30 PM
    } else if (dateTime.isAtSameMomentAs(tomorrow)) {
      return 'Tomorrow ' + DateFormat.jm().format(dateTime); // Tomorrow 9:30 PM
    } else {
      return DateFormat('d MMM h:mm a').format(dateTime); // 7 Apr 12:00 AM
    }
  }




  static String convertToIndianCurrency(double amount) {
    if (amount >= 10000000) {
      return '${(amount / 10000000).toStringAsFixed(1)} Crore';
    } else if (amount >= 100000) {
      return '${(amount / 100000).toStringAsFixed(1)} Lakh';
    } else {
      return amount.toString();
    }
  }

  static String removeCountryCode(String number){
    if(number.startsWith('+') || number.startsWith('0')){
      return number.substring(3,number.length);
    }
    return number;
  }

  static String getCountryCode(String number){
    if(number.startsWith('+') || number.startsWith('0')){
      return number.substring(0,3);
    }
    return '+91';
  }


  static bool isImageURL(String url) {
    final imagePattern = r'([^?/\\]+\.(?:png|jpe?g|gif|webp|bmp))$';
    final regex = RegExp(imagePattern, caseSensitive: false);
    return regex.hasMatch(url);
  }


  static List<T> removeDuplicatesAndMakeUnique<T>(List<T> players,String Function(T) fun ) {

    Set<String> uniqueIds = Set<String>();
    List<T> uniquePlayers = [];
    for (T player in players) {
      if (!uniqueIds.contains(fun(player))) {
        uniqueIds.add(fun(player));
        uniquePlayers.add(player);
      }
    }

    return uniquePlayers;
  }




}
