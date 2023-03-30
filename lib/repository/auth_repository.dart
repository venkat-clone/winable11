

import 'dart:convert';
import 'dart:io';
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

  Future<AppUser> login(String email,String password ) async{
    final String url = '${Constants.BaseUrl}user/login';
    try{
      final client = new http.Client();
      final response = await client.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({
          "email":email,
          "password":password
        }),
      );
    final result = _apiService.returnResponse(response);

    return AppUser.formJson(_apiService.getData(result));
    }catch(error){
      rethrow;
    }
  }

}