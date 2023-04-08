
import 'package:newsports/models/Team.dart';
import 'package:newsports/models/winner.dart';

class MatchWinners{

  String date ="";
  String title = "";
  String id = "";
  Team teamA = Team();
  Team teamB = Team();
  String prizePoll ="";
  List<Winner> winners = [];

  MatchWinners.fromJson(Map<String,dynamic> json){
    date =json['date'];
    title = json['name'];
    id = json['match_id'];
    teamA = Team.fromJson(json['team_a']);
    teamB = Team.fromJson(json['team_b']);
    prizePoll =json['team_c'];
    winners =[];
    (json["team"] as List<dynamic>).forEach((element) {
      winners.add(Winner.fromJson(element));
    });
  }

  MatchWinners({
    this.date ="",
      this.title ="",
    required this.teamA ,
      required this.teamB ,
      this.prizePoll = "",
      this.winners = const []
  });



}

