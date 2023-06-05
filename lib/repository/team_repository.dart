
import 'dart:convert';

import 'package:newsports/base_classes/baseApiService.dart';
import 'package:newsports/base_classes/networkAPIService.dart';
import 'package:newsports/models/Team.dart';
import 'package:newsports/models/userTeamPlayer.dart';
import 'package:newsports/repository/mock/mock_repository.dart';
import 'package:newsports/utils/app_execptions.dart';
import 'package:newsports/utils/value_notifiers.dart';

import '../models/MatchModel.dart';
import '../models/PlayerStats.dart';
import '../models/player.dart';
import '../models/team_players.dart';

class TeamRepository {
  BaseApiServices _apiServices = NetworkAPIService();
  BaseApiServices mockApiServices = MockRepository();

  String _getUrl(String path)=>"https://admin.winable11.com/$path";

  Future<List<Team>> getAllTeams() async {
    try{
      final jsonResponse = await _apiServices.getGetApiResponse(_getUrl("Team/getTeam"));
      List<Team> list = [];
      _apiServices.typeCast<List<dynamic>>(jsonResponse['response']).forEach((element) {
        list.add(Team.fromJson(element));
      });
      return list;
    }catch (e){
      throw e;
    }
  }


  Future<List<UserTeamPlayer>> getMatch11Players(String sport, MatchModel team) async{

    try{
      if(sport=="Cricket"){
        return getCricket11Players(team);
      }
      return getFootball11Players(team);
    }catch(e){
      throw e;
    }
  }
  Future<List<UserTeamPlayer>> getCricket11Players(MatchModel match) async{

    try{
      /// Players/getPlayers/by_id/teamID
      final jsonResponse = await _apiServices.getGetApiResponse(_getUrl("Match_players/get_players/${match.matchId}"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      _apiServices.typeCast<List<dynamic>>(jsonResponse).forEach((element) {
        final player = UserTeamPlayer.fromJson(element);
        if(match.team1.teamId==player.teamId){
          player.teamShortName = match.team1.teamShortName;
        } else if(match.team2.teamId==player.teamId){
          player.teamShortName = match.team2.teamShortName;
        }
        list.add(player);
      });



      return list;
    }catch(e){
      rethrow;
    }
  }
  Future<List<UserTeamPlayer>> getFootball11Players(MatchModel team) async{

    try{
      final jsonResponse = await _apiServices.getGetApiResponse(_getUrl("Football_players"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      _apiServices.typeCast<List<dynamic>>(jsonResponse['data']).forEach((element) {
        final player = UserTeamPlayer.fromFootball(element);
        // player.teamShortName = team.teamShortName;
        list.add(player);
      });
      return list;
    }catch(e){
      rethrow;
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

      final jsonResponse = await _apiServices.getPostApiResponse(_getUrl("user_team/test_create"),players.toJson());
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
      final jsonResponse = await _apiServices.getGetApiResponse(_getUrl("Players/getPlayers/${team.teamId}"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      _apiServices.typeCast<List<dynamic>>(jsonResponse['response']).forEach((element) {
        final player = UserTeamPlayer.fromJson(element);
        player.teamShortName = team.teamShortName;
        list.add(player);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }
  Future<List<UserTeamPlayer>> getAllFootballPlayers(MatchModel team) async{

    try{
      final jsonResponse = await _apiServices.getGetApiResponse(_getUrl("Football_players"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      _apiServices.typeCast<List<dynamic>>(jsonResponse['data']).forEach((element) {
        final player = UserTeamPlayer.fromFootball(element);
        // player.teamShortName = team.teamShortName;
        list.add(player);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }



  // Future<List<TeamPlayers>> getMyTeams(String sport,String matchId) async{
  //   if(sport=="Cricket"){
  //     return getMyCricketTeams(matchId);
  //   }else{
  //     return getMyFootballTeams(matchId);
  //   }
  // }



  Future<List<PlayerStats>> getPlayerStats(String matchId) async {
    ///https://admin.winable11.com/match/points/1586
    try{
      final response = await _apiServices.getGetApiResponse(_getUrl('match/points/$matchId'));
      List<PlayerStats> list = [];
      (response['data'] as List<dynamic>).forEach((e){
        list.add(PlayerStats.fromJson(e));
      });
      return list;
    }
    catch(e,s){
      print("$e\n$s");
      rethrow;
    }

  }
  
  Future<List<TeamPlayers>> getMyCricketTeams(MatchModel match) async{
    try{

      // List<UserTeamPlayer> team1players = await getCricketTeamPlayers(match.team1);
      // List<UserTeamPlayer> team2players = await getCricketTeamPlayers(match.team2);

      // List<UserTeamPlayer> players = (await getPlayerStats(match.matchId)).map((e) => e.toUserTeamPlayer()).toList();
      // List<UserTeamPlayer> players = [];
      // players.addAll(team1players);
      // players.addAll(team2players);


      final response = await _apiServices.getGetApiResponse(_getUrl("User_team/get_my_teams/${currentUser.value.user_id}/${match.matchId}"));


      // final response = await apiServices.getGetApiResponse('https://admin.winable11.com/User_team/get_my_teams/116/1550');
      List<TeamPlayers> list =[];
      (response['data'] as List<dynamic>).forEach((element) {
        final team = TeamPlayers.fromJson(element);
        List<UserTeamPlayer> teamPlayers =[];

        team.players.forEach((teamPlayer) {
          // final ind = players.indexWhere((player) => player.pid==teamPlayer.pid);
          // if(ind!=-1){
          //   final newPlayer = teamPlayer;
          //   newPlayer.points = players[ind].points;
          //   teamPlayers.add(newPlayer);
          // }else{
          //   teamPlayers.add(teamPlayer);
          // }
          teamPlayers.add(teamPlayer);
        });

        team.players = teamPlayers;
        team.segrigate();
        list.add(team);
      });
      return list;
    }catch(e,s){
      print('$e\n$s');
      rethrow;
    }
  }

  Future<List<TeamPlayers>> getMyFootballTeams(String matchId) async{
    try{
      final response = await _apiServices.getGetApiResponse(_getUrl("$matchId/${currentUser.value}"));
      List<TeamPlayers> list =[];
      (response['response'] as List<dynamic>).forEach((element) {
        TeamPlayers.fromJson(element);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }



  Future<List<UserTeamPlayer>> getCricketTeamPlayers(Team team,MatchModel match) async{

    try{
      /// Players/getPlayers/by_id/teamID
      final jsonResponse = await _apiServices.getGetApiResponse(_getUrl("Players/getPlayers/by_id/${team.teamId}/${match.matchId}"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      _apiServices.typeCast<List<dynamic>>(jsonResponse['response']).forEach((element) {
        final player = UserTeamPlayer.fromJson(element);
        player.teamShortName = team.teamShortName;
        player.teamId = team.teamId;
        list.add(player);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }

  Future<List<UserTeamPlayer>> getFootballTeamPlayers(Team team) async{

    try{
      final jsonResponse = await _apiServices.getGetApiResponse(_getUrl("Football_players"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      _apiServices.typeCast<List<dynamic>>(jsonResponse['data']).forEach((element) {
        final player = UserTeamPlayer.fromFootball(element);
        // player.teamShortName = team.teamShortName;
        list.add(player);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }


  Future<List<UserTeamPlayer>> getMatchPlayers(String sport, MatchModel team) async{

    try{
      if(sport=="Cricket"){
        return getCricketPlayers(team);
      }
      return getFootballPlayers(team);
    }catch(e){
      throw e;
    }
  }
  Future<List<UserTeamPlayer>> getCricketPlayers(MatchModel match) async{

    try{
      /// Players/getPlayers/by_id/teamID
      final unAnnounced = await getCricketTeamPlayers(match.team1,match);
      unAnnounced.addAll(await getCricketTeamPlayers(match.team2,match));

      final announced = await getCricket11Players(match);

      final List<UserTeamPlayer> allPLayers = [];

      unAnnounced.forEach((element) {
        /// announced.indexWhere()-> -1 not found : index when found
        /// index if player selected, -1 if not selected
        final announcedPlayerIndex = announced.indexWhere((e) => (e.pid==element.pid));
        if(announcedPlayerIndex!=-1){
          element.announced = true;
          element.substitute = announced[announcedPlayerIndex].substitute;
          allPLayers.add(element);

        }else{
          allPLayers.add(element);
        }
      });



      // final jsonResponse = await apiServices.getGetApiResponse(_getUrl("Match_players/get_players/${match.matchId}"));
      // // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      // List<UserTeamPlayer> list = [];
      // apiServices.typeCast<List<dynamic>>(jsonResponse).forEach((element) {
      //   final player = UserTeamPlayer.fromJson(element);
      //   if(match.team1.teamId==player.teamId){
      //     player.teamShortName = match.team1.teamShortName;
      //   } else if(match.team2.teamId==player.teamId){
      //     player.teamShortName = match.team2.teamShortName;
      //   }
      //   list.add(player);
      // });
      return allPLayers;
    }catch(e){
      rethrow;
    }
  }
  Future<List<UserTeamPlayer>> getFootballPlayers(MatchModel team) async{

    try{
      final jsonResponse = await _apiServices.getGetApiResponse(_getUrl("Football_players"));
      // final jsonResponse = await mockApiServices.getGetApiResponse("assets/mock_jsons/players_${team.teamId}");
      List<UserTeamPlayer> list = [];
      _apiServices.typeCast<List<dynamic>>(jsonResponse['data']).forEach((element) {
        final player = UserTeamPlayer.fromFootball(element);
        // player.teamShortName = team.teamShortName;
        list.add(player);
      });
      return list;
    }catch(e){
      rethrow;
    }
  }


  Future editCricketTeam(TeamPlayers newTeam,TeamPlayers oldTeam,) async{
    try{

      final newPlayers = newTeam.players.toList();
      for (var i = 0; i < newPlayers.length; i++) {
        final newPlayer = newPlayers[i];
        final commonPlayerIndex =
        oldTeam.players.indexWhere((oldPlayer) => oldPlayer.pid == newPlayer.pid);
        if (commonPlayerIndex != -1) {
          newPlayers.removeAt(i);
          i--;
        }
      }

      final oldPlayers = oldTeam.players.toList();
      for (var i = 0; i < oldPlayers.length; i++) {
        final oldPlayer = oldPlayers[i];
        final commonPlayerIndex =
        newTeam.players.indexWhere((newPlayer) => newPlayer.pid == oldPlayer.pid);
        if (commonPlayerIndex != -1) {
          oldPlayers.removeAt(i);
          i--;
        }
      }
      newPlayers.forEach((element) {print("name added:${element.name}");});
      oldPlayers.forEach((element) {print("name removed:${element.name}");});

      final s = await _apiServices.getPostApiResponse("https://admin.winable11.com/user_team/edit",{
        "captainId":newTeam.captainId,
        "viceCaptainId":newTeam.viceCaptainId,
        "team_id":oldTeam.teamId,
        "insert":newPlayers.map((e) => e.getJsonUploadWithCaptain(
            newTeam.captainId==e.pid, newTeam.viceCaptainId==e.pid,oldTeam.teamId
        )).toList(),
        "delete":oldPlayers.map((e) => {
          "team_id" : oldTeam.teamId,
          "player_id" : e.pid,
        }).toList()
      });

      // final newPlayers = newTeam.players;
      // newTeam.players.forEach((newPlayer) {
      //   final commonPlayerIndex = oldTeam.players.indexWhere((oldPlayer) => oldPlayer.pid==newPlayer.pid);
      //   if(commonPlayerIndex!=-1){
      //     newPlayers.removeAt(commonPlayerIndex);
      //   }
      // });
      // final oldPlayers = newTeam.players;
      // oldTeam.players.forEach((oldPlayer) {
      //   final commonPlayerIndex = newTeam.players.indexWhere((newPlayer) => oldPlayer.pid==newPlayer.pid);
      //   if(commonPlayerIndex!=-1){
      //     oldPlayers.removeAt(commonPlayerIndex);
      //   }
      // });

      // newPlayers.forEach((element) async{
      //   try{
      //     final s = await apiServices.getPostApiResponse("https://admin.winable11.com/user_team/edit/insert",
      //         element.getJsonUploadWithCaptain(
      //       newTeam.captainId==element.pid, newTeam.viceCaptainId==element.pid,oldTeam.teamId
      //     ));
      //   }catch(e,s){
      //     print('$e\n$s');
      //   }
      // });
      //
      // oldPlayers.forEach((element) async {
      //   try{
      //     final s = await apiServices.getPostApiResponse("https://admin.winable11.com/user_team/edit/delete", {
      //       "team_id" : oldTeam.teamId,
      //       "player_id" : element.pid,
      //     });
      //   }catch(e,s){
      //     print('$e\n$s');
      //   }
      // });

    }catch(e,s){
      print('$e\n$s');
      rethrow;
    }

  }

  Future editTeamName(TeamPlayers team,String teamName) async{
    try{
      final response = await _apiServices.getPostApiResponse(_getUrl('user_team/edit/name'), {
        "team_name":teamName,
        "team_id":team.teamId
      });

    }catch(e,s){
      rethrow;
    }
  }



}
