import 'Batsmen.dart';
import 'Batting.dart';
import 'Bowlers.dart';
import 'Bowling.dart';
import 'Fielder.dart';
import 'Review.dart';

class Inning {
  Inning({
      this.id  = 0,
      this.number  = 0,
      this.name  = "",
      this.shortName  = "",
      this.status  = 0,
      this.issuperover  = "",
      this.result  = 0,
      this.battingTeamId  = 0,
      this.fieldingTeamId  = 0,
      this.scores  = "",
      this.scoresFull  = "",
      required this.batsmen,
      required this.bowlers,
      required this.fielder,
      required this.powerplay,
      required this.review,
      required this.didNotBat,
      this.maxOver ="",});

  Inning.fromJson(dynamic json) {
    id = json['iid'];
    number = json['number'];
    name = json['name'];
    shortName = json['short_name'];
    status = json['status'];
    issuperover = json['issuperover'];
    result = json['result'];
    battingTeamId = json['batting_team_id'];
    fieldingTeamId = json['fielding_team_id'];
    scores = json['scores'];
    scoresFull = json['scores_full'];
    if (json['batsmen'] != null) {
      batsmen = [];
      json['batsmen'].forEach((v) {
        batsmen.add(Batsmen.fromJson(v));
      });
    }
    if (json['bowlers'] != null) {
      bowlers = [];
      json['bowlers'].forEach((v) {
        bowlers.add(Bowlers.fromJson(v));
      });
    }
    if (json['fielder'] != null) {
      fielder = [];
      json['fielder'].forEach((v) {
        fielder.add(Fielder.fromJson(v));
      });
    }
    // if (json['powerplay'] != null) {
    //   powerplay = [];
    //   json['powerplay'].forEach((v) {
    //     powerplay.add(Dynamic.fromJson(v));
    //   });
    // }
    review = Review.fromJson(json['review']??{});
    // if (json['did_not_bat'] != null) {
    //   didNotBat = [];
    //   json['did_not_bat'].forEach((v) {
    //     didNotBat.add(Dynamic.fromJson(v));
    //   });
    // }
    maxOver = json['max_over'];
  }
  int id = 0;
  int number = 0;
  String name = "";
  String shortName = "";
  int status = 0;
  String issuperover = "";
  int result = 0;
  int battingTeamId = 0;
  int fieldingTeamId = 0;
  String scores = "";
  String scoresFull = "";
  List<Batsmen> batsmen  =[];
  List<Bowlers> bowlers  =[];
  List<Fielder> fielder  =[];
  List<dynamic> powerplay  =[];
  Review review = Review(batting: Batting(), bowling: Bowling(),);
  List<dynamic> didNotBat  =[];
  String maxOver = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iid'] = id;
    map['number'] = number;
    map['name'] = name;
    map['short_name'] = shortName;
    map['status'] = status;
    map['issuperover'] = issuperover;
    map['result'] = result;
    map['batting_team_id'] = battingTeamId;
    map['fielding_team_id'] = fieldingTeamId;
    map['scores'] = scores;
    map['scores_full'] = scoresFull;
    if (batsmen != null) {
      map['batsmen'] = batsmen.map((v) => v.toJson()).toList();
    }
    if (bowlers != null) {
      map['bowlers'] = bowlers.map((v) => v.toJson()).toList();
    }
    if (fielder != null) {
      map['fielder'] = fielder.map((v) => v.toJson()).toList();
    }
    if (powerplay != null) {
      map['powerplay'] = powerplay.map((v) => v.toJson()).toList();
    }
    if (review != null) {
      map['review'] = review.toJson();
    }
    if (didNotBat != null) {
      map['did_not_bat'] = didNotBat.map((v) => v.toJson()).toList();
    }
    map['max_over'] = maxOver;
    return map;
  }

}