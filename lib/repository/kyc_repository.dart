

import 'package:newsports/models/KYC.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../utils/constants.dart';

class KYCRepository{
  static Future<KYCDetails> requestKYC(KYCDetails details) async{
    final String url = '${Constants.BaseUrl}user/register/kyc';
    try{
      final client = new http.Client();
      final streamedRest = await client.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode(details.toJson()),
      );
      print(streamedRest.statusCode);
    }on Exception catch(error){
      print(error);
    }
    return KYCDetails();
  }
}