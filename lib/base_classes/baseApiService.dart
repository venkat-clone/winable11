
abstract class BaseApiServices {

  Future<dynamic> getGetApiResponse(String url,{Map<String,String>? headers});

  Future<dynamic> getPostApiResponse(String url , dynamic data,{Map<String,String>? headers,bool printJsonString});
  /// throws invalid InvalidResponseException
  B typeCast<B>(dynamic result);

}



