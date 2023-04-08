

import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';

import '../models/commentary/MatchComentry.dart';

class FeedRepository{

  BaseApiServices _apiServices = NetworkAPIService();

  String _url(String path)=>"https://admin.winable11.com/$path";

  Future<MatchCommentary> getMatchFeed(String matchId,String inning ) async{
    try{
      final result = await _apiServices.getGetApiResponse(_url("Match/getLiveComentary/$matchId/$inning"));
      return MatchCommentary.fromJson(result);
    }catch(e,s){
      print("$e\n$s");
      rethrow;
    }
  }


}