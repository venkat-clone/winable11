

import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';

import '../models/commentary/Commentaries.dart';
import '../models/commentary/MatchComentry.dart';

class FeedRepository{

  BaseApiServices _apiServices = NetworkAPIService();

  String _url(String path)=>"https://admin.winable11.com/$path";

  Future<MatchCommentary> getMatchFeed(String matchId,String inning ) async{
    try{
      final result = await _apiServices.getGetApiResponse(_url("Match/getLiveComentary/$matchId/$inning"));
      final matchInning =  MatchCommentary.fromJson(_apiServices.typeCast<Map<String,dynamic>>(result["response"]));
      matchInning.commentaries = sortCommentaries(matchInning.commentaries);
      return matchInning;
    }catch(e,s){
      print("$e\n$s");
      rethrow;
    }
  }

  List<Commentaries> sortCommentaries(List<Commentaries> list){
    if(list.last.over!="1")
      return list.reversed.toList();
    return list;
  }






}