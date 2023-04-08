

import 'package:newsports/models/winner.dart';

class ContestWinners{
  String id="";
  String prizePool="";
  List<Winner> winners = [];

  ContestWinners.fromJson(Map<String,dynamic> json){
    id = json['id']??"";
    prizePool = json['prize_pool'];
    winners =[];
    (json["team"] as List<dynamic>).forEach((element) {
      winners.add(Winner.fromJson(element));
    });
  }

  ContestWinners({
    this.id = "",
    this.prizePool ="",
    this.winners =const []
  });
}