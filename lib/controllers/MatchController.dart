import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:newsports/base_classes/value_state.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../base_classes/base_controller.dart';
import '../models/MatchModel.dart';
import '../models/Team.dart';
import '../repository/matches_repository.dart';
import '../repository/team_repository.dart';
import '../utils/app_execptions.dart';

class MatchController extends BaseController {

  String sport = "Cricket";

  ValueState<List<MatchModel>> upcomingCricketMatchList = ValueState.loading();
  ValueState<List<MatchModel>> myUpcomingCricketMatchList = ValueState.loading();
  ValueState<List<MatchModel>> myLiveCricketMatchList = ValueState.loading();
  ValueState<List<MatchModel>> myPastCricketMatchList = ValueState.loading();


  ValueState<List<MatchModel>> upcomingFootballMatchList = ValueState.loading();
  ValueState<List<MatchModel>> myUpcomingFootballMatchList = ValueState.loading();
  ValueState<List<MatchModel>> myLiveFootballMatchList = ValueState.loading();
  ValueState<List<MatchModel>> myPastFootballMatchList = ValueState.loading();




  Future initSport() async {
    sport = await SharedPreferenceService.getSport();
  }


  ValueState<List<MatchModel>> get myUpComingMatchList {
    switch(sport){
      case "Cricket":
        return myUpcomingCricketMatchList;
      case "FootBall":
        return myUpcomingFootballMatchList;
      default :
        return myUpcomingCricketMatchList;
    }
  }
  ValueState<List<MatchModel>> get myLiveMatchList {
    switch(sport){
      case "Cricket":
        return myLiveCricketMatchList;
      case "FootBall":
        return myLiveFootballMatchList;
      default :
        return myLiveCricketMatchList;
    }
  }
  ValueState<List<MatchModel>> get myPastMatchList {
    switch(sport){
      case "Cricket":
        return myPastCricketMatchList;
      case "FootBall":
        return myPastFootballMatchList;
      default :
        return myPastCricketMatchList;
    }
  }




  final _matchRepository = MatchesRepository();


  getFootBallMatches(BuildContext context) async{

  }

  getUpComingFootBallMatches(BuildContext context) async{

    if(upcomingFootballMatchList.value!=null) return;
    try{
      final list  = await _matchRepository.getCricketMatches("upcoming");
      setState(() {
        upcomingFootballMatchList = ValueState(value: list);
      });
    } on InvalidResponseException {
      setState(() {
        upcomingFootballMatchList = ValueState(value: []) ;
      });
    } on FetchDataException {
      setState(() {
        upcomingFootballMatchList = ValueState(error: "please check your internet connection") ;
      });
      errorSnackBar("please check your internet connection", context);

    }catch(error, stackTrace) {
      setState(() {
        upcomingCricketMatchList = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar(error.toString(), context);
      if (kDebugMode) {
        print("getMatches Error ${error.toString()}");
        print("getMatches Error stackTrace $stackTrace");
      }
    }
  }


  getUpcomingCricketMatches(BuildContext context) async {
    if(upcomingCricketMatchList.value!=null) return;
    try{
      final list  = await _matchRepository.getCricketMatches("upcoming");
      setState(() {
        upcomingCricketMatchList = ValueState(value: list);
      });
    } on InvalidResponseException {
      setState(() {
        upcomingCricketMatchList = ValueState(value: []) ;
      });
    } on FetchDataException {
      setState(() {
        upcomingCricketMatchList = ValueState(error: "please check your internet connection") ;
      });
      errorSnackBar("please check your internet connection", context);

    }catch(error, stackTrace) {
      setState(() {
        upcomingCricketMatchList = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar(error.toString(), context);
      if (kDebugMode) {
        print("getMatches Error ${error.toString()}");
        print("getMatches Error stackTrace $stackTrace");
      }
    }
  }


  getMyUpComingCricketMatches(BuildContext context) async {
    if(myUpcomingCricketMatchList.value!=null) return;
    try{
      final list  = await _matchRepository.getCricketMatches("upcoming");
      setState(() {
        myUpcomingCricketMatchList = ValueState(value: list);
      });
    } catch(error, stackTrace) {
      setState(() {
        myUpcomingCricketMatchList = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar(error.toString(), context);
      if (kDebugMode) {
        print("getMatches Error ${error.toString()}");
        print("getMatches Error stackTrace $stackTrace");
      }
    }
  }
  
  getMyUpComingFootballMatches(BuildContext context) async {
    if(myUpcomingFootballMatchList.value!=null) return;
    try{
      final list  = await _matchRepository.getCricketMatches("upcoming");
      setState(() {
        myUpcomingFootballMatchList = ValueState(value: list);
      });
    } catch(error, stackTrace) {
      setState(() {
        myUpcomingFootballMatchList = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar(error.toString(), context);
      if (kDebugMode) {
        print("getMatches Error ${error.toString()}");
        print("getMatches Error stackTrace $stackTrace");
      }
    }
  }

  getMyUpcomingMatches(BuildContext context) async{
    if(sport=='Cricket'){
      getMyUpComingCricketMatches(context);
    }else if(sport=='FootBall'){
      getMyUpComingFootballMatches(context);
    }
  }


  getMyLiveCricketMatches(BuildContext context) async{
    if(myLiveCricketMatchList.value!=null) return;
    try{
      final list  = await _matchRepository.getCricketMatches("live");
      setState(() {
        myLiveCricketMatchList = ValueState(value: list);
      });
    } catch(error, stackTrace) {
      setState(() {
        myLiveCricketMatchList = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar(error.toString(), context);
      if (kDebugMode) {
        print("getMatches Error ${error.toString()}");
        print("getMatches Error stackTrace $stackTrace");
      }
    }
  }
  getMyLiveFootballMatches(BuildContext context) async{
    if(myLiveFootballMatchList.value!=null) return;
    try{
      final list  = await _matchRepository.getCricketMatches("live");
      setState(() {
        myLiveFootballMatchList = ValueState(value: list);
      });
    } catch(error, stackTrace) {
      setState(() {
        myLiveFootballMatchList = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar(error.toString(), context);
      if (kDebugMode) {
        print("getMatches Error ${error.toString()}");
        print("getMatches Error stackTrace $stackTrace");
      }
    }

  }

  getMyLiveMatches(BuildContext context) async{
    if(sport=='Cricket'){
      getMyLiveCricketMatches(context);
    }else if(sport=='FootBall'){
      getMyLiveFootballMatches(context);
    }
  }


  getMyPastCricketMatches(BuildContext context) async{
    if(myPastCricketMatchList.value!=null) return;
    try{
      final list  = await _matchRepository.getCricketMatches("completed");
      setState(() {
        myPastCricketMatchList = ValueState(value: list);
      });
    } catch(error, stackTrace) {
      setState(() {
        myPastCricketMatchList = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar(error.toString(), context);
      if (kDebugMode) {
        print("getMatches Error ${error.toString()}");
        print("getMatches Error stackTrace $stackTrace");
      }
    }
  }

  getMyPastFootballMatches(BuildContext context) async{
    if(myPastFootballMatchList.value!=null) return;
    try{
      final list  = await _matchRepository.getCricketMatches("completed");
      setState(() {
        myPastFootballMatchList = ValueState(value: list);
      });
    } catch(error, stackTrace) {
      setState(() {
        myPastFootballMatchList = ValueState(error: "unexpected error please try again") ;
      });

      errorSnackBar(error.toString(), context);
      if (kDebugMode) {
        print("getMatches Error ${error.toString()}");
        print("getMatches Error stackTrace $stackTrace");
      }
    }

  }

  getMyPastMatches(BuildContext context) async{
    if(sport=='Cricket'){
      getMyPastCricketMatches(context);
    }else if(sport=='FootBall'){
      getMyPastFootballMatches(context);
    }
  }




}
