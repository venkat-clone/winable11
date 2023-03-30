
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:newsports/base_classes/baseApiService.dart';

class MockRepository extends BaseApiServices{
  @override
  Future getGetApiResponse(String url, {Map<String, String>? headers}) async{
    return await jsonDecode(await rootBundle.loadString("$url"));
  }

  @override
  Future getPostApiResponse(String url, data, {Map<String, String>? headers, bool printJsonString = false}) async{

  }

  @override
  B typeCast<B>(result) {
    // TODO: implement typeCast
    throw UnimplementedError();
  }

}



