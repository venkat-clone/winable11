
import 'dart:convert';

import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/models/Team.dart';
import 'package:newsports/models/userTeamPlayer.dart';
import 'package:newsports/repository/mock/mock_repository.dart';
import 'package:newsports/utils/app_execptions.dart';
import 'package:newsports/utils/value_notifiers.dart';

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
        return getCricketPlayers(team);
      }
      return getFootballPlayers(team);
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
    } on InvalidResponseException{
      return ;
    }catch(e){
      throw e;
    }
  }

  Future sendCricketTeamPlayers(TeamPlayers players) async{
    try{
      print(players.toJson());
      final jsonResponse = await apiServices.getPostApiResponse(_getUrl("user_team/test_create"),players.toJson());
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

  Future<List<UserTeamPlayer>> getCricketPlayers(Team team) async{

    try{
      final jsonResponse = await apiServices.getGetApiResponse(_getUrl("Players/getPlayers/by_id/${team.teamId}"));
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
  Future<List<UserTeamPlayer>> getFootballPlayers(Team team) async{

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

  Future<List<TeamPlayers>> getMyTeams(String sport,String matchId) async{
    if(sport=="Cricket"){
      return getMyCricketTeams(matchId);
    }else{
      return getMyFootballTeams(matchId);
    }
  }

  Future<List<TeamPlayers>> getMyCricketTeams(String matchId) async{
    try{
      if(false) return [
        TeamPlayers(
            teamId:"",
            teamName:"default team",
            captainId: "1",
            viceCaptainId:"2",
            matchId: "12",
            players:[
              UserTeamPlayer(

              ),
            ]
        ),
      ];
      final response = await apiServices.getGetApiResponse(_getUrl("User_team/get_my_teams/${currentUser.value.user_id}/$matchId"));
      List<TeamPlayers> list =[];
      (response['data'] as List<dynamic>).forEach((element) {
        list.add(TeamPlayers.fromJson(element));
      });
      return list;
    }catch(e,s){
      print(s);
      rethrow;
    }
  }

  Future<List<TeamPlayers>> getMyFootballTeams(String matchId) async{
    try{
      final response = await apiServices.getGetApiResponse(_getUrl("$matchId/${currentUser.value}"));
      List<TeamPlayers> list =[];
      (response['response'] as List<dynamic>).forEach((element) {
        TeamPlayers.fromJson(element);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }



}
