import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../utils/app_execptions.dart';
import 'baseApiService.dart';
import 'package:http/http.dart' as http;

final List<List<String>> responseList = [];


class NetworkAPIService extends BaseApiServices {


  @override
  Future getGetApiResponse(String url,{Map<String,String>? headers}) async {

    dynamic responseJson ;
    try {
      if(kDebugMode) print("GET API call $url");
      final response = await http.get(Uri.parse(url),headers: headers).timeout(const Duration(seconds: 10));
      if(kDebugMode) responseList.add([url.replaceAll("https://admin.winable11.com/", ""),response.body.trim()]);
      responseJson = returnResponse(response);

    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }on JsonUnsupportedObjectError{
      throw InvalidResponseException('In valid json');
    }

    return responseJson;

  }


  @override
  Future getPostApiResponse(String url , dynamic data, {Map<String,String>? headers ,bool printJsonString = false}) async{

    dynamic responseJson ;
    try {
      if(kDebugMode) {niurl");
        print("post Data for API Call :$data");
        if(printJsonString)
          print("data Json String :${jsonEncode(data)}");
      }
      Response response = await post(
        Uri.parse(url),
  ta),
  
      ).timeout(Duration(seconds: 10));
        print(response.body);
        responseList.add([
("https://admin.winable11.com/", ""),

          jsonEncode(data)
        ]);
      }
      responseJson = returnResponse(response);
    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }on JsonUnsupportedObjectError{
      InvalidResponseException('In valid json');
    }

    return responseJson ;
  }

  
