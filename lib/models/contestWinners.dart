

import 'package:newsports/models/winner.dart';

import 'Contest.dart';

class ContestWinners {
  String id="";
  String prizePool="";
  Contest contest = Contest();
  List<Winner> winners = [];

  ContestWinners.fromJson(Map<String,dynamic> json){
    id = json['id']??"";
    prizePool = json['prize_pool'];
    winners =[];
    (json["team"] as List<dynamic>).forEach((element) {
      winners.add(Winner.fromJson(element));
    });
  }


  ContestWinners.fromJsonWinners(Map<String,dynamic> json){
    id = json['contest_id']??"";
    prizePool = json['prize_pool']??"";
    winners =[];
    (json["winners_data"]??[]).forEach((element) {
      winners.add(Winner.fromJson(element));
    });
  }

  ContestWinners({
    this.id = "",
    this.prizePool ="",
    this.winners =const []
  });
}