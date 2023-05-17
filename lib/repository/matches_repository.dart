import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/utils/constants.dart';
import 'package:newsports/utils/value_notifiers.dart';

import '../models/MatchModel.dart';
import '../models/Team.dart';
import '../utils/utils.dart';

class MatchesRepository {
  BaseApiServices _apiServices = NetworkAPIService();
  String _getUrl(String path) => "https://admin.winable11.com/$path";

  Future<List<MatchModel>> getCricketMatches(String type) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(_getUrl("Match/getMatchList/$type"));
      List<MatchModel> list = [];
      (response['data'] as List<dynamic>).forEach(
          (e) {
            final match = MatchModel.fromJson(e['match_details'] as Map<String, dynamic>,e['competition_name'],e['default']);
            match.team1 = Team.fromJson(e['team_a'] as Map<String, dynamic>);
            match.team2 = Team.fromJson(e['team_b'] as Map<String, dynamic>);
            list.add(
                match
            );
          });
      list.sort((a,b){
        final dateA = DateTime.parse(a.matchDateTime);
        final dateB = DateTime.parse(b.matchDateTime);
        return dateA.compareTo(dateB);
      });
      return list;
    } catch (e,s) {
      print(s);
      throw e;
    }
  }
  Future<List<MatchModel>> getMyCricketMatches() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(_getUrl("user/matches/${currentUser.value.user_id}"));
      List<MatchModel> list = [];
      _apiServices.typeCast<List<dynamic>>(response['data']).forEach(
          (e) {
            if(e['match_details']!=null){
              final match = MatchModel.fromJson(e['match_details'] as Map<String, dynamic>,e['competition_name'],e['default']);
              match.team1 = Team.fromJson(e['team_a'] as Map<String, dynamic>);
              match.team2 = Team.fromJson(e['team_b'] as Map<String, dynamic>);
              list.add(
                  match
              );
            }
          });
      list.sort((a,b){
        final dateA = DateTime.parse(a.matchDateTime);
        final dateB = DateTime.parse(b.matchDateTime);
        return dateA.compareTo(dateB);
      });
      /// removes the unique matches
      final uniqueMatch = Utils.removeDuplicatesAndMakeUnique<MatchModel>(list,(m)=>m.matchId);
      return uniqueMatch;
    } catch (e,s) {
      print(s);
      throw e;
    }
  }


  Future<List<MatchModel>> getFootballMatches(String type) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(_getUrl("Match/Football_match"));
      List<MatchModel> list = [];
      (response['data'] as List<dynamic>).forEach(
          (e) {
            final match = MatchModel.fromJson(e['match_details'] as Map<String, dynamic>,response['competition_name'],response['default']);
            match.team1 = Team.fromJson(e['team_a'] as Map<String, dynamic>);
            match.team2 = Team.fromJson(e['team_b'] as Map<String, dynamic>);
            list.add(
                match
            );
          });
      return list;
    } catch (e) {
      throw e;
    }
  }

}
