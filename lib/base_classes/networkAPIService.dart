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
      if(kDebugMode)responseList.add([url.replaceAll("https://admin.winable11.com/", ""),response.body.trim()]);
      responseJson = returnResponse(response);

    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }on JsonUnsupportedObjectError{
      throw InvalidResponseException('In valid json');
    }

    return responseJson;

  }


  @override
  Future getPostApiResponse(String url , dynamic data, {Map<String,String>? headers,bool printJsonString = false}) async{

    dynamic responseJson ;
    try {
      if(kDebugMode) {
        print("post API call $url");
        print("post Data for API Call :$data");
        if(printJsonString)
          print("data Json String :${jsonEncode(data)}");
      }
      Response response = await post(
          Uri.parse(url),
          body: jsonEncode(data),
        headers: headers
      ).timeout(Duration(seconds: 10));
      print(response.body);
      if(kDebugMode) responseList.add([url.replaceAll("https://admin.winable11.com/", ""),response.body.trim(),jsonEncode(data)]);
      responseJson = returnResponse(response);
    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }on JsonUnsupportedObjectError{
      InvalidResponseException('In valid json');
    }

    return responseJson ;
  }

  dynamic returnResponse (http.Response response){
    print("response:${response.body.trim()}");
    print("response:${response.body.substring(max(response.body.length-1000,0))}");
    if(response.body.isEmpty){
      return {};
    }
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error accrued while communicating with server'+
            'with status code' +response.statusCode.toString());

    }
  }
  
  dynamic getData(json){
    try{
      if(json['data']=="")
        throw Exception();
      return json['data'];
    }catch(e){
      throw InvalidResponseException(json['message']);
    }
  }

  B typeCast<B>(dynamic result){
    try{
      return (result as B);
    }catch (e){
      throw InvalidResponseException("");
    }
  }
  
  

}