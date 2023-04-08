import '../Team.dart';
import 'Batting.dart';
import 'Bowling.dart';
import 'MatchStatus.dart';
import 'Inning.dart';
import 'Commentaries.dart';
import 'Review.dart';
import 'Players.dart';

class MatchCommentary {
  MatchCommentary({
    required this.match,
    required this.inning,
    required this.commentaries,
    required this.teams,
    required this.players,
  });

  MatchCommentary.fromJson(dynamic json) {
    match = MatchStatus.fromJson(json['match']??{});
    inning = Inning.fromJson(json['inning']??{}) ;
    if (json['commentaries'] != null) {
      commentaries = [];
      json['commentaries'].forEach((v) {
        commentaries.add(Commentaries.fromJson(v));
      });
    }
    if (json['teams'] != null) {
      teams = [];
      json['teams'].forEach((v) {
        teams.add(Team.fromComeantryJson(v));
      });
    }
    if (json['players'] != null) {
      players = [];
      json['players'].forEach((v) {
        players.add(Players.fromJson(v));
      });
    }
  }
  MatchStatus match = MatchStatus();
  Inning inning = Inning(batsmen: [], bowlers: [], fielder: [], powerplay: [], review: Review(batting: Batting(), bowling: Bowling(),), didNotBat: []);
  List<Commentaries> commentaries =[];
  List<Team> teams =[];
  List<Players> players =[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (match != null) {
      map['match'] = match.toJson();
    }
    if (inning != null) {
      map['inning'] = inning.toJson();
    }
    if (commentaries != null) {
      map['commentaries'] = commentaries.map((v) => v.toJson()).toList();
    }
    if (teams != null) {
      map['teams'] = teams.map((v) => v.toJson()).toList();
    }
    if (players != null) {
      map['players'] = players.map((v) => v.toJson()).toList();
    }
    return map;
  }

}