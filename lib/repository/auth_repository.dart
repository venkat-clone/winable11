

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsports/models/user.dart';
import 'package:newsports/utils/app_execptions.dart';
import 'package:newsports/utils/value_notifiers.dart';
import '../base_classes/networkAPIService.dart';
import '../models/AuthUser.dart';
import '../utils/constants.dart';

class AuthRepository{


  final _apiService = NetworkAPIService();

  Future<AuthUser> registerUser(AuthUser user) async{
    final String url = '${Constants.BaseUrl}user/register/new';
    try{
      print(jsonEncode(user.toJson()));
      final response = await _apiService.getPostApiResponse(url, user.toJson());
      _apiService.getData(response);
    }catch(error){
      rethrow;
    }
    return AuthUser();
  }

  static Future<AuthUser> createUserWithCredential(AuthUser user) async{
    return AuthUser();
  }

  Future<AppUser> login(AuthUser user) async{
    final String url = '${Constants.BaseUrl}user/login';


    try{

      print(json.encode({
        "phone":user.mobile.isNotEmpty?user.mobile:null,
        "email":user.email.isNotEmpty?user.email:null,
        "password":user.password
      }));

      final response = await _apiService.getPostApiResponse(url, {
        "mobile":user.mobile.isNotEmpty?user.mobile:null,
        "email":user.email.isNotEmpty?user.email:null,
        "password":user.password
      });

    return AppUser.formJson(_apiService.getData(response));
    }catch(e,s){
      print("$e,$s");
      rethrow;
    }
  }

  Future signUpWithGAuth(String email,String password,String userName) async{
    final String url = '${Constants.BaseUrl}user/register/new';
    try{
      final response = await _apiService.getPostApiResponse(url, {
        "email":email,
        "password":password,
        "name":userName
      });
      _apiService.getData(response);
    }catch(error){
      rethrow;
    }
  }

  Future resetPassword(String phone,String password) async{
    try{
      final response = await _apiService.getPostApiResponse('https://admin.winable11.com/User/forgot_password', {
        "mobile":"+91"+phone,
        "password": password
      });
      if(response['success']!=true){
        throw AppException(response['message']??'something went wrong');
      }
    }catch(e){
      rethrow;
    }
  }

  Future<Map<String,dynamic>> updateAuthProfile(AuthUser appUser) async {
    try{
        final authResponse = await _apiService.getPostApiResponse("https://admin.winable11.com/User/update/auth", appUser.toJsonForProfileUpdateAuth());
        return authResponse;
    }catch(e,s){
      rethrow;
    }
  }
  Future<Map<String,dynamic>> updateProfile(AppUser appUser) async {
    try{
        final detailsResponse = await _apiService.getPostApiResponse("https://admin.winable11.com/User/update/details", appUser.toJsonForProfileUpdateDetails());
        return detailsResponse;
    }catch(e,s){
      rethrow;
    }
  }

  Future<Map> sendOtp(String mobile,String action) async{
    try{
      final result = await _apiService.getPostApiResponse('https://admin.winable11.com/otp/send_otp',{
        "mobile_no":mobile,
        "action": action
      });
      return result;
    }catch(e,s){
      if(kDebugMode){
        print('$e\n$s');
      }
      rethrow;
    }
  }

  Future<Map> verifyOtp(String mobile,String otp,String action) async{
    try{
      final result = await _apiService.getPostApiResponse('https://admin.winable11.com/otp/verify_otp',{
        "user_otp":otp,
        "mobile":mobile,
        "action":action
      });
      return result;
    }catch(e,s){
      if(kDebugMode){
        print('$e\n$s');
      }
      rethrow;
    }
  }


}