

import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/base_classes/value_state.dart';
import 'package:newsports/repository/matches_repository.dart';
import 'package:newsports/utils/shared_preference_services.dart';

import '../models/MatchModel.dart';
import '../models/MatchWinner.dart';
import '../models/contestWinners.dart';
import '../repository/winners_repository.dart';

class WinnerController extends BaseController{

  String sport = "Cricket";

  ValueState<List<MatchModel>> winnerMatches = ValueState.loading();
  ValueState<List<ContestWinners>> winnerContest = ValueState.loading();
  final repository = WinnersRepository();
  final matchRepository = MatchesRepository();

  getSport() async{
    sport = await SharedPreferenceService.getSport();
  }

  getWinners() async{
    try{
      if (sport == "Cricket") {
        await getCricketWinners();
      } else {
        await getFootBallWinners();
      }
    }catch(e){
      print(e);
      setState(() {
        winnerMatches = ValueState(value: []);
      });
    }
  }

  getCricketWinners() async {
    if(winnerMatches.value!=null)
      return ;
    final result = await matchRepository.getMyCricketMatches();

    setState((){
      winnerMatches = ValueState(value: result.reversed.toList());
    });
  }
  getFootBallWinners(){

  }


  getMatchWinners(String matchId) async{
    try{
      if (sport == "Cricket") {
        await getCricketMatchWinners(matchId);
      } else {
        await getFootBallWinners();
      }
    }catch(e){
      setState(() {
        winnerContest = ValueState(value: []);
      });
    }
  }

  getCricketMatchWinners(String matchId) async{
    final result = await repository.getCricketMatchWinners(matchId);
    setState(() { winnerContest = ValueState(value: result); });
  }

}