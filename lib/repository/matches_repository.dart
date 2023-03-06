import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/utils/constants.dart';

import '../models/MatchModel.dart';

class MatchesRepository {
  BaseApiServices _apiServices = NetworkAPIService();
  String _getUrl(String path) => "https://admin.winable11.com/$path";

  Future<List<MatchModel>> getMatches() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(_getUrl("Match/getMatchList"));
      print("list ${response['response']}");
      List<MatchModel> list = [];
      (response['response'] as List<dynamic>).forEach(
          (e) => list.add(MatchModel.fromJson(e as Map<String, dynamic>)));
      return list;
    } catch (e) {
      throw e;
    }
  }

//------------------------Get all upcomming matches---------------------//
  Future<List<MatchModel>> getUpCommingMatches() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(_getUrl("Match/getMatchList"));
      print("list ${response['response']}");
      List<MatchModel> upCommingMatchslist = [];

      (response['response'] as List<dynamic>).forEach((e) {
        if (!Constants.isMathchExpired(e['match_date_time'])) {
          upCommingMatchslist
              .add(MatchModel.fromJson(e as Map<String, dynamic>));
        } else {
          print("No data");
        }
      });
      print("-----------------------------");
      print(upCommingMatchslist);
      return upCommingMatchslist;
    } catch (e) {
      throw e;
    }
  }
}
