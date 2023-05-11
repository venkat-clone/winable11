
import 'package:newsports/models/team_players.dart';

class Winner{
  String id ="";
  String name ="";
  String teamId = "";
  String image = "";
  String winingAmount = "";
  String rank ="";
  TeamPlayers team = TeamPlayers();

  Winner.fromJson(Map<String,dynamic> json){
    id = json['user_id'];
    rank = json["rank"].toString()??"";
    image = "https://admin.winable11.com/"+json["image"]??"";
    winingAmount = json["winningAmount"].toString()??"";
    name = json["user_name"].toString()??"";
    team = TeamPlayers.fromJson(json["teamPlayers"]??{});
  }

  Winner({
    this.rank = "", this.name ="", this.image ="", this.winingAmount ="", required this.team });
}