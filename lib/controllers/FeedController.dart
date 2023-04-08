

import 'package:flutter/cupertino.dart';
import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/base_classes/value_state.dart';

import '../models/commentary/MatchComentry.dart';
import '../repository/feedReoisitory.dart';

class FeedController extends BaseController{

  ValueState<MatchCommentary> inning1Commentary = ValueState.loading();
  ValueState<MatchCommentary> inning2Commentary = ValueState.loading();

  FeedRepository _feedRepository = FeedRepository();

  getMatchCommentary(BuildContext context,String matchId,{String inning = "1"}) async{
    try{
      final result = await _feedRepository.getMatchFeed(matchId, inning);
      if(inning=="1"){
        inning1Commentary = ValueState(value: result);
      }else{
        inning2Commentary = ValueState(value: result);
      }
    }catch(e){
      errorSnackBar("unable to fetch commentary details", context);
    }
  }


}