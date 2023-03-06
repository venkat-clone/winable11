import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../base_classes/base_controller.dart';
import '../models/MatchModel.dart';
import '../models/Team.dart';
import '../repository/matches_repository.dart';
import '../repository/team_repository.dart';

class MatchController extends BaseController {
  List<MatchModel> matchList = [];
  List<MatchModel> upCommingMatcheList = [];
  Map<String, Team> teams = {};
  final _matchRepository = MatchesRepository();
  final _teamRepository = TeamRepository();

  getMatches(BuildContext context) {
    lodeWhile(() async {
      _matchRepository.getMatches().then((value) {
        setState(() {
          matchList.addAll(value);
        });
      }).onError((error, stackTrace) {
        snackBar(error.toString(), context);
        if (kDebugMode) {
          print("getMatches Error ${error.toString()}");
          print("getMatches Error stackTrace $stackTrace");
        }
      });
    });
  }

  getUpcommingMatches(BuildContext context) {
    lodeWhile(() async {
      _matchRepository.getUpCommingMatches().then((value) {
        setState(() {
          upCommingMatcheList.addAll(value);
        });
      }).onError((error, stackTrace) {
        snackBar(error.toString(), context);
        if (kDebugMode) {
          print("getMatches Error ${error.toString()}");
          print("getMatches Error stackTrace $stackTrace");
        }
      });
    });
  }

  getTeams(BuildContext context) {
    lodeWhile(() async {
      _teamRepository.getAllTeams().then((value) {
        Map<String, Team> map = Map.fromIterable(value,
            key: (team) => team.teamId, value: (team) => team);
        setState(() {
          teams = map;
        });
      }).onError((error, stackTrace) {
        snackBar(error.toString(), context);
        if (kDebugMode) {
          print("getMatches Error ${error.toString()}");
          print("getMatches Error stackTrace $stackTrace");
        }
      });
    });
  }
}
