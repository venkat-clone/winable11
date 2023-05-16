

import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/models/Contest.dart';
import 'package:newsports/models/team_players.dart';
import 'package:newsports/models/winner.dart';
import 'package:newsports/repository/contest_repository.dart';

import '../models/MatchWinner.dart';
import '../models/Team.dart';
import '../models/contestWinners.dart';

class WinnersRepository{

  BaseApiServices _apiServices = NetworkAPIService();





  Future<List<ContestWinners>> getCricketMatchWinners(String matchId) async{
    try{

      final contestsMap = await _apiServices.getGetApiResponse("https://admin.winable11.com/default_contest/get_contest_list/$matchId");
      final contestWinnerMap = await _apiServices.getGetApiResponse("https://admin.winable11.com/contest_winners/get/$matchId");
      List<Contest> contestList = [];
      _apiServices.typeCast<List<dynamic>>(contestsMap['response']).forEach((element) {
        contestList.add(Contest.fromJson(element));
      });
      List<ContestWinners> contestWinnersList = [];
      (contestWinnerMap['data']??[]).forEach((element) {
        final contest = ContestWinners.fromJsonWinners(element);
        contest.contest = contestList.firstWhere((element) => element.contestId==contest.id);
        contestWinnersList.add(contest);
      });

      return contestWinnersList;
    }catch(e,s){
      print(e);
      print(s);
      rethrow;
    }
  }


}