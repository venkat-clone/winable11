



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:newsports/base_classes/base_controller.dart';

import '../base_classes/value_state.dart';
import '../models/Contest.dart';
import '../models/ContestParticipants.dart';
import '../models/UserRank.dart';
import '../models/Winnings.dart';
import '../repository/contest_repository.dart';
import '../utils/app_execptions.dart';
import '../utils/shared_preference_services.dart';

class ContestController extends BaseController{
  String sport = "Cricket";


  ValueState<List<Contest>> footballContests = ValueState.loading();
  ValueState<List<Contest>> myFootballContests = ValueState.loading();
  ValueState<List<Contest>> myFootballTeams = ValueState.loading();

  ValueState<List<Contest>> cricketContests = ValueState.loading();
  ValueState<List<Contest>> myCricketContests = ValueState.loading();
  ValueState<List<Contest>> myCricketTeams = ValueState.loading();


  ValueState<List<Winning>> winnings = ValueState.loading();
  ValueState<List<ContestParticipants>> contestParticipants = ValueState.loading();
  List<String> topRanks = [];
  ValueState<List<UserRank>> userRankings = ValueState.loading();

  final _repository = ContestRepository();

  ValueState<List<Contest>> get contests{
    switch(sport){
      case "Cricket":
        return cricketContests;
      case "FootBall":
        return footballContests;
      default :
        return cricketContests;
    }
  }
  ValueState<List<Contest>> get myContests{
    switch(sport){
      case "Cricket":
        return myCricketContests;
      case "FootBall":
        return myFootballContests;
      default :
        return myCricketContests;
    }
  }


  Future initSport() async {
    sport = await SharedPreferenceService.getSport();
  }

  getCricketContests(String matchId,BuildContext context) async{
    try {
      print("cricket contests fetching");
      final result = await _repository.getContests(matchId);
      setState(() {
        cricketContests = ValueState(value: result);
      });

      print("cricket contests fetched${result}:${cricketContests.value}");

    } on FetchDataException {
      errorSnackBar("Please check you internet connection", context);
      setState(() {
        cricketContests = ValueState(error: "Please check you internet connection");
      });
    } on InvalidResponseException {
      setState(() {
        cricketContests = ValueState(value: []);
      });
      worningSnackBar("No Contest found For this Match", context);
    }
    catch(e,s){
      if(kDebugMode){
        print("$e\n$s");
      }
      errorSnackBar("Something went wrong", context);
    }
  }
  getFootballContests(String matchId,BuildContext context) async{
    try {
      final result = await _repository.getContests(matchId);
      setState(() {
        footballContests = ValueState(value: result);
      });

    } on FetchDataException {
      errorSnackBar("Please check you internet connection", context);
      setState(() {
        footballContests = ValueState(error: "Please check you internet connection");
      });
    } on InvalidResponseException {
      setState(() {
        footballContests = ValueState(value: []);
      });
      worningSnackBar("No Contest found For this Match", context);
    }
    catch(e,s){
      if(kDebugMode){
        print("$e\n$s");
      }
      errorSnackBar("Something went wrong", context);
    }
  }
  getContests(String matchId,BuildContext context) async{
    if(sport=="Cricket"){
      getCricketContests(matchId, context);
    }else if(sport=="FootBall"){
      getFootballContests(matchId,context);
    }
  }


  getMyCricketContests(String matchId,BuildContext context) async{
    // if(myCricketContests.value!=null) return;
    try {
      final result = await _repository.getMyContests(matchId);
      setState(() {
        myCricketContests = ValueState(value: result);
      });

    } on FetchDataException {
      setState(() {
        myCricketContests = ValueState(error: "Please check you internet connection");
      });
      errorSnackBar("Please check you internet connection", context);
    } on InvalidResponseException {
      setState(() {
        myCricketContests = ValueState(value: []);
      });
      worningSnackBar("No Contest found For this Match", context);
    }
    catch(e,s){
      if(kDebugMode){
        print("$e\n$s");
      }
      errorSnackBar("Something went wrong", context);
    }
  }
  getMyFootballContests(String matchId,BuildContext context) async{
    try {
      final result = await _repository.getContests(matchId);
      setState(() {
        myFootballContests = ValueState(value: result);
      });

    } on FetchDataException {
      setState(() {
        myFootballContests = ValueState(error: "Please check you internet connection");
      });
      errorSnackBar("Please check you internet connection", context);
    } on InvalidResponseException {
      setState(() {
        myFootballContests = ValueState(value: []);
      });
      worningSnackBar("No Contest found For this Match", context);
    }
    catch(e,s){
      if(kDebugMode){
        print("$e\n$s");
      }
      errorSnackBar("Something went wrong", context);
    }
  }
  getMyContests(String matchId,BuildContext context) async{
    if(sport=="Cricket"){
      getMyCricketContests(matchId, context);
    }else if(sport=="FootBall"){
      getMyFootballContests(matchId,context);
    }
  }

  void joinContest(BuildContext context,Contest contest,String teamId) {
    if(sport=="Cricket"){
      joinCricketContest(context,contest,teamId);
    }else if(sport=="FootBall"){

    }
  }

  void joinCricketContest(BuildContext context,Contest contest,String teamId) async{
    try{
      await _repository.joinCricketContest(contest,teamId);
      successSnackBar("Joined the Contest", context);
    }catch(e){

    }
  }

  void getMatchWinnings(BuildContext context,String contestId) async{
    try{
      final result = await _repository.getWinnings(contestId);
      setState(() {
        winnings = ValueState(value: result);
      });
      if(result.isNotEmpty){
        final list = result.first.rank.split('-');
        if(list.length==2){
          List<String> ranks = [];
          for(var i =int.parse(list[0]);i<int.parse(list[1]);i++){
            ranks.add(i.toString());
          };
          topRanks = ranks;
        }else if(result.length==1){
          topRanks = [list.first];
        }else{
          // topRanks = result.sublist(0,min(0,topRanks.length-1)).map((e) => e.r)
        }
      }
    }catch(e){
      setState(() {
        winnings = ValueState(error: "Something went wrong");
      });
      errorSnackBar("Something went wrong", context);
    }
  }

  void getContestParticipants(BuildContext context,Contest contest) async{
    try{
      final list = await _repository.getContestParticipants(contest.matchId, contest.contestId, contest.type);
      contestParticipants = ValueState(value: list);
    } on FetchDataException {
      setState(() {
        contestParticipants = ValueState(error: "please check your internet connection") ;
      });
      errorSnackBar("please check your internet connection", context);

    }catch(e,s){
      setState(() {
        contestParticipants = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar('Unexpected error occurred', context);
      if (kDebugMode) {
        print("getMatches Error $e");
        print("getMatches Error stackTrace $s");
      }
    }
  }

  void getContestRankings(BuildContext context,Contest contest) async{
    try{
      final list = await _repository.getUserRanks(contest.matchId, contest.contestId, contest.type);
      setState(() {
        userRankings = ValueState(value: list);
      });
    } on FetchDataException {
      setState(() {
        userRankings = ValueState(error: "please check your internet connection") ;
      });
      errorSnackBar("please check your internet connection", context);

    }catch(e,s){
      setState(() {
        userRankings = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar('Unexpected error occurred', context);
      if (kDebugMode) {
        print("getMatches Error $e");
        print("getMatches Error stackTrace $s");
      }
    }
  }


}