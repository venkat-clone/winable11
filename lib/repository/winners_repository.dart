

import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
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

  Future<List<ContestWinners>> getCricketMatchWinners(String matchId) async {
    try{
      final contestRepo = ContestRepository();
      final contestList = await contestRepo.getContests(matchId);
      List<ContestWinners> contestWinners = [];
      contestList.forEach((element) async{
        final result = await _apiServices.getGetApiResponse("https://admin.winable11.com/contest_winners/get/17");
        List<Winner> winners =[];
        (result['data'] as List<dynamic>).forEach((e) {
          winners.add(Winner.fromJson(e));
        });
        contestWinners.add(ContestWinners(
            prizePool: element.prizePool,
            winners: winners,
            id: element.contestId
        ));
      });
      return contestWinners;
    }catch(e,s){
      print(s);
      rethrow;
    }
  }

}