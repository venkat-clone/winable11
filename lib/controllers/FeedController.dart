

import 'package:flutter/cupertino.dart';
import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/base_classes/value_state.dart';
import 'package:newsports/utils/app_execptions.dart';

import '../models/PlayerStats.dart';
import '../models/commentary/MatchComentry.dart';
import '../repository/feedReoisitory.dart';

class FeedController extends BaseController{

  ValueState<MatchCommentary> inning1Commentary = ValueState.loading();
  ValueState<MatchCommentary> inning2Commentary = ValueState.loading();
  ValueState<List<PlayerStats>> stats = ValueState.loading();

  

  FeedRepository _feedRepository = FeedRepository();

  getMatchCommentary(BuildContext context,String matchId,{String inning = "1"}) async{
    // if(inning=="1" && inning1Commentary.value!=null){
    //   return;
    // }
    // if(inning=="2" && inning2Commentary.value!=null){
    //   return;
    // }
    try{
      final result = await _feedRepository.getMatchFeed(matchId, inning);
      if(inning=="1"){
        setState(() {
        inning1Commentary = ValueState(value: result);
        });
      }else{
        setState(() {
        inning2Commentary = ValueState(value: result);
        });
      }
    } on AppException {
      if(inning=="1"){
        setState(() {
          inning1Commentary = ValueState(error: "unexpected Error");
        });
      }else{
        setState(() {
          inning2Commentary = ValueState(error: "unexpected Error");
        });
      }
    }catch(e){
      if(inning=="1"){
        setState(() {
          inning1Commentary = ValueState(error: "unexpected Error");
        });
      }else{
        setState(() {
          inning2Commentary = ValueState(error: "unexpected Error");
        });
      }
      // errorSnackBar("unable to fetch commentary details", context);
    }
  }

  getPlayerStats(BuildContext context,String matchId) async{
    try{
      final list  = await _feedRepository.getPlayerStats(matchId);
      setState(() { stats = ValueState(value: list);});
    }catch(e,s){
      errorSnackBar("something went wrong", context);
      setState(() { stats = ValueState(error: 'something went wrong');});
    }
  }

}