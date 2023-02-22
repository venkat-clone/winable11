

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/AuthUser.dart';
import '../utils/constants.dart';

class AuthRepository{

  static Future<AuthUser> registerUser(AuthUser user) async{
    final String url = '${Constants.BaseUrl}user/register/new';
    try{
      final client = new http.Client();
      final streamedRest = await client.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode(user.toJson()),
      );

    }on Exception catch(error){
      print(error);
    }
    return AuthUser();
  }

  static Future<AuthUser> createUserWithCredential(AuthUser user) async{
    return AuthUser();
  }


}