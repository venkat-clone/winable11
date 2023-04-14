


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/models/player.dart';
import 'package:newsports/models/userTeamPlayer.dart';
import 'package:newsports/repository/team_repository.dart';
import 'package:newsports/constance/global.dart' as globals;
import 'package:newsports/utils/shared_preference_services.dart';
import '../base_classes/value_state.dart';
import '../models/MatchModel.dart';
import '../models/Team.dart';
import '../models/team_players.dart';
import '../utils/app_execptions.dart';
import '../utils/designations.dart';
import '../utils/value_notifiers.dart';

class TeamController extends BaseController {

  String sport = "Cricket";

  List<Team> cricketTeams = [];
  List<Player> cricketPlayers = [];

  List<UserTeamPlayer> userTeamPlayer = [];
  /// Batsman
  List<UserTeamPlayer> players1 = [];
  /// Bowler
  List<UserTeamPlayer> players2 = [];
  /// AllRounder
  List<UserTeamPlayer> players3 = [];
  /// wicket keeper
  List<UserTeamPlayer> players4 = [];

  double credits = 0;
  double creditsLimit = 100;
  TeamPlayers cricketTeam = TeamPlayers();

  double get creditsLeft {
    return creditsLimit - credits;
  }


  ValueState<List<TeamPlayers>> myCricketPlayers = ValueState.loading();
  ValueState<List<TeamPlayers>> myFootballPlayers = ValueState.loading();



  getSport() async {
    sport = await SharedPreferenceService.getSport();
    setState(() {});
  }

  createTeam(TeamPlayers team, BuildContext context) async {
    try{
      team.userId = currentUser.value.user_id;
      print(team.userId);
      await _repository.sendTeamPlayers(sport,team);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      successSnackBar("Team Created successfully", context);
    }catch(exception){
      errorSnackBar("something went wrong", context);
    }
  }

  String getShortDesignation(int id) {
    return Designation
        .getDesignation(sport, id)
        .shortName;
  }


  final _repository = TeamRepository();


  getTeams(BuildContext context) {
    lodeWhile(() async {
      try {
        final result = await _repository.getAllTeams();
        setState(() {
          cricketTeams = result;
        });
      }
      on FetchDataException {
        errorSnackBar("Please check you internet connection", context);
      } on InvalidResponseException {
        setState(() {});
        workingSnackBar("No Contest found For this Match", context);
      } catch (e, s) {
        errorSnackBar("Something went Wrong please try again later", context);
        if (kDebugMode) {
          print("getMatches Error ${e.toString()}");
          print("getMatches Error stackTrace $s");
        }
      }
    });
  }

  // getAllPlayers(BuildContext context) async{
  //   lodeWhile(() async {
  //     try{
  //       final result = await _teamRepo.getAllPlayers();
  //       setState(() {
  //         cricketPlayers = result;
  //       });
  //       deviceCricketPlayers();
  //     }
  //     on FetchDataException {
  //       errorSnackBar("Please check you internet connection", context);
  //     } on InvalidResponseException {
  //       setState(() { });
  //       workingSnackBar("No Contest found For this Match", context);
  //     }catch (e,s){
  //       errorSnackBar("Something went Wrong please try again later",context);
  //       if(kDebugMode){
  //         print("getMatches Error ${e.toString()}");
  //         print("getMatches Error stackTrace $s");
  //       }
  //     }
  //   });
  // }


  getMatchPlayers(BuildContext context, MatchModel match) {
    lodeWhile(() async {
      try {
        final teamA = match.team1;
        final teamB = match.team2;
        // final list = await _teamRepo.getTeamPlayers(teamA);
        // list.addAll(await _teamRepo.getTeamPlayers(teamB));
        final list = await _repository.getTeamPlayers(sport, teamA);
        list.addAll(await _repository.getTeamPlayers(sport, teamB));
        setState(() {
          userTeamPlayer = list;
        });
        deviceCricketPlayers();
      } on FetchDataException {
        errorSnackBar("Please check you internet connection", context);
      } on InvalidResponseException {
        setState(() {});
        workingSnackBar("No Contest found For this Match", context);
      } catch (e, s) {
        errorSnackBar("Something went Wrong please try again later", context);
        if (kDebugMode) {
          print("getMatches Error ${e.toString()}");
          print("getMatches Error stackTrace $s");
        }
      }
    });
  }


  deviceCricketPlayers() async {
    players1 = userTeamPlayer.where((element) => element.designationId == "1")
        .toList();
    players2 = userTeamPlayer.where((element) => element.designationId == "2")
        .toList();
    players3 = userTeamPlayer.where((element) => element.designationId == "3")
        .toList();
    players4 = userTeamPlayer.where((element) => element.designationId == "4")
        .toList();
    setState(() {});
  }


  /// below create Team Methods
  ///
  ///
  appPlayer(UserTeamPlayer player, BuildContext context, bool isTeamA) {
    if (credits + double.parse(player.creditPoints) > creditsLimit) {
      errorSnackBar("your credits are exited \n cannot add player", context);
      return;
    }
    if (cricketTeam.players.length == 11) {
      errorSnackBar("max player limit reached", context);
      return;
    }
    if ((isTeamA && cricketTeam.teamACount >= 7) ||
        (!isTeamA && cricketTeam.teamBCount >= 7)) {
      errorSnackBar("max 7 players from a team", context);
      return;
    }

    final test ={
      "1":cricketTeam.players1,
      "2":cricketTeam.players2,
      "3":cricketTeam.players3,
      "4":cricketTeam.players4,
    };
    if(test[player.designationId]?.length==8){
      errorSnackBar("Max 8 ${Designation.getDesignation(sport, int.parse(player.designationId)).fullName}s", context);
      return;
    }


    credits = credits + double.parse(player.creditPoints);
    cricketTeam.players.add(player);
    player.selected = true;
    if (isTeamA) {
      cricketTeam.teamACount++;
    } else {
      cricketTeam.teamBCount++;
    }
    switch (player.designationId) {
      case "1":
        cricketTeam.players1.add(player);
        break;
      case "2":
        cricketTeam.players2.add(player);
        break;
      case "3":
        cricketTeam.players3.add(player);
        break;
      case "4":
        cricketTeam.players4.add(player);
        break;
    }
    setState(() {});
  }

  removePlayer(UserTeamPlayer player, BuildContext context, bool isTeamA) {
    if (cricketTeam.players.length <= 0) {
      errorSnackBar("There are No players in your team to remove", context);
      return;
    }
    credits = credits - double.parse(player.creditPoints);
    cricketTeam.players.remove(player);
    player.selected = false;
    if (isTeamA) {
      cricketTeam.teamACount--;
    } else {
      cricketTeam.teamBCount--;
    }
    switch (player.designationId) {
      case "1":
        cricketTeam.players1.remove(player);
        break;
      case "2":
        cricketTeam.players2.remove(player);
        break;
      case "3":
        cricketTeam.players3.remove(player);
        break;
      case "4":
        cricketTeam.players4.remove(player);
        break;
    }
    setState(() {});
  }

  void clearCricketMatch() {
    cricketTeam = TeamPlayers();
    credits = 0;

    userTeamPlayer.forEach((element) {
      element.selected = false;
    });
    players1.forEach((element) {
      element.selected = false;
    });
    players2.forEach((element) {
      element.selected = false;
    });
    players3.forEach((element) {
      element.selected = false;
    });
    players4.forEach((element) {
      element.selected = false;
    });
    setState(() {});
  }


  ValueState<List<TeamPlayers>> get myTeams{
    switch(sport) {
      case "Cricket":
        return myCricketPlayers;
      case "Football":
          return myFootballPlayers;
      default:
        return myCricketPlayers;
    }

  }

  /// Match iD,User ID
  getMyTeam(String matchId) async {
    try{
      if (sport == "Cricket") {
        await getMyCricketTeams(matchId);
      } else {
        await getMyFootballTeams(matchId);
      }
    }catch(e){
      print(e);
    }
  }
  
  Future getMyCricketTeams(String matchId) async{

    final result = await _repository.getMyCricketTeams(matchId);
    setState(() {
      myCricketPlayers = ValueState(value: result);
    });
    print(result);
  }
  
  Future getMyFootballTeams(String matchId) async{
    if(myFootballPlayers.value!=null) return;
    final result = await _repository.getMyFootballTeams(matchId);

  }
  
  
  
}
