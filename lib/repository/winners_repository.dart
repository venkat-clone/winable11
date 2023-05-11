

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

  Future<List<MatchWinners>> getCricketWinners() async{
    try{

      /// get Contests for each contest get Winners

      if(true){
        return [
          MatchWinners(

              teamA: Team(
                teamShortName: "ST",
                teamName: "Sydney Thunder",
                teamImage: "https://images.entitysport.com/assets/uploads//2022/12/Sydney-Thunder.png"
              ),
              teamB: Team(
                teamShortName: "Brisbane Heat",
                  teamName: "HEA",
                  teamImage: "https://images.entitysport.com/assets/uploads//2022/12/BHeat-updated.png"
              ),
            date: "2021-12-06 13:45:00",
            title: "Sydney Thunder vs Brisbane Heat",
            prizePoll: "10 lakh",
            winners: []
          ),
        ];
      }


      final result = await _apiServices.getGetApiResponse("https://admin.winable11.com/contest_winners/get/1");
      List<MatchWinners> list = [];
      (result[''] as List<dynamic>).forEach((e) {
        list.add(MatchWinners.fromJson(e));
      });
      return list;
    }catch(e){
      rethrow;
    }
  }

  // Future<List<Contest>> getCricketMatchWinners() async{
  //   try{
  //
  //   }catch(e,s){
  //
  //   }
  // }

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