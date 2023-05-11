

import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:newsports/models/user.dart';
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

  Future resetPassword(String? email,String name,String password) async{
    try{

    }catch(e){
      rethrow;
    }
  }

  Future updateProfile(AppUser appUser) async {
    try{
      await _apiService.getPostApiResponse("https://admin.winable11.com/User/register/kyc", appUser.toJson());
    }catch(e,s){
      rethrow;
    }
  }



}