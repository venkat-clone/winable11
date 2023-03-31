


import 'package:newsports/models/player.dart';
import 'package:newsports/models/userTeamPlayer.dart';

class TeamPlayers{
  List<UserTeamPlayer> players =[];

  int teamACount =0;
  int teamBCount =0;
//contest_id
  //payment_status
  //team_status
  //payment_type
  //entry_fees
  List<UserTeamPlayer> players1 =[];
  List<UserTeamPlayer> players2 =[];
  List<UserTeamPlayer> players3 =[];
  List<UserTeamPlayer> players4 =[];

  String captainId ="";
  String viceCaptainId ="";
  String userId ="";

  String contestId ="";

  String paymentStatus ="";
  String paymentType ="";
  String teamStatus ="";
  String entryFees ="";



  toJson()=>{
    "user_team_players" : {
      "user_id": userId,
      "captain": captainId,
      "vice_captain": viceCaptainId,
      "players": players.map((e) => e.getJsonUpload()).toList()
    }
  };

}