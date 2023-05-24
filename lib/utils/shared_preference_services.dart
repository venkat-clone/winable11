import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

abstract class SharedPreferenceService {
  static const String fbAccessToken = "FB_ACCESS_TOKEN";
  static const String gAccessToken = "G_ACCESS_TOKEN";
  static const String isLoggedIn = "IS_LOGGED_IN";
  static const String KYC_REQUESTED = "KYC_REQUESTED";
  static const String ALLOW_SMS_NOTIFICATION = "ALLOW_SMS_NOTIFICATION";
  static const String DISCOVERABLE = "DISCOVERABLE";
  static const String USER_DETAILS = "USER_DETAILS";
  static const String MOBILE_VERIFIED = "MOBILE_VERIFIED";
  static const String WALLET = "WALLET";
  static const String BALANCE = "BALANCE";
  static const String SPORT = "SPORT";
  static const String OnBoarding = "OnBoarding";

  static Future<String?> getPreferenceString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool?> getPreferenceBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<String> getFaceBookAccessToken() async =>
      await getPreferenceString(fbAccessToken) ?? "";
  static void setFaceBookAccessToken(String value) async =>
      await setString(fbAccessToken, value);

  static Future<String> getGoogleAccessToken() async =>
      await getPreferenceString(gAccessToken) ?? "";
  static void setGoogleAccessToken(String value) async =>
      await setString(gAccessToken, value);

  static Future<bool> getLoggedIn() async =>
      await getPreferenceBool(isLoggedIn) ?? false;
  static void setLoggedIn(bool value) async => await setBool(isLoggedIn, value);

  static Future<bool> getKYC() async =>
      await getPreferenceBool(KYC_REQUESTED) ?? false;
  static void setKYC(bool value) async => await setBool(KYC_REQUESTED, value);

  static Future<bool> getMobileToken() async =>
      await getPreferenceBool(KYC_REQUESTED) ?? false;
  static void setMobileToken(bool value) async =>
      await setBool(KYC_REQUESTED, value);

  static Future<bool> allowSmsNotification() async =>
      await getPreferenceBool(ALLOW_SMS_NOTIFICATION) ?? false;
  static void setAllowSmsNotification(bool value) async =>
      await setBool(ALLOW_SMS_NOTIFICATION, value);

  static Future<bool> getDiscoverable() async =>
      await getPreferenceBool(DISCOVERABLE) ?? false;
  static void setDiscoverable(bool value) async =>
      await setBool(DISCOVERABLE, value);

  static Future<AppUser> getUser() async {
    print(await getPreferenceString(USER_DETAILS) ?? "");
        return AppUser.formJson(
            jsonDecode(await getPreferenceString(USER_DETAILS) ?? ""));
      }
  static void setUser(AppUser user) async =>
      await setString(USER_DETAILS, jsonEncode(user.toJson()));

  static Future<bool> getVerified() async =>
      await getPreferenceBool(MOBILE_VERIFIED) ?? false;
  static void setVerified(bool value) async =>
      await setBool(MOBILE_VERIFIED, value);

  static Future<String> getBalance() async =>
      await getPreferenceString(WALLET,)??"0";
  static void setBalance(String balance) async =>
      await setString(WALLET,"0");
  static Future<String> cridetCash(double amount) async{
    final current = double.parse(await getBalance());
    final next = current+amount;
    return next.toString();
  }
  static Future<String> debitCash(double amount) async{
    final current = double.parse(await getBalance());
    final next = current-amount;
    return next.toString();
  }

  static Future setSport(String sport) async{
    await setString(SPORT, sport);
  }
  static Future<String> getSport() async{
    return await getPreferenceString(SPORT) ?? "Cricket";
  }

  static Future setOnBoarding(bool isOnBoarded) async{
    await setBool(OnBoarding, isOnBoarded);
  }
  static Future<bool> getOnBoarding() async{
    return await getPreferenceBool(OnBoarding) ?? false;
  }




  static initSharedPreferences({bool login = true, AppUser? user}) {
    setLoggedIn(login);
    setUser(user ?? AppUser());
    setAllowSmsNotification(false);
    setDiscoverable(false);

    // setKYC(false);

    setVerified(false);
  }





}
