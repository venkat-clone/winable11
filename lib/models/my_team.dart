
import 'package:newsports/models/player.dart';

class MyTeam{
  String sport="";
  String teamName ="";
  String teamA = "";
  String teamB = "";
  String teamAScore ="";
  String teamBScore ="";
  Player captain = Player();
  Player viceCaptain = Player();
  List<Player> players =[];

  MyTeam({
    this.sport = "",
      this.teamName ="",
    this.teamA ="",
    this.teamB = "",
      this.teamAScore ="",
      this.teamBScore = "",
      required this.captain ,
      required this.viceCaptain,
      this.players = const []
  });
}