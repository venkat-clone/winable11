


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:newsports/base_classes/base_controller.dart';
import 'package:newsports/repository/team_repository.dart';

import '../models/Team.dart';

class TeamController extends BaseController{
  
  List<Team> teams =[];
  final _teamRepo = TeamRepository();
  
  getTeams(BuildContext context){
    lodeWhile(() async {
      _teamRepo.getAllTeams().then((value) {
        setState(() { teams.addAll(value);});
      }).onError((error, stackTrace) {
        snackBar(error.toString(),context);
        if(kDebugMode){
          print("getMatches Error ${error.toString()}");
          print("getMatches Error stackTrace $stackTrace");
        }
      });
    });
  }
}
