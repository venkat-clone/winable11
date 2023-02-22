
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferenceService{

  static const String fbAccessToken = "FB_ACCESS_TOKEN";
  static const String gAccessToken = "G_ACCESS_TOKEN";
  static const String isLoggedIn = "IS_LOGGED_IN";
  static const String KYC_REQUESTED = "KYC_REQUESTED";

  static Future<String?> getPreferenceString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future<bool?> getPreferenceBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<void> setString(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  static Future<void> setBool(String key,bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<String> getFaceBookAccessToken() async => await getPreferenceString(fbAccessToken)??"";
  static void setFaceBookAccessToken(String value) async => await setString(fbAccessToken, value);

  static Future<String> getGoogleAccessToken() async => await getPreferenceString(gAccessToken)??"";
  static void setGoogleAccessToken(String value) async => await setString(gAccessToken, value);

  static Future<bool> getLoggedIn() async => await getPreferenceBool(isLoggedIn)??false;
  static void setLoggedIn(bool value) async => await setBool(isLoggedIn, value);

  static Future<bool> getKYC() async => await getPreferenceBool(KYC_REQUESTED)??false;
  static void setKYC(bool value) async => await setBool(KYC_REQUESTED, value);






}