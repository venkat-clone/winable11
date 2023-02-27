
import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';

import '../models/MatchModel.dart';

class MatchesRepository {

  BaseApiServices _apiServices = NetworkAPIService();
  String _getUrl(String path)=>"https://admin.winable11.com/$path";
  
  Future<List<MatchModel>> getMatches() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(_getUrl("Match/getMatchList"));
      print("list ${ response['response']}");
      List<MatchModel> list =[];
      (response['response'] as List<dynamic>).forEach(
              (e) => list.add(MatchModel.fromJson(e as Map<String, dynamic>)));
      return list;
    }
    catch (e){
      throw e;
    }
  }




}
