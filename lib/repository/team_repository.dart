
import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/models/Team.dart';
import 'package:newsports/models/userTeamPlayer.dart';
import 'package:newsports/repository/mock/mock_repository.dart';

import '../models/player.dart';
import '../models/team_players.dart';

class TeamRepository {
  BaseApiServices apiServices = NetworkAPIService();
  BaseApiServices mockApiServices = MockRepository();

  String _getUrl(String path)=>"https://admin.winable11.com/$path";

  Future<List<Team>> getAllTeams() async {
    try{
      final jsonResponse = await apiServices.getGetApiResponse(_getUrl("Team/getTeam"));
      List<Team> list = [];
      apiServices.typeCast<List<dynamic>>(jsonResponse['response']).forEach((element) {
        list.add(Team.fromJson(element));
      });
      return list;
    }catch (e){
      throw e;
    }
  }


  Future<List<UserTeamPlayer>> getTeamPlayers(String sport, Team team) async{

    try{
      if(sport=="Cricket"){
        return getAllCricketPlayers(team);
      }
      return getAllFootballPlayers(team);
    }catch(e){
      throw e;
    }
  }

  Future sendTeamPlayers(String sport, TeamPlayers players) async{

    try{
      if(sport=="Cricket"){
        return sendCricketTeamPlayers(players);
      }
      return sendFootballTeamPlayers(players);
    }catch(e){
      throw e;
    }
  }

  Future sendCricketTeamPlayers(TeamPlayers players) async{

    try{

      final jsonResponse = await apiServices.getPostApiResponse(_getUrl("default_contest/user_join"),players.toJson());

    }catch(e){
      throw e;
    }
  }

  Future sendFootballTeamPlayers(TeamPlayers players) async{

    try{
      return sendFootballTeamPlayers(players);
    }catch(e){
      throw e;
    }
  }


  Future<List<UserTeamPlayer>> getAllCricketPlayers(Team team) async{

    try{
      final jsonResponse = await apiServices.getGetApiResponse(_getUrl("Players/getPlayers/${team.teamId}"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      apiServices.typeCast<List<dynamic>>(jsonResponse['response']).forEach((element) {
        final player = UserTeamPlayer.fromJson(element);
        player.teamShortName = team.teamShortName;
        list.add(player);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }
  Future<List<UserTeamPlayer>> getAllFootballPlayers(Team team) async{

    try{
      final jsonResponse = await apiServices.getGetApiResponse(_getUrl("Football_players"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      apiServices.typeCast<List<dynamic>>(jsonResponse['data']).forEach((element) {
        final player = UserTeamPlayer.fromFootball(element);
        player.teamShortName = team.teamShortName;
        list.add(player);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }


}
